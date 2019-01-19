import 'package:flutter/material.dart';

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

    // Define the default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      button: TextStyle(
        color: Colors.grey[700],
        fontSize: 16.0
      ),
      headline: TextStyle(
        color: Colors.grey[900],
        fontSize: 24.0,
      ),
      title: TextStyle(
        color: Colors.grey[850],
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
      body1: TextStyle(
        color: Colors.grey[800],
        fontSize: 14.0,
      ),
      body2: TextStyle(
        color: Colors.grey[700],
        fontSize: 12.0,
      )
    ),
  );
}