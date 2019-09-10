import 'dart:async';
import 'package:flutter/material.dart';


class KBackButton extends StatelessWidget {
  final VoidCallback callback;
  KBackButton({this.callback});

  @override
  Widget build(BuildContext context) {

    return IconButton(
        onPressed: callback,
        icon: Icon(Icons.arrow_back_ios)
    );
  }

}
