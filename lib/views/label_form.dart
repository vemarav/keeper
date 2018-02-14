import 'package:flutter/material.dart';
import 'package:keeper/views/mock_data.dart';

class LabelForm extends StatefulWidget {
	static final String routeName = '/labelForm';
	
	@override
	State<StatefulWidget> createState() => new LabelFormState();
}

class LabelFormState extends State<LabelForm> {
	final _scaffoldKey = new GlobalKey<ScaffoldState>();
	final formKey = new GlobalKey<FormState>();
	String error;
	String updateError;
	List<Widget> labelList = [];
	final TextEditingController _controller = new TextEditingController();
	TextEditingController _updateController = new TextEditingController();
	
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
			body: new Container(
				child: new ListView(
					children: labelList
				)
			)
		);
		return scaffold;
	}
	
	@override
	void initState() {
		super.initState();
		_buildLabels(null);
	}
	
	_closeLabelForm(BuildContext context) {
		Navigator.of(context).pop();
	}
	
	List<Widget> _buildLabels(int editIndex) {
		labelList = [];
		labelList.add(
			new ListTile(
				leading: new IconButton(
					icon: const Icon(Icons.close),
					color: Colors.grey,
					onPressed: _clearText
				),
				title: new Theme(
					data: new ThemeData(
						primaryColor: Colors.blueGrey.shade500
					), // Setting the underline with appBar color
					child: new TextField(
						controller: _controller,
						style: new TextStyle(
							fontSize: 18.0,
							color: Colors.grey.shade700
						),
						decoration: new InputDecoration(
							errorText: error,
							labelText: 'Enter label Name',
							labelStyle: new TextStyle(
								color: Colors.blueGrey.shade700
							),
						),
					)
				),
				trailing: new IconButton(
					icon: const Icon(Icons.check),
					color: Colors.green,
					onPressed: _onSave
				),
			)
		);
		
		for(int index=0; index<labels.length;index++) {
			if(editIndex != null && editIndex == index){
				if(updateError == null || updateError.isEmpty)
					_updateController = new TextEditingController(text: labels[index]);
				labelList.add(
					new ListTile(
						leading: new IconButton(
							icon: const Icon(Icons.close),
							onPressed: () => _onCancelAt(index)
						),
						title: new Theme(
							data: new ThemeData(
								primaryColor: Colors.blueGrey.shade500
							),
							child: new TextField(
								controller: _updateController,
								autofocus: true,
								style: new TextStyle(
									fontSize: 18.0,
									color: Colors.grey.shade700,
								),
								decoration: new InputDecoration(
									border: null,
									errorText: updateError,
									counterText: labels[index]
								)
							),
						),
						trailing: new IconButton(
							icon: const Icon(Icons.check),
							color: Colors.green,
							onPressed: () => _onUpdateAt(index)
						),
					)
				);
			}else{
				labelList.add(
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
		}
		return labelList;
	}
	
	_clearText() {
		setState((){
			_controller.clear();
			error = null;
			_buildLabels(null);
		});
	}
	
	_onSave() {
		setState(() {
			if(_controller.text.isNotEmpty) {
				labels.add(_controller.text);
				_controller.clear();
				error = null;
				_buildLabels(null);
			} else{
				error = 'Enter valid name!';
				_buildLabels(null);
			}
		});
	}
	
	_removeLabelAt(int index) {
		setState((){
			if(labels.length > 1) {
				labels.removeAt(index);
				_buildLabels(null);
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
			_updateController.clear();
			updateError = null;
			_buildLabels(index);
		});
	}
	
	_onUpdateAt(index) {
		setState(() {
			if(_updateController.text.isNotEmpty){
				labels[index] = _updateController.text;
				_updateController.clear();
				_buildLabels(null);
			} else {
				updateError = 'Enter valid name!';
				_buildLabels(index);
			}
		});
	}
	
	_onCancelAt(index) {
		setState(() {
			_buildLabels(null);
		});
	}
}