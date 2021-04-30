import 'package:bookland/menuIconSayfasi.dart';
import 'package:flutter/material.dart';
import 'package:bookland/kategoriler.dart';
import 'package:bookland/etiket.dart';

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
                  buildBaslik(),
                  Text(widget.kullaniciAdi == null
                      ? "Kullanici Girilmedi"
                      : widget.kullaniciAdi),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 161, vertical: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        buildNavigation(
                            text: 'Kategoriler',
                            resimUrl: 'assets/images/kategoriler.jpeg',
                            widget: kategori(),
                            context: context),
                      ],
                    ),
                  ),
                  SizedBox(height: 60),
                  Center(
                    child: Text(
                      'Yeniler',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.brown),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      vitrindekiler(
                        text: 'Devlet',
                        photoUrl: 'assets/images/devlet.jpg',
                        yeniyadaindirimli: 'Yeni',
                      ),
                      vitrindekiler(
                        text: 'Sapiens',
                        photoUrl: 'assets/images/sapiens.jpg',
                        yeniyadaindirimli: 'Yeni',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      vitrindekiler(
                        text: 'Bozkırkurdu',
                        photoUrl: 'assets/images/bozkırkurdu.jpg',
                        yeniyadaindirimli: '-%15',
                      ),
                      vitrindekiler(
                        text: 'Savaş Sanatı',
                        photoUrl: 'assets/images/savassanati.jpg',
                        yeniyadaindirimli: '-%10',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            menuIconSayfasi('menu'),
          ],
        ),
      ),
    );
  }
}

Widget buildBaslik() {
  return Padding(
    padding: EdgeInsets.only(top: 24.0),
    child: Text(
      'Bookland',
      style: TextStyle(
        fontSize: 32,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget buildNavigation(
    {@required String text,
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
            scale: 1.75,
          ),
        ),
        SizedBox(height: 8),
        Text(
          text,
          style: TextStyle(
              color: Colors.brown, fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}

Widget vitrindekiler({
  @required String text,
  String photoUrl,
  @required String yeniyadaindirimli,
}) {
  return Container(
    padding: EdgeInsets.only(left: 12, top: 12, bottom: 21, right: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        etiket(yeniyadaindirimli),
        SizedBox(height: 22),
        Center(
            child: Image.asset(
          photoUrl,
          scale: 2,
        )),
        SizedBox(height: 22),
        Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontStyle: FontStyle.italic),
          ),
        ),
      ],
    ),
  );
}
