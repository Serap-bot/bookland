import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookland/menuIconSayfasi.dart';
import 'baslik.dart';

class kitapDetay extends StatefulWidget {
  final String kitapEtiket;
  kitapDetay(this.kitapEtiket);

  @override
  _kitapDetayState createState() => _kitapDetayState();
}

class _kitapDetayState extends State<kitapDetay> {
  List<String> yazar = ['Albert Camus'];
  List<int> tarih = [2021];

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
                  baslik(widget.kitapEtiket, context),
                  SizedBox(height: 32),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: ListView(
                        children: [
                          Center(
                              child: Image.asset('assets/images/yabanci.jpg')),
                          SizedBox(height: 30),
                          Text(
                            'Yazar : ${yazar[0]}',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.brown),
                          ),
                          SizedBox(height: 32),
                          Text(
                            'Yayınlanma Tarihi: ${tarih[0]}',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.brown),
                          ),
                          SizedBox(height: 100),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            menuIconSayfasi("kitapDetay"),
          ],
        ),
      ),
    );
  }
}
