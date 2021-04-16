import 'package:firebase_auth/firebase_auth.dart';

class User1 {
  String _id;
  User1.fromFirebase(User user){
    _id=user.uid;
  }
}