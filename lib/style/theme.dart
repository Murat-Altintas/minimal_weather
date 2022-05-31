// ignore_for_file: prefer_const_declarations

import 'package:flutter/material.dart';

final weatherTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color.fromRGBO(140, 198, 210, 1),
  primaryColorLight: const Color.fromRGBO(230, 132, 97, 1),
  primaryColorDark: const Color.fromRGBO(84, 54, 62, 1),
  primaryTextTheme: const TextTheme(
    headline1: TextStyle(
      fontFamily: "ZonaBold",
      color: Colors.blue,
    ),
    headline2: TextStyle(
      fontFamily: "ZonaLight",
      color: Colors.blue,
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(230, 132, 97, 1),
        width: 1,
        style: BorderStyle.solid,
      ),
    ),
  ),
);
