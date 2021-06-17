import 'dart:core';

import 'dart:core';

class Word {
  static String table="word_item";
  int id=0;
   String english="--";
   String russia="--";
   String transcr="--";
   int dataAdd=0;
   int rating=0;
   int lesson=0;
   bool complete;




  Word ({this.id, this.english, this.russia, this.transcr, this.complete, this.dataAdd, this.rating, this.lesson});

  Word.fromJson (Map<String, dynamic> data ){
    english=data["inglish"];
    russia= data["russia"];
    transcr=data["transcr"];
    dataAdd=data["dataAdd"];
    rating=data["rating"];
    lesson=data["lesson"];
  }


  
  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {
      "english": english,
      "russia": russia,
      "transcr": transcr,
      "dataAdd": dataAdd,
      "rating": rating,
      "lesson": lesson,
    "complete": complete
    };
    if (id!=null){map["id"]=id;}
    return map;
 }

 static Word fromMap(Map<String, dynamic>map){
    return Word(
      id: map["id"],
      english:map["english"],
      russia: map["russia"],
      transcr: map["transcr"],
      dataAdd: map["dataAdd"],
      rating: map["rating"],
      lesson: map["lesson"],
      complete: map["complete"]==1
    );
 }
  set english1(String value) {
    english = value;
  }
  /*set english(String value) {
    _english = value;
  }

  String get english => _english;

  String get transcr => _transcr;

  String get russia => _russia;

  set russia(String value) {
    _russia = value;
  }

  set transcr(String value) {
    _transcr = value;
  }
  */

}