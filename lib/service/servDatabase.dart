import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_app1/service/word.dart';

class ServDatabase{
  //final FirebaseDatabase _firebaseDatabase = FirebaseDatabase();
  final ref= FirebaseDatabase.instance.reference();

  Future<void> basePut (String word, String russia, String transcr) async {
    await ref.child("Dictionary").child(word).child("russia"). set(russia);
    await ref.child("Dictionary").child(word).child("transcr").set(transcr);
  }


}