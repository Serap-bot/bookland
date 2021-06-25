import 'package:bookland/sabitler.dart';
import 'package:flutter/material.dart';
import 'package:bookland/kategoriDetay.dart';
import 'package:bookland/baslik.dart';
import 'menuIconSayfasi.dart';

void main() {
  runApp(kategori());
}

/*final Map<String,Kitap> kategorilerListesi = [
  "TÜM KİTAPLAR":"tarihKitap",
  "DÜNYA KLASİKLERİ":"dünyaKitap",
  "FELSEFE":"felsefeKitap",
  "TARİH":"tarihKitap",
  "AKADEMİK":"akademikKitap",
  "ŞİİR":"siirKitap"
];
*/
final List<String> kategorilerListesi = [
  "TÜM KİTAPLAR",
  "DÜNYA KLASİKLERİ",
  "FELSEFE",
  "TARİH",
  "AKADEMİK",
  "ŞİİR"
];

class kategori extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  baslik("KATEGORİLER", context),
                  SizedBox(
                    height: 21,
                  ),
                  Expanded(
                      child: ListView(
                    children: kategorilerListesi
                        .map((String title) => kategoriler(title, context))
                        .toList(),
                  ))
                ],
              ),
            ),
            menuIconSayfasi("kategoriler"),
          ],
        ),
      ),
    );
  }
}

Widget kategoriler(String sayfabaslik, context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return KategoriDetay(sayfabaslik);
      }));
    },
    child: Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(color: Colors.brown.withOpacity(0.25), blurRadius: 4)
          ]),
      child: Center(
        child: Text(
          sayfabaslik,
          style: kMetinStili,
        ),
      ),
    ),
  );
}
