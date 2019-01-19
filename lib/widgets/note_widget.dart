import 'package:flutter/material.dart';
import 'package:keeper/themes/styles.dart';

class NoteWidget extends StatelessWidget {
  final Map note;
  NoteWidget({this.note});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () { print("EditForm"); },
      borderRadius: BorderRadius.circular(
        Styles.borderSize
      ),
      child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(Styles.borderSize),
        ),
        border: Border.all(
          color: Theme.of(context).primaryColorLight,
          width: 1.0,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(Styles.keyLineSpacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              note["title"],
              style: Theme.of(context).textTheme.title,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: Styles.verticalSpacing,
              ),
            ),
            Text(
              note["content"],
              style: Theme.of(context).textTheme.body1,
            )
          ],
        ),
      ),
    ),
    );
  }

}