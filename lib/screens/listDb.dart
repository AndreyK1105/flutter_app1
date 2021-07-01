import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/workout.dart';
import 'package:flutter_app1/service/db.dart';
import 'package:flutter_app1/service/word.dart';

class ListDb extends StatefulWidget {
  final String title="";

  @override
  _MyHomePageState createState() => _MyHomePageState();

}
class  _MyHomePageState extends State <ListDb>{

  String _english="tt";
  String _russia;
  String _transcr;
  String _titleAppbar="";
  List <Word> _tasks=[];
  Word _task1;
  TextStyle _style = TextStyle(color: Colors.amberAccent, fontSize: 17);
  TextStyle _style1 = TextStyle(color: Colors.white, fontSize: 20);

  Widget format(Word item){
    if (item.english == null){item.english="не задано";}
    if (item.russia == null){item.russia="не задано";}
    if (item.transcr == null){item.transcr="не задано";}
    return
      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Column( crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text("id: ", style: _style,),
                    Text(item.id.toString(), style: _style1,),
                  ],
                ),
                Row(
                  children: [
                    Text("english: " , style: _style,),
                    Text(item.english, style: _style1,),
                  ],
                ),

                Row(
                  children: [
                    Text("russia:  ",style: _style,),
                    Text(item.russia,style: _style1,),
                  ],
                ),
                Row(
                  children: [
                    Text("transcr:",style: _style,),
                    Text(item.transcr,style: _style1,),
                  ],
                ),
                Row(
                  children: [
                    Text("Data Add:",style: _style,),
                    Text(DateTime.fromMillisecondsSinceEpoch(item.dataAdd).toLocal().toString().substring(0,10),style: _style1,),

                  ],
                ),
                // Text(""),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: ElevatedButton(onPressed:() {_delete(item);},style: ButtonStyle
              (backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                minimumSize:MaterialStateProperty.all(Size(60, 60)), padding: MaterialStateProperty.all(EdgeInsets.zero)  ),child:  Text("delete")),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: ElevatedButton(onPressed:() {_update1(context, item);}, style: ButtonStyle
              (minimumSize:MaterialStateProperty.all(Size(60,60)), padding: MaterialStateProperty.all(EdgeInsets.zero) ), child: Align(alignment: Alignment.centerRight, child: Text("update"))),
          )
        ],
      );

  }
  List<Widget>get _items => _tasks.map((item) => format(item)).toList();
  //Word get _items1 (int i)=>_tasks[i];


  @override
  void initState() {

    refresh();
    super.initState();
  }

  void refresh() async {

    List<Map<String, dynamic>> _results = await Db.query(Word.table);
    _tasks = _results.map((item) => Word.fromMap(item)).toList();
    _task1=_tasks[_tasks.length-2];

   _titleAppbar=_task1.english==null?"null":_task1.english;

    setState(() { });

  }
  void _delete(Word item) async {
    await Db.delete(Word.table, item);
    refresh();
  }
  void _save() async {
    Navigator.of(context).pop();
    Word item = Word(

        english: _english,
        russia: _russia,
        transcr: _transcr,
        dataAdd: DateTime.now().millisecondsSinceEpoch,
        complete: false
    );
    await Db.insert(Word.table, item);
    setState(() =>{ _english = '', _russia="", _transcr=""});
    refresh();

  }
  void _saveupdate(Word item) async {
    Navigator.of(context).pop();

    await Db.update(Word.table, item);
    setState(() => { _english = '', _russia = "", _transcr = ""});
    refresh();
  }

  void _update1(BuildContext context, Word item){

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Update Task"),
              actions: <Widget>[
                TextButton(
                    child: Text('Cancel'),
                    onPressed: () => Navigator.of(context).pop()
                ),
                TextButton(
                    child: Text('Save'),
                    onPressed: () => _saveupdate(item)
                )
              ],
              content:
              Column(
                  children:[
                    TextFormField(
                      initialValue: item.english,
                      autofocus: true,
                      decoration: InputDecoration(labelText: 'English word'),
                      onChanged: (value) { item.english = value; },

                    ),
                    TextFormField(
                      autofocus: false,
                      initialValue: item.russia,
                      decoration: InputDecoration(labelText: 'Перевод на русский', counterText: item.russia, hintText: item.russia),
                      onChanged: (value) { item.russia=value; },
                    ),
                    TextFormField(
                      initialValue: item.transcr,
                      autofocus: false,
                      decoration: InputDecoration(labelText: 'транскрипция', hintText: item.transcr),
                      onChanged: (value) { item.transcr=value; },
                    ),

                  ]
              )
          );
        }
    );
  }


  void _create(BuildContext context) {



    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Create New Task"),
              actions: <Widget>[
                TextButton(
                    child: Text('Cancel'),
                    onPressed: () => Navigator.of(context).pop()
                ),
                TextButton(
                    child: Text('Save'),
                    onPressed: () => _save()
                )
              ],
              content:
              Column(
                  children:[
                    TextField(
                      autofocus: true,
                      decoration: InputDecoration(labelText: 'English word', hintText: 'english'),
                      onChanged: (value) { _english = value; },

                    ),
                    TextField(
                      autofocus: false,
                      decoration: InputDecoration(labelText: 'Перевод на русский', hintText: 'russia'),
                      onChanged: (value) { _russia=value; },
                    ),
                    TextField(
                      autofocus: false,
                      decoration: InputDecoration(labelText: 'транскрипция', hintText: 'transcr'),
                      onChanged: (value) { _transcr=value; },
                    ),

                  ]
              )
          );
        }
    );
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar( title: Text("ret $_titleAppbar"), toolbarHeight: 40,actions: [IconButton(icon: Icon(Icons.auto_stories),
          onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Workout()),
          );},)], ),
        body: Align(alignment: Alignment.centerLeft,
          child: Padding( padding: EdgeInsets.fromLTRB(3, 5, 1, 5),
            child:


                    ListView.builder(
                        itemCount: _items.length,
                        itemBuilder:(BuildContext context, int index){
                          return _items[index];
                        }


            ),


        ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () { _create(context); },
          tooltip: 'New TODO',
          child: Icon(Icons.library_add),
        ),

    );
  }


}