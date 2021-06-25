import 'package:flutter/foundation.dart';

class Okunacaklar {
  int id;
  String kitapAdi;
  String aciklama;
  bool yapildiMi;

  Okunacaklar({this.id, this.kitapAdi, this.aciklama, this.yapildiMi});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map["id"] = id;
    }
    map["kitapAdi"] = kitapAdi;
    map["aciklama"] = aciklama;
    map["yapildiMi"] = yapildiMi ? 1 : 0;
    return map;
  }

  factory Okunacaklar.fromMap(Map<String, dynamic> map) {
    return Okunacaklar(
        id: map["id"],
        kitapAdi: map["kitapAdi"],
        aciklama: map["aciklama"],
        yapildiMi: map["yapildiMi"] == 1);
  }
}
