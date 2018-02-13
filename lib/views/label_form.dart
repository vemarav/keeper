import 'package:flutter/material.dart';
import 'package:flutter/src/services/text_input.dart';
import 'package:keeper/views/label_names.dart';

class LabelForm extends StatefulWidget {
	static final String routeName = '/labelForm';
	
	@override
	State<StatefulWidget> createState() => new LabelFormState();
}

class LabelFormState extends State<LabelForm> {
	final _scaffoldKey = new GlobalKey<ScaffoldState>();
	final formKey = new GlobalKey<FormState>();
	String _error;
	final TextEditingController _controller = new TextEditingController();
	
	@override
	Widget build(BuildContext context) {
		Scaffold scaffold = new Scaffold(
			key: _scaffoldKey,
			appBar: new AppBar(
				leading: new IconButton(
					icon: const Icon(Icons.close),
					color: Colors.white,
					onPressed: () => _closeLabelForm(context),
				),
				title: new Text('Edit Labels',
					style: const TextStyle(
						color: Colors.white
					)
				),
				backgroundColor: Colors.blueGrey.shade500,
			),
			body: new ListView(
				children: _buildLabels(),
			),
		);
		
		return scaffold;
	}
	
	_closeLabelForm(BuildContext context) {
		Navigator.of(context).pop();
	}
	
	List<Widget> _buildLabels() {
		List<Widget> _labelList = [];
		_labelList.add(
			new ListTile(
				leading: new IconButton(
					icon: const Icon(Icons.close),
					color: Colors.grey,
					onPressed: _clearText
				),
				title: new TextField(
					controller: _controller,
					style: new TextStyle(
						fontSize: 18.0,
						color: Colors.grey.shade700
					),
					decoration: new InputDecoration(
						hintText: 'Label Name'
					),
				),
				subtitle: new Text(
					_error ?? '',
					style: new TextStyle(
						color: Colors.red.shade700
					)
				),
				trailing: new IconButton(
					icon: const Icon(Icons.check),
					color: Colors.green,
					onPressed: _onSave
				)
			)
		
		);
		for(int index=0; index<labels.length;index++) {
			_labelList.add(
				new ListTile(
					leading: new IconButton(
						icon: const Icon(Icons.delete),
						onPressed: () => _removeLabelAt(index)
					),
					title: new Text(labels[index]),
					trailing: new IconButton(
						icon: const Icon(Icons.edit),
						onPressed: () => _editLabelAt(index)
					),
				)
			);
		}
		return _labelList;
	}
	
	_clearText() {
		setState((){
			_controller.clear();
			_error = '';
		});
	}
	
	_onSave() {
		setState(() {
			if(_controller.text.length > 0) {
				labels.add(_controller.text);
				_controller.clear();
				_error = '';
			} else{
				_error = 'Enter valid name!';
			}
		});
	}
	
	_removeLabelAt(int index) {
		setState((){
			if(labels.length > 1) {
				labels.removeAt(index);
			} else {
				_scaffoldKey.currentState.showSnackBar(
					new SnackBar(
						content: new Text('Cannot Delete!'),
					)
				);
			}
			
		});
	}
	
	_editLabelAt(index) {
		setState((){
			labels[index] = labels[index] + " Edit";
		});
	}
}