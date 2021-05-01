import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/auth.dart';
import 'package:flutter_app1/screens/landing.dart';
import 'package:flutter_app1/screens/test.dart';
import 'package:flutter_app1/service/auth.dart';
import 'package:provider/provider.dart';

import 'service/user.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MyApp());}

  


class MyApp extends StatelessWidget{
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
       future: _initialization,
    builder: (context, snapshot){
         if(snapshot.hasError){
           print("error");
           return Text ('error');

         }
         if(snapshot.connectionState==ConnectionState.done){
           return StreamProvider<User1>.value(
               value: AuthService().curentUser,


             child: MaterialApp(
                 theme: ThemeData(
                   textTheme: TextTheme(
                       bodyText2: TextStyle(color: Colors.deepOrange,
                           fontSize: 23,
                           fontWeight: FontWeight.bold)),
                   primaryColor: Colors.greenAccent,
                   splashColor: Colors.amber,

                 ),
                 themeMode: ThemeMode.system,
                 title: "hkc",
                 home: LandingPage()

             ),
           );
         }
          print("load");

    }
    );
  }
}


