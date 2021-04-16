import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget{
  @override

  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>{

  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return Padding(padding: EdgeInsets.only(top: 100),
      child: Container(
        child:Align(
          child: Text("TEST",style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white),),
        ),
        ),);
    };

    return Scaffold(
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
