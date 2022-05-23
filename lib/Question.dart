import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;
  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(20, 80, 20, 35),
        child: Text(questionText,
            style: TextStyle(
                fontSize: 45,
                color: Colors.purple,
                fontWeight: FontWeight.bold)));
  }
}
