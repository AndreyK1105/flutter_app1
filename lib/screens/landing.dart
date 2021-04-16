
import 'package:flutter/cupertino.dart';
import 'package:flutter_app1/screens/auth.dart';

import 'home.dart';

class LandingPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final bool isLoggetIn = false;
    return isLoggetIn ? HomePage() : AuthPage();
  }
}
