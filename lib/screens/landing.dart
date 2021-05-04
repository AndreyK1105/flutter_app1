import 'package:flutter/cupertino.dart';
import 'package:flutter_app1/screens/auth.dart';
import 'package:flutter_app1/service/user.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class LandingPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final User1 user1=Provider.of<User1>(context);
    final  bool isLoggetIn = user1!=null;
    return

      isLoggetIn ? AuthPage():HomePage();
  }

}
