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
    // Routes, by convention, are split on slashes,
    // like filesystem paths.
    final List<String> path = settings.name.split('/');
    // We only support paths that start with a slash,
    // so bail if the first component is not empty:
    if (path[0] != '')
      return null;
    // If the path is "/stock:..." then show a stock page for the
    // specified stock symbol.
    if (path[1].startsWith('${Strings.notesFormRouteName.substring(1)}:')) {
      // We don't yet support sub-pages of a stock,
      // so bail if there's any more path components.
      if (path.length != 2)
        return null;
      // Extract the symbol part of "stock:..." and return a route
      // for that symbol.
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
    // The other paths we support are in the routes table.
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