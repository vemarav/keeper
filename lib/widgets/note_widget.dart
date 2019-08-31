import 'package:flutter/material.dart';
import 'package:keeper/config/k_radius.dart';
import 'package:keeper/config/spacing.dart';
import 'package:keeper/models/note.dart';

class NoteWidget extends StatelessWidget {
  final Note note;
  final VoidCallback onEditPressed;
  final VoidCallback onDismissPressed;
  final VoidCallback onSelectPressed;
  final bool enabledMultiSelect;

  NoteWidget({
    this.note,
    this.onEditPressed,
    this.onDismissPressed,
    this.onSelectPressed,
    this.enabledMultiSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        decoration: BoxDecoration(
          color: Colors.red[800],
          borderRadius: BorderRadius.circular(KRadius.medium),
        ),
        child: Padding(
          padding: EdgeInsets.all(Spacing.keyLine),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.delete,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) => onDismissPressed(),
      child: InkWell(
        onLongPress: onSelectPressed,
        onTap: enabledMultiSelect == true ? onSelectPressed : onEditPressed,
        borderRadius: BorderRadius.circular(KRadius.medium),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(
              KRadius.medium,
            ),
            border: Border.all(
              color: note.isSelected == true
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).primaryColorLight,
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
