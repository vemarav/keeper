import 'dart:math';

import 'package:flutter/material.dart';
import 'package:keeper/views/keeper_drawer.dart';
import 'label_names.dart';

class LabelView extends StatefulWidget {
	static final String routeName = '/';
	final String title;
	LabelView({this.title});
	
	@override
	State createState() => new LabelViewState(title: title);
}

class LabelViewState extends State<LabelView> {
	GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
	
	final String title;
	LabelViewState({this.title});
	
	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			key: _scaffoldKey,
			drawer: new KeeperDrawer(labels: labels),
			appBar: new AppBar(
				leading: new IconButton(
					icon: const Icon(Icons.menu),
					color: Colors.white,
					onPressed: _openDrawer
				),
				title: new Text(title)
			),
			body: new Center(
				child: new Text(title),
			),
		);
	}
	
	_openDrawer() {
		_scaffoldKey.currentState.openDrawer();
	}

  _addLabel() {
		var _num = new Random().nextInt(10);
		setState((){
			labels.add("Label $_num");
		});
  }
  
  Widget _buttonAddLabel() {
	  return new MaterialButton(
		  child: new Text('Add Label'),
		  color: Colors.amberAccent,
		  splashColor: Colors.grey.shade300,
		  onPressed: _addLabel
	  );
  }
}