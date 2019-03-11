// import 'external-libs/file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
////////////////////////////////////

// import 'screens/screen.dart';
import 'screens/notes.dart';
import 'screens/note_form.dart';
////////////////////////////////

// import 'themes/styles.dart';
import 'themes/light.dart';
import 'config/strings.dart';

void main() {
  runApp(Keeper());
}

class Keeper extends StatelessWidget {
  final String title = Strings.appTitle;

  Route<dynamic> _getRoute(RouteSettings settings) {

    final List<String> path = settings.name.split('/');

    if (path[0] != '')
      return null;

    if (path[1].startsWith('${Strings.notesFormRouteName.substring(1)}:')) {

      if (path.length != 2)
        return null;

      final int id = int.parse(
        path[1].substring(
          Strings.notesFormRouteName.length,
        ),
      );
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (BuildContext context) => NoteForm(id: id),
      );
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: this.title,
      theme: lightTheme(),
      routes: {
        Strings.notesRouteName: (BuildContext context) => Notes(),
        Strings.notesFormRouteName: (BuildContext context) => NoteForm()
      },
      onGenerateRoute: _getRoute,
    );
  }
}