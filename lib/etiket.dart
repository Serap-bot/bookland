import 'package:flutter/material.dart';

Widget etiket(String kitapEtiket) {
  return Container(
    padding: EdgeInsets.all(4),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2), color: Colors.white),
    child: Text(
      kitapEtiket,
      textAlign: TextAlign.end,
      style: TextStyle(
          color: Colors.red, fontSize: 13, fontWeight: FontWeight.bold),
    ),
  );
}
