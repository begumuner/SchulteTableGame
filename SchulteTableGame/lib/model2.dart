class High {
  int high;


  High({this.high});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    
    map["high"] = high;

    return map;
  }

  High.fromMap(Map<String, dynamic> map) {
    this.high = map["high"];
  }
}
