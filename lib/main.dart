import 'package:flutter/material.dart';
import 'package:flutter_quiz/models/quiz_background.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Quiz();
  }
}
