import 'package:flutter/material.dart';
import 'package:keeper/config/k_radius.dart';
import 'package:keeper/config/spacing.dart';
import 'package:keeper/models/note.dart';

class NoteWidget extends StatelessWidget {
  final Note note;
  final VoidCallback openForm;
  final VoidCallback onDismissed;

  NoteWidget({this.note, this.openForm, this.onDismissed});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) => onDismissed(),
      child: InkWell(
        onTap: openForm,
        borderRadius: BorderRadius.circular(KRadius.medium),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              KRadius.medium,
            ),
            border: Border.all(
              color: Theme.of(context).primaryColorLight,
              width: 1.0,
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(Spacing.keyLine),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  note.title,
                  style: Theme.of(context).textTheme.title,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: Spacing.vertical,
                  ),
                ),
                Text(
                  note.content,
                  style: Theme.of(context).textTheme.body1,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
