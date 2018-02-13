import 'package:flutter/material.dart';
import 'package:keeper/views/label_form.dart';
import 'label_view.dart';

class Keeper extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return new MaterialApp(
			title: 'Keeper',
			theme: new ThemeData(
				primaryColor: Colors.amber.shade500,
				primaryTextTheme: const TextTheme(
					headline: const TextStyle(
						color: Colors.white
					)
				)
			),
			routes: <String, WidgetBuilder> {
				LabelView.routeName : (BuildContext context) => new LabelView(title: 'Notes'),
				LabelForm.routeName : (BuildContext context) => new LabelForm()
			}
		);
	}
	
}