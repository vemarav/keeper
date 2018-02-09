import 'package:flutter/material.dart';

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
	// COMPLETE (1) Initialize Drawer
	Drawer drawer = new Drawer();
	// COMPLETE (2) Pass it to Scaffold Constructor
	// open terminal and enter
	// $ cd path_to_project
	// $ flutter run
	// wait it will install app on your mobile device or AVD.
	// Now click on Hamburger icon
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