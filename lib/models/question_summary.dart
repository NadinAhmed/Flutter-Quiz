import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({
    super.key,
    required this.questionIndex,
    required this.isAnswerTrue,
    required this.selectedAnswer,
  });

  final int questionIndex;
  final bool isAnswerTrue;
  final String selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isAnswerTrue
                    ? const Color(0xFF2E8B57)
                    : const Color(0xFFFF6347),
              ),
              alignment: Alignment.center,
              margin: const EdgeInsetsDirectional.only(end: 16),
              child: Text('${questionIndex + 1}'),
            ),
            Expanded(
              child: Text(
                questions[questionIndex].question,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 46),
          child: Text(
            selectedAnswer,
            style: TextStyle(
              color: isAnswerTrue
                  ? const Color(0xFF2E8B57)
                  : const Color(0xFFFF6347),
              fontSize: 16,
            ),
          ),
        ),
        if (!isAnswerTrue)
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 46),
            child: Text(
              questions[questionIndex].answer[0],
              style: const TextStyle(
                color: Color(0xFF2E8B57),
                fontSize: 16,
              ),
            ),
          ),
        const SizedBox(height: 20),
      ],
    );
  }
}
