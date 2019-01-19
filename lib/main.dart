// import 'external-libs/file.dart';
import 'package:flutter/material.dart';
////////////////////////////////////

// import 'screens/screen.dart';
import 'screens/notes.dart';
import 'screens/note_form.dart';
////////////////////////////////

// import 'themes/styles.dart';
import 'themes/light.dart';
import 'static/constants.dart';

void main() {
  runApp(Keeper());
}

class Keeper extends StatelessWidget {
  final String title = 'Keeper';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: this.title,
      theme: lightTheme(),
      routes: {
        Constants.notesRouteName: (BuildContext context) => Notes(),
        Constants.notesFormRouteName: (BuildContext context) => NoteForm()
      },
    );
  }
}