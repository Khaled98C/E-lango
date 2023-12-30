import 'package:flutter/material.dart';

////! لكل الكبسات الملونة
Widget row(String text, Color color) {
  return Padding(
    padding: EdgeInsets.all(12.5),
    child: Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            // fontWeight: FontWeight.bold,
            //create by :khaled barakat
            fontSize: 20,
            fontFamily: "Cairo",
          ),
        ),
      ),
    ),
  );
}
