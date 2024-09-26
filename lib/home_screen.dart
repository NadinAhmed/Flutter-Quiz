import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(this.switchToQuestionScreen, {super.key});

  final void Function() switchToQuestionScreen;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: Colors.white.withAlpha(150),
          ),
          const SizedBox(height: 80),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.playpenSans(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: widget.switchToQuestionScreen,
            icon: const Icon(Icons.arrow_forward, color: Colors.blue),
            label: const Text(
              'Start Quiz',
              style: TextStyle(color: Colors.blue),
            ),
          )
        ],
      ),
    );
  }
}
