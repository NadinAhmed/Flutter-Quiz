import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/models/question_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(
      {super.key, required this.chooseAnswers, required this.onRestartClicked});

  List<String> chooseAnswers = [];
  void Function() onRestartClicked;

  // List<Map<String, Object>> getSummaryData() {
  //   final List<Map<String, Object>> summary = [];
  //
  //   for (int i = 0; i < questions.length; i++) {
  //     summary.add(
  //       {
  //         'question_index': i,
  //         'question': questions[i].question,
  //         'correct_answer': questions[i].answer[0],
  //         'user_answer': chooseAnswers[i],
  //       },
  //     );
  //   }
  //   return summary;
  // }

  @override
  Widget build(BuildContext context) {
    int numOfQuestions = questions.length;
    int numOfCorrectAnswers = 0;
    for (int i = 0; i < chooseAnswers.length; i++) {
      if (chooseAnswers[i] == questions[i].answer[0]) {
        numOfCorrectAnswers++;
      }
    }

    return Center(
      child: Container(
        margin: const EdgeInsetsDirectional.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numOfCorrectAnswers out of $numOfQuestions questions correctly!',
              style: GoogleFonts.playpenSans(
                fontSize: 24,
                color: const Color(0xFF002f6c),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 400,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < questions.length; i++)
                      QuestionSummary(
                        questionIndex: i,
                        isAnswerTrue:
                            questions[i].answer[0] == chooseAnswers[i],
                        selectedAnswer: chooseAnswers[i],
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 35),
            ElevatedButton.icon(
                onPressed: onRestartClicked,
                label: const Text('Restart Quiz!'),
                icon: const Icon(Icons.restart_alt),
                style: TextButton.styleFrom(foregroundColor: Colors.blue)),
          ],
        ),
      ),
    );
  }
}
