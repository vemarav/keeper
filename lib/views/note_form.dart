import 'package:flutter/material.dart';

class NoteForm extends StatefulWidget {
  static String routeName = 'noteForm';

  @override
  State<StatefulWidget> createState() {
    return new _NoteFormState();
  }
}

class _NoteFormState extends State<NoteForm> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _titleController,
      _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = new TextEditingController();
    _contentController = new TextEditingController();
  }

  _goBack() {
    Navigator.of(_scaffoldKey.currentContext).pop();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        backgroundColor: Colors.white,
        leading: new IconButton(
            icon: new Icon(
              Icons.arrow_back,
              color: Colors.grey.shade600,
            ),
            onPressed: _goBack),
      ),
      body: new Container(
        margin: const EdgeInsets.all(20.0),
        child: new Column(
          children: <Widget>[
            new TextField(
              controller: _titleController,
              style: new TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),

              decoration: new InputDecoration(
                border: InputBorder.none,
                hintText: 'Title',
                hintStyle: new TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade500
                )
              ),
            ),

            new TextField(
              controller: _contentController,
              style: new TextStyle(
                  fontSize: 18.0,
                  color: Colors.black
              ),
              maxLines: null,
              decoration: new InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Note...',

                  hintStyle: new TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey.shade500
                  )
              ),
            )
          ],
        ),
      ),
    );
  }

}