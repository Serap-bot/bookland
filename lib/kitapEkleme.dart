import 'package:flutter/material.dart';

class kitapEkleme extends StatelessWidget {
  List list;
  int index;

  kitapEkleme(this.list, this.index);

  @override
  Widget build(BuildContext context) {
    String ad = list[index].data()["name"];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(ad),
      ),
    );
  }
}
