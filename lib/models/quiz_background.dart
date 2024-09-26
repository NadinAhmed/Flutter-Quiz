import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/questions_screen.dart';
import 'package:flutter_quiz/result_screen.dart';

import '../home_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  late Widget activeScreen;
  List<String> selectedAnswers = [];

  @override
  void initState() {
    super.initState();
    activeScreen = HomeScreen(switchScreen);
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(onSelectedAnswer: chooseAnswer);
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultScreen(
          chooseAnswers: selectedAnswers,
          onRestartClicked: restartQuiz,
        );
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = QuestionsScreen(onSelectedAnswer: chooseAnswer);
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.lightBlue,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
