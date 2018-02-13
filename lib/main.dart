import 'package:flutter/material.dart';

const String _AccountName = 'Aravind Vemula';
const String _AccountEmail = 'vemula.aravind336@gmail.com';
const String _AccountAbbr = 'AV';

// TODO (1) create a separate file for each class
// TODO (2) create a StatelessWidget for Keeper drawer
// TODO (3) call new KeeperDrawer() instead of new Drawer()
// TODO (4) change Notes class to LabelView
// Hint: create views folder and add files which represents the class entity

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
			// Routes
			// COMPLETE (3) add Notes.routeName to routes
			routes: <String, WidgetBuilder> {
				Notes.routeName : (BuildContext context) => new Notes()
			}
		);
	}
	
}


class KeeperDrawer extends StatelessWidget {
	
	// COMPLETE (1) create Notes widget
	// COMPLETE (2) create routeName as static final
	
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
							onTap: () {
								// COMPLETE (4) remove _onListTap()
								// COMPLETE (5) close Navigation Drawer
								// COMPLETE (6) push Notes routeName to Navigator
								// COMPLETE (7) as an Exercise extract this Drawer as Drawer Widget
								// COMPLETE (8) Extracted Drawer Widget will be used in other widgets wherever requires
								Navigator.of(context).pop();
								// Navigator.of(context).pushNamed(Notes.routeName) will not have
								// transition animation and can be used for modal forms
								// Which we will see in Forms & Validation.
								// Navigator.of(context).pushNamed(Notes.routeName);
								
								// To add transition we are using PageRouteBuilder
								Navigator.of(context).push(
									new PageRouteBuilder(
										pageBuilder: (BuildContext context, _, __) {
											return new Notes();
										},
										transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
											return new FadeTransition(
												opacity: animation,
												child: child
											);
										}
									)
								);
							},
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
	
}

class Notes extends StatelessWidget {
	static final String routeName = '/notes';
	
	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			drawer: new Drawer(),
			appBar: new AppBar(
				title: new Text('Notes'),
			),
			body: new Center(
				child: new Text(
					'Notes',
					style: new TextStyle(
						fontSize: 24.0
					)
				),
			),
		);
	}
}