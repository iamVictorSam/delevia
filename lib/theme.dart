import 'package:delevia_app/SizeConfig.dart';
import 'package:delevia_app/constants.dart';
import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    canvasColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "OpenSans",
    appBarTheme: appBarTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    titleTextStyle: TextStyle(
      fontSize: 21.6,
      letterSpacing: 1,
      fontWeight: FontWeight.bold,
    ),
    centerTitle: true,
    color: Colors.transparent,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline6: TextStyle(
          // color: Color(0XFF8B8B8B),
          color: Colors.black,
          letterSpacing: 1,
          fontWeight: FontWeight.bold,
          fontSize: 21.6),
    ),
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: blueGrey,
    ),
    gapPadding: 4,
  );
  return InputDecorationTheme(
    hintStyle: TextStyle(color: Color(0xFFD0D0D0)),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal: 22, vertical: 5),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}
