import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/auth.dart';
import 'package:flutter_app1/screens/landing.dart';
import 'package:flutter_app1/service/auth.dart';
import 'package:flutter_app1/service/db.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Db.init();
  await Firebase.initializeApp();
  runApp(MyInitFirebase());
}
class MyInitFirebase extends StatelessWidget {
  final Future <FirebaseApp> _initialis = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamProvider.value(
      value: AuthService().curentUser,
      child: MaterialApp(
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
      ),
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
