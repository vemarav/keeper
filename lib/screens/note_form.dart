import 'package:flutter/material.dart';
import 'package:keeper/themes/styles.dart';

class NoteForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NoteFormState();
}

class NoteFormState extends State<NoteForm> {

  final _noteFormKey = GlobalKey<FormState>();
  String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: Styles.statusBarHeight),
          padding: EdgeInsets.symmetric(
            horizontal: Styles.keyLineSpacing,
          ),
          child: Form(
            key: _noteFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Title',
                    border: InputBorder.none,
                    errorStyle: TextStyle(
                      fontSize: Styles.smallFontSize,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: Styles.xLargeFontSize,
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
                      return 'Please enter some text';
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    onPressed: _validateAndSave,
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _validateAndSave() {
    // Validate will return true if the form is valid, or false if
    // the form is invalid.
    _noteFormKey.currentState.save();
    if (_noteFormKey.currentState.validate()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(this.title),
          );
        },
      );
    }
  }
}