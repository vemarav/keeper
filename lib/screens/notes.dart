import 'package:flutter/material.dart';
import 'package:keeper/widgets/note_widget.dart';
import 'package:keeper/widgets/search_bar.dart';
import 'package:keeper/config/spacing.dart';
import 'package:keeper/config/constants.dart';
import 'package:keeper/config/strings.dart';

class Notes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NotesState();

}

class NotesState extends State<Notes> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            _silverAppBar(),
            _silverList(),
          ],
        ),
      ),
      bottomNavigationBar: _bottomAppBar(),
    );
  }

  Widget _silverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        _noteWidget,
        childCount: notes.length,
      ),
    );
  }

  Widget _silverAppBar() {
    return SearchBar(
      searchCallBack: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Implement Search'),
            );
          },
        );
      },
      menuCallBack: () {
        _scaffoldKey.currentState.openDrawer();
      },
      profileCallback: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Implement Profile'),
            );
          },
        );
      },
    );
  }

  Widget _bottomAppBar() {
    return BottomAppBar(
      child: InkWell(
        onTap: () => _openNoteForm(null),
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          padding: EdgeInsets.symmetric(
            horizontal: Spacing.horizontal,
            vertical: Spacing.keyLine,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  Strings.takeANote,
                  style: Theme.of(context).textTheme.button,
                ),
              ),
              Container(
                child: Icon(Icons.add),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _noteWidget(BuildContext context, int index) {
    return  Container(
      margin: EdgeInsets.all(Spacing.vertical),
      child: NoteWidget(note: notes[index], openForm: () => _openNoteForm(index)),
    );
  }

  void _openNoteForm(int index) {
    String route = Strings.notesFormRouteName;
    if(index != null) route = "$route:$index";
    Navigator.of(context).pushNamed(route);
  }
}


