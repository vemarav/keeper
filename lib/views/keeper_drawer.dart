import 'package:flutter/material.dart';
import 'package:keeper/views/label_form.dart';
import 'package:keeper/views/label_view.dart';

const String _AccountName = 'Aravind Vemula';
const String _AccountEmail = 'vemula.aravind336@gmail.com';
const String _AccountAbbr = 'AV';

class KeeperDrawer extends StatelessWidget {
	
	final List<String> labels;
	KeeperDrawer({this.labels});
	
	@override
	Widget build(BuildContext context) {
		return new Drawer(
			child: new ListView(
				padding: const EdgeInsets.only(top: 0.0),
				children: _buildDrawerList(context)
			)
		);
	}
	
	_onTapOtherAccounts(BuildContext context) {
		Navigator.of(context).pop();
		showDialog<Null>(
			context: context,
			child: new AlertDialog(
				title: const Text('Account switching not implemented.'),
				actions: <Widget>[
					new FlatButton(
						child: const Text('OK'),
						onPressed: () {
							Navigator.of(context).pop();
						},
					),
				],
			),
		);
	}
	
	_onListTileTap(BuildContext context, String title) {
		Navigator.of(context).popUntil(ModalRoute.withName('/'));
		Navigator.of(context).push(
			new PageRouteBuilder(
				pageBuilder: (BuildContext context, _, __) {
					return new LabelView(title: title);
				},
				transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
					return new FadeTransition(
						opacity: animation,
						child: child
					);
				}
			)
		);
	}
	
	_onTapCreateOrEditLabel(BuildContext context) {
		Navigator.pop(context);
		Navigator.of(context).pushNamed(LabelForm.routeName);
	}
	
	List<Widget> _buildDrawerList(BuildContext context) {
		List<Widget> children = [];
		children..addAll(_buildUserAccounts(context))
			..addAll(_defaultLabels(context))
			..addAll([new Divider()])
			..addAll(_buildLabelWidgets(context))
			..addAll([new Divider()])
			..addAll(_buildActions(context))
			..addAll([new Divider()])
			..addAll(_buildSettingAndHelp(context));
		return children;
	}
	
	List<Widget> _buildUserAccounts(BuildContext context) {
		return [
			new UserAccountsDrawerHeader(
				accountName: const Text(_AccountName),
				accountEmail: const Text(_AccountEmail),
				currentAccountPicture: new CircleAvatar(
					backgroundColor: Colors.brown,
					child: new Text(_AccountAbbr)
				),
				otherAccountsPictures: <Widget>[
					new GestureDetector(
						onTap: () => _onTapOtherAccounts(context),
						child: new Semantics(
							label: 'Switch Account',
							child: new CircleAvatar(
								backgroundColor: Colors.brown,
								child: new Text('SA'),
							),
						),
					)
				]
			)
		];
	}
	
	List<Widget> _defaultLabels(BuildContext context) {
		String notes = 'Notes';
		return [
			new ListTile(
				leading: new Icon(Icons.lightbulb_outline),
				title: new Text(notes),
				onTap: () => _onListTileTap(context, notes),
			)
		];
	}
	
	List<Widget> _buildLabelWidgets(BuildContext context) {
		List<Widget> labelListTiles = [];
		labelListTiles.add(
			new ListTile(
				leading: new Text('Label'),
				trailing: new Text(
					'EDIT'
				),
				onTap: () => _onTapCreateOrEditLabel(context),
			)
		);
		labels.forEach((labelName) {
			labelListTiles.add(
				new ListTile(
					leading: new Icon(Icons.label),
					title: new Text(labelName),
					onTap: () => _onListTileTap(context, labelName),
				)
			);
		});
		labelListTiles.add(
			new ListTile(
				leading: new Icon(Icons.add),
				title: new Text('Create new label'),
				onTap: () => _onTapCreateOrEditLabel(context),
			)
		);
		return labelListTiles;
	}
	
	List<Widget> _buildActions(BuildContext context) {
		String archive = 'Archive';
		String trash = 'Trash';
		return [
			new ListTile(
				leading: new Icon(Icons.archive),
				title: new Text(archive),
				onTap: () => _onListTileTap(context, archive),
			),
			new ListTile(
				leading: new Icon(Icons.delete),
				title: new Text(trash),
				onTap: () => _onListTileTap(context, trash),
			)
		];
	}
	
	List<Widget> _buildSettingAndHelp(BuildContext context) {
		String settings = 'Settings';
		String helpAndFeedBack = 'Help & feedback';
		return [
			new ListTile(
				leading: new Icon(Icons.settings),
				title: new Text(settings),
				onTap: () => _onListTileTap(context, settings),
			),
			new ListTile(
				leading: new Icon(Icons.help),
				title: new Text(helpAndFeedBack),
				onTap: () => _onListTileTap(context, helpAndFeedBack),
			)
		];
	}
	
}