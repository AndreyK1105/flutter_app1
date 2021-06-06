import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/service/db.dart';
import 'package:flutter_app1/service/word.dart';

class ListDb extends StatefulWidget {
  final String title="";

  @override
  _MyHomePageState createState() => _MyHomePageState();

}
class  _MyHomePageState extends State <ListDb>{

  String _english;
  String _russia;
  String _transcr;
  List <Word> _tasks=[];
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

  @override
  void initState() {

    refresh();
    super.initState();
  }

  void refresh() async {

    List<Map<String, dynamic>> _results = await Db.query(Word.table);
    _tasks = _results.map((item) => Word.fromMap(item)).toList();
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
                    TextField(
                      autofocus: true,
                      decoration: InputDecoration(labelText: 'English word', hintText: item.english),
                      onChanged: (value) { item.english = value; },

                    ),
                    TextField(
                      autofocus: false,
                      decoration: InputDecoration(labelText: 'Перевод на русский', counterText: item.russia, hintText: item.russia),
                      onChanged: (value) { item.russia=value; },
                    ),
                    TextField(
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
        appBar: AppBar( title: Text(widget.title), toolbarHeight: 40, ),
        body: Align(alignment: Alignment.centerLeft,
          child: Padding( padding: EdgeInsets.fromLTRB(3, 5, 1, 5),
            child:ListView(children: _items),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () { _create(context); },
          tooltip: 'New TODO',
          child: Icon(Icons.library_add),
        )
    );
  }


}