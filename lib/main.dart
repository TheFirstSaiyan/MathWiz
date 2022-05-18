import 'dart:math';

import 'package:first_app/Option.dart';
import 'package:flutter/material.dart';

import './Question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  String text = "pressed ";
  static const int numQuestions = 5;
  static const int numOptions = 4;
  Random random = new Random();
  int num1 = 0;
  int num2 = 0;
  int ans = 0;
  List<int> answers = [];

  MyAppState() {
    num1 = random.nextInt(100) + 11;
    num2 = random.nextInt(100) + 3;
    ans = num1 + num2;
    int answerIndex = random.nextInt(numOptions);
    for (int i = 0; i < numOptions; i++) {
      int toAdd = random.nextInt(num1 + num2);
      if (toAdd == ans) toAdd + random.nextInt(10);
      answers.add(toAdd);
    }
    answers[answerIndex] = ans;
    print("$num1 + $num2");
    print(answers);
  }

  void updateQuestionAnswer() {
    setState(() {
      num1 = random.nextInt(100) + 11;
      num2 = random.nextInt(100) + 3;
      ans = num1 + num2;
      answers = [];
      int answerIndex = random.nextInt(numOptions);
      for (int i = 0; i < numOptions; i++) {
        int toAdd = random.nextInt(num1 + num2);
        if (toAdd == ans) toAdd + random.nextInt(10);
        answers.add(toAdd);
      }
      answers[answerIndex] = ans;
      print(answers);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text("Math Wiz!")),
            // ignore: prefer_const_literals_to_create_immutables
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Text(
                    "Can you solve this??",
                    style: TextStyle(fontSize: 40, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  Question("$num1 + $num2"),
                  ...answers
                      .map((ans) => Option(updateQuestionAnswer, ans))
                      .toList()
                ]))));
  }
}
