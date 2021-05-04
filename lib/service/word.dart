class Word {
  int id=0;
   String _english="--";
   String _russia="--";
   String _transcr="--";



 // Word (this._english, this._russia,this._transcr, this.id){

 //  }

  set english(String value) {
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
}