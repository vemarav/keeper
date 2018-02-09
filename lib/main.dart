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
	// TODO (1) Initialize Drawer
	// Drawer drawer = new Drawer();
	// TODO (2) Pass it to Scaffold Constructor
	
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
	    //drawer: drawer
	    appBar: new AppBar(
		    title: new Text('Keeper'),
	    ),
	    body: new Center(
		    child: new Text('Hello World!')
	    )
    );
  }
  
}