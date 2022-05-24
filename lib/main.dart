import 'dart:math';

import 'package:flutter/material.dart';

import './Quiz.dart';
import './Result.dart';

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
  static const int numQuestions = 10;
  static const int numOptions = 5;
  int currentQuestion = 0;
  Random random = new Random();
  int num1 = 0;
  int num2 = 0;
  int ans = 0;
  List<int> answers = [];
  int score = 0;

  MyAppState() {
    currentQuestion = 1;
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

  void updateQuestionAnswer(int chosenAnswer) {
    setState(() {
      if (num1 + num2 == chosenAnswer) score++;
      if (currentQuestion < numQuestions) {
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
      }
      currentQuestion++;
    });
  }

  void startAgain() {
    setState(() {
      score = 0;
      currentQuestion = 1;
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
      print("$num1 + $num2");
      print(answers);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text("Math Wiz!")),
            body: currentQuestion <= numQuestions
                ? Quiz(num1, num2, answers, updateQuestionAnswer)
                : Result(
                    "You scored ${score * 100 / numQuestions} %", startAgain)));
  }
}
