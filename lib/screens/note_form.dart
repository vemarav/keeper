import 'package:flutter/material.dart';
import 'package:keeper/themes/styles.dart';

class NoteForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NoteFormState();
}

class NoteFormState extends State<NoteForm> {

  final _noteFormKey = GlobalKey<FormState>();


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
                    )
                  ),
                  style: TextStyle(
                    fontSize: Styles.xLargeFontSize,
                    color: Colors.black,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_noteFormKey.currentState.validate()) {
                        // If the form is valid, we want to show a Snackbar
                        Scaffold.of(context)
                            .showSnackBar(
                          SnackBar(
                            content: Text('Processing Data'),
                          ),
                        );
                      }
                    },
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
}