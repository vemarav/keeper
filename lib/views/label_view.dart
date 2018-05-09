import 'package:flutter/material.dart';
import 'package:keeper/views/keeper_drawer.dart';
import 'mock_data.dart';

class LabelView extends StatefulWidget {
	static final String routeName = '/';
	final String title;
	LabelView({this.title});
	
	@override
	State createState() => new LabelViewState(title: title);
}

class LabelViewState extends State<LabelView> {
	GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
	
	final String title;
	LabelViewState({this.title});
	
	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			key: _scaffoldKey,
			drawer: new KeeperDrawer(labels: labels),
			appBar: new AppBar(
				leading: new IconButton(
					icon: const Icon(Icons.menu),
					color: Colors.white,
					onPressed: _openDrawer
				),
				title: new Text(title),
				actions: <Widget>[
					new IconButton(
						icon: const Icon(
							Icons.search,
							color: Colors.white,
						),
						onPressed: () => _alertNotImplemented(context)
					)
				],
			),
			body: new ListView(
				children: _buildNotes(),
			),
      // TODO (1) add bottom app bar
      // TODO (2) create NoteForm
      /**
       * find gist for NoteForm at
       * https://gist.github.com/aravind99/62ad99f573d182c8acefeee54ca41d14
       * **/
      // TODO (3) Navigate to NoteForm
		);
	}
	
	_openDrawer() {
		_scaffoldKey.currentState.openDrawer();
	}
	
	List<Widget> _buildNotes() {
		List<Widget> _listNotes = [];
		notes.forEach((note) {
			_listNotes.add(
				new Card(
					child: new Container(
						padding: const EdgeInsets.all(16.0),
						child: new ListTile(
							title: new Text(note['id'].toString() + " " + note['title']),
							subtitle: new Text(note['content']),
						),
					)
				)
			);
		});
		return _listNotes;
	}
	
	_alertNotImplemented(context) {
		showDialog<Null>(
			context: context,
			child: new AlertDialog(
				title: const Text('Not Implemented'),
				actions: <Widget>[
					new FlatButton(
						child: const Text('OK'),
						onPressed: () {
							Navigator.of(context).pop();
						},
					),
				],
			),
		);
	}
}