import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  final Function(int) callback;
  final int option;

  Option(this.callback, this.option);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: ElevatedButton(
            onPressed: (() => callback(option)),
            child: Text("$option", style: TextStyle(fontSize: 20))));
  }
}
