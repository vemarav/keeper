import 'package:flutter/material.dart';

// TODO (3) create constant String for accountName as _AccountName
// TODO (4) create constant String for accountEmail as _AccountEmail
// TODO (5) create constant String for _AccountAbbr

void main() => runApp(new Keeper());

class Keeper extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return new MaterialApp(
			title: 'Keeper',
			home: new KeeperDrawer(),
		);
	}
	
}


class KeeperDrawer extends StatelessWidget {
	
	// TODO (1) create new Column as drawer child in Drawer constructor
	// refer: https://docs.flutter.io/flutter/widgets/Column-class.html
	// TODO (2) create UserAccountsDrawerHeader in Column children as first child
	// refer: https://docs.flutter.io/flutter/material/UserAccountsDrawerHeader-class.html
	// TODO (5) pass _AccountName and _AccountEmail to UserAccountsDrawerHeader as Text(String)
	// TODO (6) create CircleAvatar as currentAccountPicture in UserAccountsDrawerHeader constructor
	// refer: https://docs.flutter.io/flutter/material/CircleAvatar-class.html
	// TODO (7) pass _AccountAbbr as Text(String) to CircleAvatar child
	// Now run app and you will see a Nice DrawerHeader
	// TODO (8) As an Exercise try adding CircleAvatar backgroundImage and create Pull Request.
	
	Drawer drawer = new Drawer();
	
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