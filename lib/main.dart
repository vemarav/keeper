import 'package:flutter/material.dart';

const String _AccountName = 'Aravind Vemula';
const String _AccountEmail = 'vemula.aravind336@gmail.com';
const String _AccountAbbr = 'AV';

void main() => runApp(new Keeper());

class Keeper extends StatelessWidget {
	@override
	
	// TODO (9) add theme to MaterialApp with (primaryColor: Colors.yellow.700)
	Widget build(BuildContext context) {
		return new MaterialApp(
			title: 'Keeper',
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
	// TODO (10) Exercise make children Dynamic
	
	Drawer drawer = new Drawer(
		child: new Column(children: <Widget>[
			new UserAccountsDrawerHeader(
				accountName: const Text(_AccountName),
				accountEmail: const Text(_AccountEmail),
				currentAccountPicture: new CircleAvatar(
					backgroundColor: Colors.brown,
					child: new Text(_AccountAbbr)
				),
			)
		])
	);
	
	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			drawer: drawer,
			appBar: new AppBar(
				title: new Text('Keeper'),
			),
			body: new Center(
				child: new Text('Hello World!')
			)
		);
	}
	
}