import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OutList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  // DocumentReference users = FirebaseFirestore.instance.collection('word').doc("3MH3TwN2t30qZ69spAuC");
    CollectionReference collect = FirebaseFirestore.instance.collection("word");
    return Scaffold(
      body:
      StreamBuilder<QuerySnapshot>(

        stream: collect.snapshots(),

        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          return new ListView(

          children: snapshot.data.docs.map((DocumentSnapshot document)
          {
            return new ListTile(
              title: new Text(document.get("inglish")),
              subtitle: new Text(document.get("russia")),

            );
          }).toList(),

      );
      }
    )
    );
}
}