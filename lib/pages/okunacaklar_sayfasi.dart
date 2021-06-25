import 'package:bookland/data/okunacaklar_servis.dart';
import 'package:bookland/models/okunacaklar.dart';
import 'package:flutter/material.dart';

class OkunacaklarSayfasi extends StatelessWidget {
  OkunacaklarServis todoService = OkunacaklarServis.instance;
  final kitapAdiKonrol = TextEditingController();
  final aciklamaKontrol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final titleField = TextFormField(
      controller: kitapAdiKonrol,
      decoration: InputDecoration(
        hintText: "Kitap Adı",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
    final descriptionField = TextFormField(
      controller: aciklamaKontrol,
      //maxLines: 5,
      decoration: InputDecoration(
        hintText: "Bir günde okunacak sayfa sayısı",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
    final kaydetButon = FlatButton(
      onPressed: () {
        todoService
            .ekleOkunacaklar(Okunacaklar(
                id: null,
                kitapAdi: kitapAdiKonrol.text,
                aciklama: aciklamaKontrol.text,
                yapildiMi: false))
            .then((value) => Navigator.pop(context));
      },
      child: Text("Kaydet"),
      color: Colors.brown,
    );

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Text("Kitap Ekle"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: titleField,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: descriptionField,
            ),
            kaydetButon
          ],
        ));
  }
}
