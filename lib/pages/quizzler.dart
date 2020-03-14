import 'package:flutter/material.dart';

import '../widgets/question_display.dart';
import '../widgets/answer.dart';
import '../widgets/score_keeper.dart';
import '../models/question.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestion = 0;
  final List<bool> _scores = [];
  final List<Question> _questions = [
    Question(
      question: 'You can lead a cow down stairs but not up stairs.',
      answer: false,
    ),
    Question(
      question: 'Approximately one quarter of human bones are in the feet.',
      answer: true,
    ),
    Question(
      question: 'A slug\'s blood is green.',
      answer: true,
    ),
    Question(
      question: 'Is Leonardo Motta really hot?',
      answer: true,
    ),
  ];

  void _addAnswers(bool value) {
    final bool valueToAdd = _questions[_currentQuestion].answer == value;

    if (_scores.length < _questions.length) {
      setState(() {
        _scores.add(valueToAdd);
      });
    }

    if (_currentQuestion + 1 < _questions.length) {
      setState(() {
        _currentQuestion = _currentQuestion + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _scores.length < _questions.length
        ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              QuestionDisplay(
                questions: _questions,
                currentQuestion: _currentQuestion,
              ),
              Answer(
                value: true,
                updateAnswerState: _addAnswers,
              ),
              Answer(
                value: false,
                updateAnswerState: _addAnswers,
              ),
              ScoreKeeper(
                scores: _scores,
              ),
            ],
          )
        : Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      'Congratulations',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: FlatButton(
                  onPressed: () {},
                  color: Colors.green,
                  child: Text(
                    'Reset Quizz?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              ScoreKeeper(
                scores: _scores,
              ),
            ],
          );
  }
}
