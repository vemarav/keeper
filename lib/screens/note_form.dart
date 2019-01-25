import 'package:flutter/material.dart';
import 'package:keeper/config/spacing.dart';
import 'package:keeper/config/font_size.dart';
import 'package:keeper/config/strings.dart';
import 'package:keeper/config/constants.dart';

class NoteForm extends StatefulWidget {

  final int id;
  NoteForm({this.id});

  @override
  State<StatefulWidget> createState() => NoteFormState(id: this.id);
}

class NoteFormState extends State<NoteForm> {

  final _noteFormKey = GlobalKey<FormState>();
  int id;
  String title, note;

  NoteFormState({this.id});

  String _getTitle(index) {
    if(index != null) return notes[index]['title'];
    return '';
  }

  String _getNote(index) {
    if(index != null) return notes[index]['note'];
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: Spacing.statusBarHeight),
          padding: EdgeInsets.symmetric(
            horizontal: Spacing.keyLine,
          ),
          child: Form(
            key: _noteFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _titleInput(),
                _noteInput(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _save()
    );
  }

  Widget _titleInput() {
    return TextFormField(
      initialValue: _getTitle(this.id),
      maxLines: null,
      decoration: InputDecoration(
        hintText: Strings.title,
        border: InputBorder.none,
        errorStyle: TextStyle(
          fontSize: FontSize.small,
        ),
      ),
      style: TextStyle(
        fontSize: FontSize.xLarge,
        color: Colors.black,
      ),
      onSaved: (value) {
        this.setState(() {
          this.title = value;
        });
      },
      onFieldSubmitted: (value) {
        print('onFieldSubmitted: $value');
      },
      validator: (value) {
        if (value.isEmpty) {
          return Strings.enterText;
        }
      },
    );
  }

  Widget _noteInput() {
    return TextFormField(
      initialValue: _getNote(this.id),
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
          this.note = value;
        });
      },
      onFieldSubmitted: (value) {
        print('onFieldSubmitted: $value');
      },
      validator: (value) {
        if (value.isEmpty) {
          return Strings.enterText;
        }
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

  void _validateAndSave() {
    // Validate will return true if the form is valid, or false if
    // the form is invalid!
    if (_noteFormKey.currentState.validate()) {
      _noteFormKey.currentState.save();

      Map note = {
        "id": notes.length + 1,
        "title": this.title,
        "note": this.note
      };

      if(this.id != null) {
        notes[this.id] = note;
      } else {
        notes.add(note);
      }
      Navigator.of(context).pop();
    }
  }
}