import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class MyApp1 extends StatelessWidget{
  final Future <FirebaseApp> _initializition = Firebase.initializeApp();
  //FirebaseApp app ;


// MyApp1({Key key, this.app}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:   Container(

          child:   Scaffold(

            body: Column(

              children: [
                Container(width: 0, height: 100,),
                Text("FFF", style: TextStyle(fontSize: 30),),

                FutureBuilder(

                    future: _initializition,

                    builder: (context, snapshot){

                      if(snapshot.hasError){

                        print("hasError");
                        Text ("error");



                      }

                      if(snapshot.connectionState== ConnectionState.done){

                        print("done");
                        return
                          Container(

                            child: Text("Done"),

                          );

                      }
                      return
                        Container(

                          child: Text("Test"),

                        );

                    }

                ),
                ElevatedButton(onPressed: (){
                 //final FirebaseApp app = FirebaseApp (name:"default");
                  _base();
                  }, child: Text("auth instanse"),),

                ElevatedButton(onPressed: (){
                  final FirebaseAuth auth =FirebaseAuth.instance;
                  auth.createUserWithEmailAndPassword(email: "email@mail.ru", password: "1234Qwer");
                }, child: Text("creatUser")),
                ElevatedButton(onPressed: (){
                  final FirebaseAuth auth =FirebaseAuth.instance;
                  auth.signInWithEmailAndPassword(email: "email@mail.ru", password: "1234Qwer");
                }, child: Text("in")),
              ElevatedButton(onPressed: (){
      final FirebaseAuth auth =FirebaseAuth.instance;
      auth.signOut();
      }, child: Text("Out")),




              ],

            ),

          )

      ),
    );



  }
  Future<void> _base() async {
    //final FirebaseApp app1 = await Firebase.initializeApp();

    final FirebaseDatabase database = FirebaseDatabase();
  final  ref = FirebaseDatabase.instance.reference();
  final _messegRef = database.reference().child("messages");
 //await _messegRef.child("mes").push();
//  database.reference().push().child("mess");
  await ref.child("messades").set("dsajhga");

  }

}