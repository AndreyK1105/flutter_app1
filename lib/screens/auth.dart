import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/service/auth.dart';
import 'package:flutter_app1/service/servDatabase.dart';
import 'package:flutter_app1/service/word.dart';

class AuthPage extends StatefulWidget{
  @override

  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>{
final TextEditingController _editingController=TextEditingController();
final ServDatabase servDatabase = ServDatabase();
  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return Padding(padding: EdgeInsets.only(top: 100),
      child: Container(
        child:Align(
          child: Column(
            children: [
              Text("TEST  cc",style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white),),
              TextField(controller:_editingController,
              decoration: InputDecoration(hintText: "descr"),),
              ElevatedButton(onPressed: (){
                Word word= Word();
                word.english="book";
                word.russia="sd";
                word.transcr="df";
                word.id=1;
                servDatabase.basePut(word);

              }, child: Text("go"))

            ],
          ),
        ),
        ),);
    };

    return Scaffold(
      appBar: AppBar(title: Text("app bar"),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.outbox), onPressed: (){AuthService().logOut();})
      ],),
      backgroundColor: Theme.of(context).primaryColor,
      //appBar: AppBar(title: Text("Title", style: TextStyle(fontSize: 25),) ),
      body: Column(
        children: <Widget>[
          _logo(),

        //_form,
        ],
      ),
    );
  }

}
