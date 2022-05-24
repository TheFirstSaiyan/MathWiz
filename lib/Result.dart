import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String resultText;
  final VoidCallback startAgainCallback;

  Result(this.resultText, this.startAgainCallback);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        resultText,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
      ),
      TextButton(
        onPressed: startAgainCallback,
        child: Text("Try Again",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                decoration: TextDecoration.underline)),
      )
    ]));
  }
}
