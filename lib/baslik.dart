import 'package:bookland/sabitler.dart';
import 'package:flutter/material.dart';

Widget baslik(String sBaslik, context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 30),
      GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, size: 27, color: Colors.brown[800])),
      SizedBox(height: 30),
      Center(child: Text(sBaslik, style: kMetinStili))
    ],
  );
}
