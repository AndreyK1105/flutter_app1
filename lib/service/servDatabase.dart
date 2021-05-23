import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app1/service/word.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class ServDatabase{
  //final FirebaseDatabase _firebaseDatabase = FirebaseDatabase();
  final ref= FirebaseDatabase.instance.reference();
  final CollectionReference firestore =FirebaseFirestore.instance.collection("word");


  Future <void> basePut (String word, String russia, String transcr){
    return
        firestore.add({"inglish": word, "russia": russia, "transcr": transcr})
        .then((value) => print("word added"))
        .catchError((error) => print("error: $error"));
  }



/*
    FutureBuilder <DocumentSnapshot>(
        future: firestore.doc("6I7dKMvr62vesrFV1vgt").get(),
       // ignore: missing_return,
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if(snapshot.hasError){

            print("error");

          }
          if(snapshot.hasData && !snapshot.data.exists){print("Document does not exist");}
          if (snapshot.connectionState==ConnectionState.done){
            Map<String, dynamic> data = snapshot.data.data();
            print("Full name: ${data["inglish"]} ${data["russia"]}");
            return Text(data["inglish"]);
          }
          print("loading");

        },
    );
*/
}
