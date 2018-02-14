import 'package:flutter/material.dart';
import 'package:keeper/views/app.dart';

// COMPLETE (1) replace KeeperApp with LabelView
// COMPLETE (2) make LabelView StatefulWidget
// COMPLETE (3) add static routeName to '/' in LabelView
// COMPLETE (4) create LabelForm as StatefulWidget
// COMPLETE (5) add static routeName to '/labelForm'
// COMPLETE (6) create mock_data.dart and add global variables for labels
// COMPLETE (7) import mock_data in LabelView and pass labels to KeeperDrawer constructor
// COMPLETE (8) delete keeper_app.dart
// if labels value changes then LabelViewState update's the view
// using form we change the labels value so LabelViewState Widget
// depends on labels hence it updates the drawer
// * [Note] Usage of global variables is not recommended unless you
// are using them for development purpose


void main() {
	runApp(new Keeper());
}