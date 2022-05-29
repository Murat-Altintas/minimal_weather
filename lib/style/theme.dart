// ignore_for_file: prefer_const_declarations

import 'package:flutter/material.dart';

final mainTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color.fromRGBO(140, 198, 210, 1),
  primaryColorLight: const Color.fromRGBO(230, 132, 97, 1),
  primaryColorDark: const Color.fromRGBO(84, 54, 62, 1),
  // accentColor: Color.fromRGBO(140, 198, 210, 1),
  colorScheme: const ColorScheme.light(secondary: Color.fromRGBO(140, 198, 210, 1)),
  bottomAppBarColor: const Color(0xffffffff),
  cardColor: Colors.red,
  dividerColor: Colors.red,
  highlightColor: const Color.fromRGBO(84, 54, 62, 1),
  splashColor: Colors.red,
  selectedRowColor: Colors.red,
  unselectedWidgetColor: const Color(0x8a000000),
  disabledColor: const Color(0x61000000),
  secondaryHeaderColor: Colors.red,
  toggleButtonsTheme: const ToggleButtonsThemeData(
    fillColor: Colors.pinkAccent,
    textStyle: TextStyle(
      color: Colors.red,
    ),
    selectedColor: Colors.white,
  ),
  dialogBackgroundColor: const Color(0xffffffff),
  indicatorColor: Colors.blue,
  hintColor: const Color(0x8a000000),
  errorColor: Colors.red,
  buttonTheme: const ButtonThemeData(
    textTheme: ButtonTextTheme.normal,
    minWidth: 88,
    height: 36,
    padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: Colors.red,
        width: 2,
        style: BorderStyle.none,
      ),
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
    alignedDropdown: false,
    buttonColor: Colors.red,
    disabledColor: Color(0x61000000),
    highlightColor: Color(0x29000000),
    splashColor: Color(0x1f000000),
    focusColor: Color(0x1f000000),
    hoverColor: Color(0x0a000000),
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(
      color: Colors.black,
      fontFamily: "ZonaBold",
    ),
    headline2: TextStyle(
      color: Color.fromRGBO(230, 132, 97, 1),
      fontFamily: "ZonaLight",
    ),
    caption: TextStyle(
      color: Color(0x8a000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    button: TextStyle(
      color: Color.fromRGBO(84, 54, 62, 1),
      fontFamily: "ZonaLight",
    ),
    subtitle2: TextStyle(
      color: Color(0xff000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    overline: TextStyle(
      color: Color(0xff000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  ),
  primaryTextTheme: const TextTheme(
//XX
    headline1: TextStyle(
      color: Color.fromRGBO(84, 54, 62, 1),
      fontFamily: "ZonaLight",
    ),
    headline2: TextStyle(
      color: Colors.white,
      fontFamily: "ZonaLight",
    ),
    headline3: TextStyle(
      color: Color.fromRGBO(230, 132, 97, 1),
      fontFamily: "ZonaLight",
    ),
    headline4: TextStyle(
      color: Color.fromRGBO(84, 54, 62, 1),
      fontFamily: "ZonaLight",
    ),
    headline5: TextStyle(
      color: Color(0xfffafafa),
      fontSize: 15,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    headline6: TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    subtitle1: TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    bodyText1: TextStyle(
      color: Colors.white,
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    bodyText2: TextStyle(
      color: Colors.white,
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    caption: TextStyle(
      color: Colors.white,
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    button: TextStyle(
      color: Colors.white,
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    subtitle2: TextStyle(
      color: Colors.white,
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    overline: TextStyle(
      color: Colors.white,
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  ),

  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(
      color: Color(0xdd000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    helperStyle: TextStyle(
      color: Color(0xdd000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    hintStyle: TextStyle(
      color: Color(0xdd000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    errorStyle: TextStyle(
      color: Color(0xdd000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    errorMaxLines: null,
    isDense: false,
    contentPadding: EdgeInsets.only(top: 12, bottom: 12, left: 0, right: 0),
    isCollapsed: false,
    prefixStyle: TextStyle(
      color: Color(0xdd000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    suffixStyle: TextStyle(
      color: Color(0xdd000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    counterStyle: TextStyle(
      color: Color(0xdd000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    filled: false,
    fillColor: Color(0x00000000),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.green,
        width: 1,
        style: BorderStyle.solid,
      ),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(230, 132, 97, 1),
        width: 1,
        style: BorderStyle.solid,
      ),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.blue,
        width: 1,
        style: BorderStyle.solid,
      ),
    ),
    disabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1,
        style: BorderStyle.solid,
      ),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(140, 198, 210, 1),
        width: 1,
        style: BorderStyle.solid,
      ),
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.blue,
        width: 1,
        style: BorderStyle.solid,
      ),
    ),
  ),

  iconTheme: const IconThemeData(
    color: Color.fromRGBO(230, 132, 97, 1),
  ),
  primaryIconTheme: const IconThemeData(
    color: Colors.purple,
  ),
);
