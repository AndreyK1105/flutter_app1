
import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/service/db.dart';
import 'package:flutter_app1/service/word.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class Workout extends StatefulWidget {


  @override
  _Workout  createState() =>_Workout();
}
  class _Workout extends State <Workout>{

    bool _selected=true;
    bool _choceEngl=true;
    bool _choceRus=false;
    bool _choceEnglRus=false;
  String _langWorkout="eng";
  bool _englishWorkout=true;
  bool _rusianWorkout=false;
  File _image;
  File _image2;
  final picker= ImagePicker();
  String path;
    String path2;
    List <Word> _tasks;
    int leght;
    List <int> indexRnd;
    List <int> rndIndex;
    int indexWork=0;

 //
    @override
    initState() {
      refreshDb();
      super.initState();
    }
   void refreshDb()async{
      List<Map<String, dynamic>> _results = await Db.query(Word.table);
      _tasks = _results.map((item) => Word.fromMap(item)).toList();
      leght= _tasks.length;
      setState(() {
        refreshIndexRnd();
      });



    }

    void refreshIndexRnd() {
      indexRnd = List.filled(leght, null);
      rndIndex = List.filled(leght, null);
      Random random = Random();
      int index;
      for (int i = 0; i < leght; i++) {
        do {
          index = random.nextInt(leght);
        }
        while (rndIndex[index] != null);
        indexRnd[i] = index;
        rndIndex[index] = i;

        print('i==$i  Index==$index');
      }
    }





    Future<String> get _localPath async {
      final directory = await getApplicationDocumentsDirectory();
      path2=directory.path+'/image.jpg';
      print(directory.path);

      return path2;
    }

  Future getImage() async{
final picker=ImagePicker();
    final directory = await getApplicationDocumentsDirectory();
    final path =directory.path;
    print(directory.path);

    final  pickedFile= await picker.getImage(source: ImageSource.camera);

     File  newImage= await File(pickedFile.path).copy("$path/image.jpg");
     setState(() {
       if (pickedFile!=null){
         _image=File(pickedFile.path);
         _image2=newImage;
         String _name=extension(pickedFile.path);
         print('name ********: $_name');
       }
       else {
         print ('no file');
       }
     });

  }

  void _saveLang(){
    //Navigator.of(context).pop() ;

  }


  @override
  Widget build(BuildContext context) {

    Widget wordQueschon () {
      if (_tasks == null) {
        return Text('null');
      }
      else {


        if (_langWorkout=="eng"){
          return Text(_tasks[rndIndex[indexWork]].english);
        }else if(_langWorkout=="rus"){
          Text(_tasks[rndIndex[indexWork]].russia);
        }else if(_langWorkout=="eng/rus") {
          Random rnd = Random();
          if (rnd.nextInt(2) == 0) {
            return Text(_tasks[rndIndex[indexWork]].russia);
          }
          else {
            return Text(_tasks[rndIndex[indexWork]].english);
          }
        }
        return Text(_tasks[rndIndex[indexWork]].russia);

      }
    }

    Widget _choiceEngl(){return
      ChoiceChip(label: Text("English"),
        selected: _choceEngl,
        onSelected: (value){
          setState(() {
            _choceEngl=!_choceEngl;
            if(_choceRus)_choceRus=!_choceRus;
            if(_choceEnglRus)_choceEnglRus=!_choceEnglRus;
            _langWorkout="eng";
            Navigator.of(context).pop();

            print('_choceEngl$_choceEngl');
          });
        },
      );
    }


    Widget _choiceRus(){return
      ChoiceChip(label: Text("Русский"), selected: _choceRus,
        onSelected: (value){
          setState(() {
            if(_choceEngl)_choceEngl=!_choceEngl;
            _choceRus=!_choceRus;
            if(_choceEnglRus) _choceEnglRus=!_choceEnglRus;
            _langWorkout="rus";
            Navigator.of(context).pop();
            print('_choceEngl$_choceEngl');
          });
        },
      );
    }
    Widget _choiceEnlRus(){return
      ChoiceChip(label: Text("English/Rus"), selected: _choceEnglRus,
        onSelected: (value){
          setState(() {
            _choceEnglRus=!_choceEnglRus;
            if(_choceEngl)_choceEngl=!_choceEngl;
            if(_choceRus)_choceRus=!_choceRus;
            _langWorkout="eng/rus";
            Navigator.of(context).pop();

            print('_choceEngl$_choceEngl');
          });
        },
      );
    }
    Widget _choceList() {
      if (_choceEngl) {
        return Column(
          children: [
            _choiceRus(), _choiceEnlRus()
          ],
        );
      }
      if (_choceRus) {
        return
          Column(
            children: [_choiceEngl(), _choiceEnlRus()],
          );
      }
      if (_choceEnglRus) {
        return
          Column(
            children: [_choiceEngl(), _choiceRus()],
          );
      }
      return Text("Text");
    }



    // TODO: implement build
  int  _value=2;

    return Scaffold(

      appBar: AppBar(title:Text("Workout"),actions: <Widget> [
        IconButton(
          icon: Icon(Icons.language),
          onPressed: (){
            showDialog(context: context,
                builder: (BuildContext context){
              return AlertDialog(
                title: Text("выбор языка"),
                actions: <Widget>[
                  TextButton(
                      child: Text('Cancel'),
                      onPressed: () => Navigator.of(context).pop()
                  ),
                  TextButton(
                      child: Text('Save'),
                      onPressed: () => {_rusianWorkout=true, }
                  )
                ],
                content:
                 _choceList(),
              );
                },);
          },
        ),
        Text(_langWorkout),
        IconButton(icon: Icon(Icons.not_started_outlined), onPressed: (){
          setState(() {
            refreshIndexRnd();
            indexWork=0;
          });


        }),
      ],),
      body:  Column(
        children: [
          Row(
            children: [
              wordQueschon(),


              IconButton(icon: Icon(Icons.edit), onPressed: (){}),
              Text(indexWork.toString())
            ],
          ),
         Container(height: 100,),
         Row(
           children: [
             Expanded(child: TextField()),
             ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.wb_incandescent_outlined), label: Text('?'))
           ],
         ),
          Container(height: 100,),
         Row(
           children: [
             ElevatedButton(onPressed: (){
               setState(() {
                 if (indexWork<leght-1){
                   indexWork++;
                 }
               });
             }, child: Text("Знаю")),
             Container(width: 150,),
             ElevatedButton(onPressed: (){}, child: Text("НеЗнаю")),
           ],
         ),
         /* Row(
            children:[
             Container(
               width: 300, height: 200,
               child: _image == null
                 ? Center(child: Text('No image selected.'))
                 : Image.file(_image),),
              IconButton(icon: Icon(Icons.edit), onPressed: (){getImage();}),
    ]
          ),

          */

          Container(width: 300, height: 200,
            child:_image2==null?
            Text('w'): Image.file(_image2),
            // ,



                   //
          )

        ],
      )


    );

    throw UnimplementedError();
  }

  }

