import 'package:flutter/material.dart';
import 'package:keeper/views/keeper_drawer.dart';

class KeeperApp extends StatelessWidget {
	final List<String> labels = [
		'Expense', 'Inspiration', 'Personal', 'Work'
	];
	
	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			drawer: new KeeperDrawer(labels: labels),
			appBar: new AppBar(
				title: new Text('Keeper'),
			),
			body: new Center(
				child: new Text('Hello World!')
			)
		);
	}
	
}