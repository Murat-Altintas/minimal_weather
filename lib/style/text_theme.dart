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
  final TextStyle subtitle1 = const TextStyle(
    fontFamily: "ZonaBold",
    fontSize: 20,
  );

  final TextStyle subtitle2 = const TextStyle(
    fontFamily: "ZonaLight",
    fontSize: 20,
    color: Colors.grey,
  );
}
