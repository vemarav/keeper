import 'package:flutter/material.dart';
import 'package:keeper/themes/styles.dart';

ThemeData lightTheme() {
  return ThemeData(
    // Define the default Brightness and Colors
    brightness: Brightness.light,
    primaryColor: Colors.grey[900],
    primaryColorDark: Colors.black,
    primaryColorLight: Colors.grey[400],
    accentColor: Colors.grey[400],
    backgroundColor: Colors.white,
    accentColorBrightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,

    // Define the default Font Family
    fontFamily: 'Montserrat',

    // Define the default IconTheme
    iconTheme: IconThemeData(
      color: Colors.grey[700],
      opacity: 0.9
    ),

    textSelectionColor: Colors.grey[400],
    textSelectionHandleColor: Colors.black,
    cursorColor: Colors.black,

    // Define the default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      button: TextStyle(
        color: Colors.grey[700],
        fontSize: Styles.smallFontSize
      ),
      headline: TextStyle(
        color: Colors.grey[900],
        fontSize: Styles.xxLargeFontSize,
      ),
      title: TextStyle(
        color: Colors.grey[850],
        fontSize: Styles.fontSize,
        fontWeight: FontWeight.bold,
      ),
      body1: TextStyle(
        color: Colors.grey[800],
        fontSize: Styles.smallFontSize,
      ),
      body2: TextStyle(
        color: Colors.grey[700],
        fontSize: Styles.xxSmallFontSize,
      )
    ),
  );
}