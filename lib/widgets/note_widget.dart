import 'package:flutter/material.dart';
import 'package:keeper/config/k_radius.dart';
import 'package:keeper/config/spacing.dart';

class NoteWidget extends StatelessWidget {

  final Map note;
  final VoidCallback openForm;
  NoteWidget({this.note, this.openForm});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: openForm,
      borderRadius: BorderRadius.circular(
        KRadius.medium
      ),
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
              note["title"],
              style: Theme.of(context).textTheme.title,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: Spacing.vertical,
              ),
            ),
            Text(
              note["note"],
              style: Theme.of(context).textTheme.body1,
            )
          ],
        ),
      ),
    ),
    );
  }

}