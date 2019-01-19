// import 'external-libs/file.dart';
import 'package:flutter/material.dart';
////////////////////////////////////

// import 'screens/screen.dart';
import 'screens/notes.dart';
////////////////////////////////

// import 'themes/styles.dart';
import 'themes/light.dart';

void main() {
  runApp(Keeper());
}

class Keeper extends StatelessWidget {
  final String title = 'Keeper';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: this.title,
      home: Notes(),
      theme: lightTheme()
    );
  }
}