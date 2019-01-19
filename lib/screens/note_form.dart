import 'package:flutter/material.dart';

class NoteForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NoteFormState();
}

class NoteFormState extends State<NoteForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Text(
              'Title',
              style: Theme.of(context).textTheme.title,
            ),
            Text(
              'Note',
              style: Theme.of(context).textTheme.body1,
            ),
          ],
        ),
      ),
    );
  }
}