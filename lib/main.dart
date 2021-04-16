import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/auth.dart';
import 'package:flutter_app1/screens/landing.dart';

void main() {
  runApp(
    MaterialApp(
        theme: ThemeData(
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.deepOrange, fontSize: 23, fontWeight: FontWeight.bold )),
         primaryColor: Colors.greenAccent,
          splashColor: Colors.amber,

        ),
        themeMode: ThemeMode.system,
        title: "hkc",
        home: LandingPage()
    )
    );

}
