import 'dart:async';

import 'package:flutter/material.dart';
import 'package:keeper/config/spacing.dart';
import 'package:keeper/config/font_size.dart';
import 'package:keeper/config/strings.dart';
import 'package:keeper/models/note.dart';
import 'package:keeper/presenters/note_presenter.dart';

class Search extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SearchState();
}

class SearchState extends State<Search> implements NoteView {
  Timer _timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: Spacing.vertical),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios),

                  ),
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: Strings.search
                      ),
                      style: TextStyle(
                        fontSize: FontSize.medium,
                      ),
                      onChanged: (value) {
                        debounce(222, () => _searchQuery(value));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }

  void debounce(int duration, VoidCallback callback) {
    if(_timer != null) _timer.cancel();
    _timer = Timer(Duration(milliseconds: duration), callback);
  }

  void _searchQuery(String query) {
    print(query);
  }

  @override
  void onLoadComplete(List<Note> notes) {
    // TODO: implement onLoadComplete
  }

  @override
  void onLoadError(error) {
    // TODO: implement onLoadError
  }

  @override
  void notifyDataSetChanged() {
    // TODO: implement notifyDataSetChanged
  }
}
