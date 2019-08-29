import 'package:flutter/material.dart';
import 'package:keeper/models/note.dart';
import 'package:keeper/widgets/note_widget.dart';
import 'package:keeper/widgets/search_bar.dart';
import 'package:keeper/config/spacing.dart';
import 'package:keeper/config/strings.dart';
import 'package:keeper/presenters/note_presenter.dart';
import 'package:keeper/providers/note_provider.dart';

class Notes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NotesState();
}

class NotesState extends State<Notes> implements NoteView {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Note> _notes = <Note>[];
  Map<int, Note> _deleteNotes = <int, Note>{};
  int _limit = 50;
  NotePresenter _presenter;
  bool _isLoading = true;
  NoteProvider _provider = new NoteProvider();

  @override
  void initState() {
    super.initState();
//    scrollController.addListener(_paginate);
    _provider.addObserver(this);
    _isLoading = true;
    _presenter = new NotePresenter(this, _provider);
    _presenter.fetch(_limit);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(),
      body: SafeArea(
        child: this._isLoading
            ? Center(child: CircularProgressIndicator())
            : Container(
                margin: EdgeInsets.all(Spacing.horizontal),
                child: CustomScrollView(
                  slivers: <Widget>[
                    _silverAppBar(),
                    _silverList(),
                  ],
                ),
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
          margin: EdgeInsets.symmetric(horizontal: Spacing.horizontal),
          padding: EdgeInsets.symmetric(
            horizontal: Spacing.horizontal,
            vertical: Spacing.keyLine,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  Strings.takeANote,
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              Container(
                child: IconTheme(
                  data: Theme.of(context).primaryIconTheme,
                  child: Icon(Icons.add),
                ),
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
        openForm: () => _openNoteForm(index),
        onDismissed: () => _deleteNote(index),
      ),
    );
  }

  void _openNoteForm(int index) {
    String route = Strings.notesFormRouteName;
    if (index != null && this._notes[index] != null) {
      Note note = this._notes[index];
      if (note.id != null) route = "$route:${note.id}";
    }
    Navigator.of(context).pushNamed(route);
  }

  void _deleteNote(int index) {
    Note note = _notes[index];
    try {
      _notes.removeAt(index);
      _addToDeleteNote(note);
      _scaffoldKey.currentState
          .showSnackBar(
            SnackBar(
              content: Text(Strings.deleteNote),
              action: SnackBarAction(
                  label: Strings.undo,
                  textColor: Colors.blue,
                  onPressed: () => _removeFromDeleteNotes(note)),
            ),
          )
          .closed
          .then((reason) => __deleteNotes());
    } catch (ex) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(Strings.deleteNoteError),
        ),
      );
    }
  }

  void _addToDeleteNote(Note note) {
    _deleteNotes[note.id] = note;
  }

  void _removeFromDeleteNotes(Note note) {
    _deleteNotes.remove(note.id);
  }

  void __deleteNotes() {
    _deleteNotes.forEach((id, note) => _provider.destroy(note));
    _deleteNotes = {};
    notify();
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

  @override
  notify() {
    _presenter.fetch(_limit);
  }
}
