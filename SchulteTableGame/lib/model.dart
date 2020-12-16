class Puanlar {
  String puan;


  Puanlar({this.puan});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    
    map["puan"] = puan;

    return map;
  }

  Puanlar.fromMap(Map<String, dynamic> map) {
    this.puan = map["puan"];
  }
}
