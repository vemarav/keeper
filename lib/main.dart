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
	// Initialize Drawer and pass it Scaffold
	Drawer drawer = new Drawer();
	
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
	    drawer: drawer, // drawer
	    appBar: new AppBar(
		    title: new Text('Keeper'),
	    ),
	    body: new Center(
		    child: new Text('Hello World!')
	    )
    );
  }
  
}