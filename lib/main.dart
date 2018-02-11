import 'package:flutter/material.dart';

const String _AccountName = 'Aravind Vemula';
const String _AccountEmail = 'vemula.aravind336@gmail.com';
const String _AccountAbbr = 'AV';

void main() => runApp(new Keeper());

class Keeper extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return new MaterialApp(
			title: 'Keeper',
			theme: new ThemeData(
				primaryColor: Colors.yellow.shade700
			),
			home: new KeeperDrawer(),
		);
	}
	
}


class KeeperDrawer extends StatelessWidget {
	
	// TODO (1) replace drawer with new Drawer(child: ...) in Scaffold
	// TODO (2) replace Column with ListView
	// refer: https://docs.flutter.io/flutter/widgets/ListView-class.html
	// TODO (3) make Column(children:...) as ListView(children:...)
	// TODO (4) add padding top 0 to ListView to remove white space
	// TODO (5) add otherAccountPictures with GestureDetector
	// refer: https://docs.flutter.io/flutter/widgets/GestureDetector-class.html
	// TODO (6) create a callback for GestureDetector(onTap:...) and showDialog with "Account Switching not implemented"
	// TODO (7) add some ListTile to ListView(children: ...)
	// refer: https://docs.flutter.io/flutter/material/ListTile-class.html
	// TODO (8) create a callback method for each ListTile with ShowDialog with "Not Implemented"
	// TODO (9) Exercise make children Dynamic
	
	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			drawer: new Drawer(
				child: new ListView(
					padding: const EdgeInsets.only(top: 0.0),
					children: <Widget>[
						new UserAccountsDrawerHeader(
							accountName: const Text(_AccountName),
							accountEmail: const Text(_AccountEmail),
							currentAccountPicture: new CircleAvatar(
								backgroundColor: Colors.brown,
								child: new Text(_AccountAbbr)
							),
							otherAccountsPictures: <Widget>[
								new GestureDetector(
									onTap: () => _onTapOtherAccounts(context),
									child: new Semantics(
										label: 'Switch Account',
										child: new CircleAvatar(
											backgroundColor: Colors.brown,
											child: new Text('SA'),
										),
									),
								)
							]
						),
						new ListTile(
							leading: new Icon(Icons.lightbulb_outline),
							title: new Text('Notes'),
							onTap: () => _onListTileTap(context),
						),
						new Divider(),
						new ListTile(
							leading: new Text('Label'),
							trailing: new Text('Edit'),
							onTap: () => _onListTileTap(context),
						),
						new ListTile(
							leading: new Icon(Icons.label),
							title: new Text('Expense'),
							onTap: () => _onListTileTap(context),
						),
						new ListTile(
							leading: new Icon(Icons.label),
							title: new Text('Inspiration'),
							onTap: () => _onListTileTap(context),
						),
						new ListTile(
							leading: new Icon(Icons.label),
							title: new Text('Personal'),
							onTap: () => _onListTileTap(context),
						),
						new ListTile(
							leading: new Icon(Icons.label),
							title: new Text('Work'),
							onTap: () => _onListTileTap(context),
						),
						new ListTile(
							leading: new Icon(Icons.add),
							title: new Text('Create new label'),
							onTap: () => _onListTileTap(context),
						),
						new Divider(),
						new ListTile(
							leading: new Icon(Icons.archive),
							title: new Text('Archive'),
							onTap: () => _onListTileTap(context),
						),
						new ListTile(
							leading: new Icon(Icons.delete),
							title: new Text('Trash'),
							onTap: () => _onListTileTap(context),
						),
						new Divider(),
						new ListTile(
							leading: new Icon(Icons.settings),
							title: new Text('Settings'),
							onTap: () => _onListTileTap(context),
						),
						new ListTile(
							leading: new Icon(Icons.help),
							title: new Text('Help & feedback'),
							onTap: () => _onListTileTap(context),
						)
					]
				)
			),
			
			appBar: new AppBar(
				title: new Text('Keeper'),
			),
			body: new Center(
				child: new Text('Hello World!')
			)
		);
	}
	
	_onTapOtherAccounts(BuildContext context) {
		Navigator.of(context).pop();
		showDialog<Null>(
			context: context,
			child: new AlertDialog(
				title: const Text('Account switching not implemented.'),
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
	
	_onListTileTap(BuildContext context) {
		Navigator.of(context).pop();
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
	
	_labelWidgets() {
		return [
			new ListTile(
				leading: new Icon(Icons.label),
				title: new Text('Work'),
				onTap: () => _onListTileTap(context),
			),
		];
	}
	
}