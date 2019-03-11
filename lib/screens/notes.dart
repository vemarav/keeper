import 'package:flutter/material.dart';
import 'package:keeper/models/note.dart';
import 'package:keeper/widgets/note_widget.dart';
import 'package:keeper/widgets/search_bar.dart';
import 'package:keeper/config/spacing.dart';
import 'package:keeper/config/strings.dart';
import 'package:keeper/presenters/note.dart';
import 'package:keeper/providers/note_provider.dart';

class Notes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NotesState();
}

class NotesState extends State<Notes> implements NoteView {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Note> _notes = <Note>[];
  int _limit = 50;
  NotePresenter _presenter;
  bool _isLoading = true;
  NoteProvider _provider = new NoteProvider();

  @override
  void initState() {
    super.initState();
//    scrollController.addListener(_paginate);
    _isLoading = true;
    _presenter = new NotePresenter(this, _provider);
  }

  @override
  Widget build(BuildContext context) {
    _presenter.fetch(_limit);
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(),
      body: SafeArea(
        child: this._isLoading
            ? Center(child: CircularProgressIndicator())
            : CustomScrollView(
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
        childCount: this._notes.length,
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
    return Container(
      margin: EdgeInsets.all(Spacing.vertical),
      child: NoteWidget(
          note: this._notes[index],
          openForm: () => _openNoteForm(index)),
    );
  }

  void _openNoteForm(int index) {
    String route = Strings.notesFormRouteName;
    if(index != null && this._notes[index] != null) {
      Note note = this._notes[index];
      if (note.id != null) route = "$route:${note.id}";
    }
    Navigator.of(context).pushNamed(route);
  }

  @override
  void onLoadComplete(List<Note> notes) {
    this.setState(() {
      this._notes = notes;
      this._isLoading = false;
    });
  }

  @override
  void onLoadError(error) {
    this.setState(() {
      this._isLoading = false;
    });
  }
}
