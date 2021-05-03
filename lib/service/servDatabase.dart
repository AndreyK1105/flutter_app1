import 'package:firebase_database/firebase_database.dart';

class ServDatabase{
  //final FirebaseDatabase _firebaseDatabase = FirebaseDatabase();
  final ref= FirebaseDatabase.instance.reference();
  Future<void> basePut (String text) async {
    await ref.child("messades").set(text);
  }


}