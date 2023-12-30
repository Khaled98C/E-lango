import 'package:flutter/material.dart';


class ThemeEdite {
  static final ThemeData dark = ThemeData.dark().copyWith(
    textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: 'Cairo',
        ),
    inputDecorationTheme: InputDecorationTheme(
      iconColor: Colors.grey.withOpacity(0.4),
      fillColor: Colors.grey.withOpacity(0.4),
      hintStyle: TextStyle(
        fontFamily: "Cairo",
        fontWeight: FontWeight.normal,
        fontSize: 16,
      ),
    ),
    hintColor: Colors.white,
    appBarTheme: AppBarTheme(
        color: Color(0xffc385c7), elevation: 0.0, centerTitle: true),
  );

  static final ThemeData light = ThemeData.light().copyWith(
    textTheme: ThemeData.light().textTheme.apply(
          fontFamily: 'Cairo',
        ),
    inputDecorationTheme: InputDecorationTheme(
        fillColor: Color.fromRGBO(49, 40, 79, 1).withOpacity(0.1),
        hintStyle: TextStyle(
          fontFamily: "Cairo",
          fontWeight: FontWeight.normal,
          fontSize: 16,
        )),
    appBarTheme: AppBarTheme(
        color: Color(0xffc385c7), elevation: 0.0, centerTitle: true),
  );
}
