import 'package:flutter/material.dart';
import '../models/question.dart';

class QuestionDisplay extends StatelessWidget {
  final List<Question> questions;
  final int currentQuestion;

  QuestionDisplay({
    this.questions,
    this.currentQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            questions[currentQuestion].question,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
