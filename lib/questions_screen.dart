import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/models/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectedAnswer});

  final void Function(String answer) onSelectedAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void onAnswerQuestion(String answer) {
    widget.onSelectedAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledList().map((answer) {
              return Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: AnswerButton(
                      answerText: answer,
                      onButtonClicked: () {
                        onAnswerQuestion(answer);
                      },
                    ),
                  ),
                  const SizedBox(height: 8)
                ],
              );
            })

            // for (int i = 0; i < currentQuestion.answer.length; i++)
            //   Column(
            //     children: [
            //       AnswerButton(
            //         answerText: currentQuestion.answer[i],
            //         onButtonClicked: () {},
            //       ),
            //       const SizedBox(height: 8),
            //     ],
            //   ),
          ],
        ),
      ),
    );
  }
}
