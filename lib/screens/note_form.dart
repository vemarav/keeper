import 'package:flutter/material.dart';
import 'package:keeper/config/spacing.dart';
import 'package:keeper/config/font_size.dart';
import 'package:keeper/config/strings.dart';
import 'package:keeper/providers/note_provider.dart';
import 'package:keeper/models/note.dart';
import 'package:keeper/config/components.dart';

class NoteForm extends StatefulWidget {
  final int id;

  NoteForm({this.id});

  @override
  State<StatefulWidget> createState() => NoteFormState(id: this.id);
}

class NoteFormState extends State<NoteForm> {
  final _noteFormKey = GlobalKey<FormState>();
  int id;
  NoteProvider _noteProvider;
  Note note;
  TextEditingController titleController, noteController;

  NoteFormState({this.id}) {
    this.note = Note(id: this.id);
  }

  @override
  void initState() {
    super.initState();
    _noteProvider = new NoteProvider();
    titleController = TextEditingController();
    noteController = TextEditingController();
    this.fetchNote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  KBackButton(callback: _onBackPressed)
                ],
              ),
              Form(
                key: _noteFormKey,
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: Spacing.xKeyLine,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _titleInput(),
                      _noteInput(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _save(),
    );
  }

  Widget _titleInput() {
    return TextFormField(
      controller: titleController,
      maxLines: null,
      decoration: InputDecoration(
        hintText: Strings.title,
        border: InputBorder.none,
        errorStyle: TextStyle(fontSize: FontSize.small),
      ),
      style: TextStyle(
        fontSize: FontSize.xLarge,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      onSaved: (value) {
        this.setState(() {
          note.title = value;
        });
      },
      onFieldSubmitted: (value) {
        print('onFieldSubmitted: $value');
      },
      validator: (value) {
        return value.isEmpty ? Strings.enterText : null;
      },
    );
  }

  Widget _noteInput() {
    return TextFormField(
      controller: noteController,
      maxLines: null,
      decoration: InputDecoration(
        hintText: Strings.note,
        border: InputBorder.none,
        errorStyle: TextStyle(
          fontSize: FontSize.small,
        ),
      ),
      style: TextStyle(
        fontSize: FontSize.medium,
        color: Colors.black,
      ),
      onSaved: (value) {
        this.setState(() {
          note.content = value;
        });
      },
      onFieldSubmitted: (value) {
        print('onFieldSubmitted: $value');
      },
      validator: (value) {
        return value.isEmpty ? Strings.enterText : null;
      },
    );
  }

  Widget _save() {
    return BottomAppBar(
      elevation: Spacing.elevation,
      child: InkWell(
        onTap: _validateAndSave,
        child: Center(
          heightFactor: Spacing.heightFactor,
          child: Text(Strings.save),
        ),
      ),
    );
  }

  void fetchNote() async {
    if (this.id != null) {
      Note note = await _noteProvider.findBy(id: this.id);
      this.setState(() {
        this.note = note;
        titleController.text = note.title;
        noteController.text = note.content;
      });
    }
  }

  void _validateAndSave({navigate: true}) async {
    // Validate will return true if the form is valid, or false if
    // the form is invalid!
    if (_noteFormKey.currentState.validate()) {
      _noteFormKey.currentState.save();

      Note note = new Note(
        id: this.id,
        title: this.note.title,
        content: this.note.content,
      );

      if (this.id == null) {
        await this._noteProvider.insert(note);
      } else {
        await this._noteProvider.update(note);
      }

      if (navigate) Navigator.of(context).pop();
    }
  }

  void _onBackPressed() {
    Navigator.of(context).pop();
    _validateAndSave(navigate: false);
  }
}
