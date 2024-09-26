import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onButtonClicked,
  });

  final String answerText;
  final void Function() onButtonClicked;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onButtonClicked,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.blue,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Text(answerText, textAlign: TextAlign.center),
    );
  }
}
