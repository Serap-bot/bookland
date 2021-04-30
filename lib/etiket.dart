import 'package:flutter/material.dart';

Widget etiket(String text) {
  return Container(
    padding: EdgeInsets.all(4),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2), color: Colors.white),
    child: Text(
      text,
      textAlign: TextAlign.end,
      style: TextStyle(
          color: Colors.red, fontSize: 13, fontWeight: FontWeight.bold),
    ),
  );
}
