import 'package:flutter/material.dart';
import 'package:bookland/kategoriDetay.dart';
import 'package:bookland/baslik.dart';
import 'menuIconSayfasi.dart';

void main() {
  runApp(kategori());
}

final List<String> categories = [
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
                  baslik("Kategoriler", context),
                  SizedBox(
                    height: 16,
                  ),
                  Expanded(
                      child: ListView(
                    children: categories
                        .map((String title) => kategoriler(title, context))
                        .toList(),
                  ))
                ],
              ),
            ),
            menuIconSayfasi("menu"),
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
      padding: EdgeInsets.all(24),
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
          style: TextStyle(
              color: Colors.brown, fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    ),
  );
}
