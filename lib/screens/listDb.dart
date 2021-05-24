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
  String _task;
  List <Word> _tasks=[];
  TextStyle _style = TextStyle(color: Colors.white, fontSize: 24);

  Widget format(Word item){
    return Align(alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Text(item.id.toString()),
          Text("english: " +item.english, style: _style,),
          Text("russia: "+item.russia),
          Text(item.transcr),
          Text("  "),
        ],
      ),
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

  void _save() async {
    Navigator.of(context).pop();
    Word item = Word(
        english: _task,
        russia: "",
        transcr: "",
        complete: false
    );
    await Db.insert(Word.table, item);
    setState(() => _task = '');
    refresh();

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
            content: TextField(
              autofocus: true,
              decoration: InputDecoration(labelText: 'Task Name', hintText: 'e.g. pick up bread'),
              onChanged: (value) { _task = value; },
            ),
          );
        }
    );
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar( title: Text(widget.title) ),
        body: Align(alignment: Alignment.centerLeft,
          child: Padding( padding: EdgeInsets.fromLTRB(1, 5, 1, 5),
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