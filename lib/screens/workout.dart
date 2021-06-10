import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  void _saveLang(){
    Navigator.of(context).pop() ;

  }


  @override
  Widget build(BuildContext context) {

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

            print(_choceEngl);
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
            print(_choceEngl);
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

            print(_choceEngl);
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
        IconButton(icon: Icon(Icons.not_started_outlined), onPressed: (){}),
      ],),
      body:  Wrap(
    children: List<Widget>.generate(
      4,
          (int index) {

        return ChoiceChip(
          label: Text('Item $index'),
          selected: _selected,
          onSelected: (bool selected) {
            setState(() {
              print("_selected$_selected");
              _selected=!_selected;

              _value = selected ? index : null;

              print("_selected$_selected");
             // if(_selected==true){_selected=!_selected; print("_selected$_selected");}

            });
          },
          selectedColor: Colors.blue,
        );
      },
    ).toList(),
    )


    );

    throw UnimplementedError();
  }

  }

