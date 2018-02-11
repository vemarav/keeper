import 'package:flutter/material.dart';
import 'package:keeper/views/keeper_drawer.dart';

class LabelView extends StatelessWidget {
	static final String routeName = '/notes';
	final List<String> labels = [
		'Expense', 'Inspiration', 'Personal', 'Work'
	];
	final String title;
	LabelView({this.title});
	
	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			drawer: new KeeperDrawer(labels: labels),
			appBar: new AppBar(
				title: new Text(this.title),
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