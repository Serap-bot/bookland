import 'package:bookland/pages/okunacak.dart';
import 'package:bookland/pages/okunacaklar_listesi.dart';
import 'package:bookland/sabitler.dart';
import 'package:flutter/material.dart';
import 'package:bookland/menuIconSayfasi.dart';
import 'package:bookland/kategoriler.dart';
import 'package:bookland/etiket.dart';

import 'favoriKitap.dart';

class HomePage extends StatefulWidget {
  final kullaniciAdi;
  const HomePage({Key key, @required this.kullaniciAdi}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.0),
              child: ListView(
                children: <Widget>[
                  bookland(),
                  Text(
                      widget.kullaniciAdi == null
                          ? "Kullanici Yok"
                          : widget.kullaniciAdi,
                      style: TextStyle(color: Colors.brown)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                    child: Column(
                      children: <Widget>[
                        girisKitaplar(
                            kategoriButon: 'KATEGORİLER',
                            resimUrl: 'assets/images/kategoriler1.jpg',
                            widget: kategori(),
                            context: context),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  Center(
                    child: Text('Yeniler', style: kMetinStili),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      vitrindekiler(
                        yeni: 'Yeni',
                        kitapAdi: 'Devlet',
                        photoUrl: 'assets/images/devlet.jpg',
                      ),
                      vitrindekiler(
                        yeni: 'Yeni',
                        kitapAdi: 'Sapiens',
                        photoUrl: 'assets/images/sapiens.jpg',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      vitrindekiler(
                        yeni: 'Yeni',
                        kitapAdi: 'Bozkırkurdu',
                        photoUrl: 'assets/images/bozkırkurdu.jpg',
                      ),
                      vitrindekiler(
                        yeni: 'Yeni',
                        kitapAdi: 'Savaş Sanatı',
                        photoUrl: 'assets/images/savassanati.jpg',
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Okunacak();
                          },
                        ),
                      );
                    },
                    child: Container(
                      width: 90,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.brown,
                      ),
                      child: Text(
                        'Okunacaklar',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return favoriKitap();
                          },
                        ),
                      );
                    },
                    child: Container(
                      width: 90,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.brown,
                      ),
                      child: Text(
                        'Kütüphanem',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 95,
                  ),
                ],
              ),
            ),
            menuIconSayfasi("giris"),
          ],
        ),
      ),
    );
  }
}

Widget bookland() {
  return Padding(
    padding: EdgeInsets.only(top: 24.0),
    child: Text(
      'Bookland',
      style: TextStyle(
        fontSize: 32,
        color: Colors.brown[800],
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget girisKitaplar(
    {@required String kategoriButon,
    @required String resimUrl,
    Widget widget,
    BuildContext context}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return widget;
        },
      ));
    },
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          decoration: BoxDecoration(shape: BoxShape.rectangle),
          child: Image.asset(
            resimUrl,
            scale: 1,
          ),
        ),
        SizedBox(height: 8),
        Text(kategoriButon, style: kMetinStili),
      ],
    ),
  );
}

Widget vitrindekiler(
    {@required String photoUrl, @required String kitapAdi, String yeni}) {
  return Container(
    padding: EdgeInsets.only(left: 12, top: 21, bottom: 21, right: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        etiket(yeni),
        SizedBox(height: 23),
        Center(
            child: Image.asset(
          photoUrl,
          scale: 2,
        )),
        SizedBox(height: 23),
        Center(
          child: Text(
            kitapAdi,
            style: TextStyle(
                fontSize: 18, color: Colors.brown, fontStyle: FontStyle.italic),
          ),
        ),
        SizedBox(height: 43),
      ],
    ),
  );
}
