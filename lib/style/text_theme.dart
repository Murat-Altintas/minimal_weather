import 'package:flutter/material.dart';

class TextThemeLight {
  static TextThemeLight? _instace;
  static TextThemeLight? get instance {
    _instace ??= TextThemeLight._init();
    return _instace;
  }

  TextThemeLight._init();

  final TextStyle headline1 = const TextStyle(
    fontFamily: "ZonaBold",
    fontSize: 30,
  );
  final TextStyle headline2 = const TextStyle(
    fontFamily: "ZonaLight",
    fontSize: 30,
  );
  final TextStyle headline3 = const TextStyle(
    fontFamily: "ZonaBold",
    color: Colors.white,
    fontSize: 30,
  );
  final TextStyle headline4 = const TextStyle(
    fontFamily: "ZonaLight",
    color: Colors.white,
    fontSize: 30,
  );
  final TextStyle subtitle1 = const TextStyle(
    fontFamily: "ZonaBold",
    fontSize: 20,
  );

  final TextStyle subtitle2 = const TextStyle(
    fontFamily: "ZonaLight",
    fontSize: 20,
  );

  final TextStyle subtitle3 = const TextStyle(
    fontFamily: "ZonaBold",
    color: Colors.white,
    fontSize: 15,
  );

  final TextStyle subtitle4 = const TextStyle(
    fontFamily: "ZonaLight",
    color: Colors.white,
    fontSize: 15,
  );
}
