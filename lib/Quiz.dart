import 'package:flutter/material.dart';
import './Question.dart';
import './Option.dart';

class Quiz extends StatelessWidget {
  final int num1, num2;
  final List<int> answers;
  final VoidCallback callback;

  Quiz(this.num1, this.num2, this.answers, this.callback);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        "Can you solve this??",
        style: TextStyle(fontSize: 40, color: Colors.black),
        textAlign: TextAlign.center,
      ),
      Question("$num1 + $num2"),
      ...answers.map((ans) => Option(callback, ans)).toList()
    ])));
  }
}
