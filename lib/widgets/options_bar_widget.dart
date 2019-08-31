import 'package:flutter/material.dart';
import 'package:keeper/config/spacing.dart';
import 'package:keeper/config/k_radius.dart';
import 'package:keeper/config/strings.dart';

class OptionsBar extends StatelessWidget {
  final VoidCallback onClosePressed, onDeletePressed;

  OptionsBar({this.onClosePressed, this.onDeletePressed});

  @override
  Widget build(BuildContext context) {
    var _itemPadding = EdgeInsets.symmetric(vertical: 10.0);

    return SliverAppBar(
      automaticallyImplyLeading: false,
      elevation: 0.0,
      floating: true,
      expandedHeight: 72.0,
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).primaryColorLight,
            ),
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: Spacing.vertical),
          child: Row(
            children: <Widget>[
              IconButton(
                padding: _itemPadding,
                onPressed: onClosePressed,
                icon: Icon(
                  Icons.close,
                ),
              ),
              IconButton(
                padding: _itemPadding,
                onPressed: onDeletePressed,
                icon: Icon(
                  Icons.delete,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
