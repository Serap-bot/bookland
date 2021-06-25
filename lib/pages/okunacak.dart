import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'okunacaklar_listesi.dart';

class Okunacak extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(length: 2, child: OkunacaklarListesi()),
    );
  }
}
