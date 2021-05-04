import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_app1/service/word.dart';

class ServDatabase{
  //final FirebaseDatabase _firebaseDatabase = FirebaseDatabase();
  final ref= FirebaseDatabase.instance.reference();
  Future<void> basePut (Word words) async {
    await ref.child("messades").set(words);
  }


}