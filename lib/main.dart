import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/auth.dart';
import 'package:flutter_app1/screens/landing.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyInitFirebase());
}
class MyInitFirebase extends StatelessWidget {
  final Future <FirebaseApp> _initialis = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        theme: ThemeData(
          textTheme: TextTheme(bodyText2: TextStyle(color: Colors.deepOrange,
              fontSize: 23,
              fontWeight: FontWeight.bold)),
          primaryColor: Colors.greenAccent,
          splashColor: Colors.amber,

        ),
        themeMode: ThemeMode.system,
        title: "hkc",
        home: Scaffold(
            body:
          FutureBuilder(
             future: _initialis,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print("error");
                  return Text("Error");
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return MyApp();
                }
                return Container(child: Text("on"),);
              },
            )


        )
    );
  }
}


class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  return LandingPage();

  }
}
