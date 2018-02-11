import 'package:flutter/material.dart';
import 'label_view.dart';
import 'keeper_app.dart';

class Keeper extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return new MaterialApp(
			title: 'Keeper',
			theme: new ThemeData(
				primaryColor: Colors.yellow.shade700
			),
			home: new KeeperApp(),
			routes: <String, WidgetBuilder> {
				LabelView.routeName : (BuildContext context) => new LabelView(title: 'Notes')
			}
		);
	}
	
}