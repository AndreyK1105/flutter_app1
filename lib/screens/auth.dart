import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/service/auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthPage extends StatefulWidget{
  @override

  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>{
  TextEditingController _controllerEmail =TextEditingController();
  TextEditingController _controllerPass =TextEditingController();
 // final Future<FirebaseApp> _firebaseApp = Firebase.initializeApp();
  AuthService _authService=AuthService();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(controller: _controllerEmail,
          decoration: InputDecoration(hintText: "email"),),
        TextField(controller: _controllerPass,
          decoration: InputDecoration(hintText: "pass"),),
        ElevatedButton(onPressed: _butonIn, child: Text("sign")),


      ],
    );
  }
    /*
    Widget _logo() {
      return Padding(padding: EdgeInsets.only(top: 100),
      child: Container(
        child:Align(
          child: Text("TEST",style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white),),
        ),
        ),);
    };

    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshop){
          if(snapshop.hasError){
           return Text ("hasError") ;
          } else if(snapshop.hasData){
            Scaffold(
              backgroundColor: Theme.of(context).primaryColor,
              //appBar: AppBar(title: Text("Title", style: TextStyle(fontSize: 25),) ),
              body: Column(
                children: <Widget>[

                  _logo(),
                  _form(),
                  ElevatedButton( child: Text("sign"),
                     onPressed: (){
                        //_authService.registerWhithEmailAndPassword(_controllerEmail.text.toString(), _controllerPass.text.toString());
                      })
                ],
              ),
            );
          } else {
            return Center(child: Text("rrrr"));
          }
        });

  }

     */
void _butonIn () async{
   await _authService.signInWhithEmailAndPassword(_controllerEmail.text, _controllerPass.text);
}

}
