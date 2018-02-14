import 'package:flutter/material.dart';
import 'package:keeper/views/app.dart';

// TODO (1) replace KeeperApp with LabelView
// TODO (2) make LabelView StatefulWidget
// TODO (3) add static routeName to '/' in LabelView
// TODO (4) create LabelForm as StatefulWidget
// TODO (5) add static routeName to '/labelForm'
// TODO (6) create mock_data.dart and add global variables for labels
// TODO (7) import mock_data in LabelView and pass labels to KeeperDrawer constructor
// TODO (8) delete keeper_app.dart
// if labels value changes then LabelViewState update's the view
// using form we change the labels value so LabelViewState Widget
// depends on labels hence it updates the drawer
// * [Note] Usage of global variables is not recommended unless you
// are using them for development purpose

void main() {
	runApp(new Keeper());
}