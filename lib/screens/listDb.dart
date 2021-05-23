import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/service/word.dart';

class ListDb extends StatefulWidget {
 final String title="";

  @override
  _MyHomePageState createState() => _MyHomePageState();

}
class  _MyHomePageState extends State <ListDb>{
  @override
  Widget build(BuildContext context) {
    String _task;
    List <Word> _tasks=[];
    TextStyle _style = TextStyle(color: Colors.white, fontSize: 24);

    Widget format(Word item){
return Row(
  children: [
        Text(item.id.toString()),
        Text(item.english),
        Text(item.russia),
        Text(item.transcr),
  ],
);
    }
    List<Widget> _items() => _tasks.map((item) => format(item)).toList();


    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar( title: Text(widget.title) ),
        body: Center(
            child: ListView( children: _items )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () { _create(context); },
          tooltip: 'New TODO',
          child: Icon(Icons.library_add),
        )
    );
  }


}