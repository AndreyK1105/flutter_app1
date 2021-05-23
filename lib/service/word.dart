class Word {
  static String table="word_item";
  int id=0;
  String english="--";
  String russia="--";
  String transcr="--";
  bool complete;

  Word ({this.id, this.english, this.russia, this.transcr, this.complete});

  Word.fromJson (Map<String, dynamic> data ){
    english=data["inglish"];
    russia= data["russia"];
    transcr=data["transcr"];
  }

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {
      "english": english,
      "russia": russia,
      "transcr": transcr,
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
        complete: map["complete"]==1
    );
  }


  // Word (this._english, this._russia,this._transcr, this.id){

  //  }

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