import 'package:flutter/material.dart';

class ScoreKeeper extends StatelessWidget {
  final List<bool> scores;

  ScoreKeeper({this.scores});

  List<Widget> buildScoreKeeper() {
    return scores.map((answer) {
      if (answer) {
        return Icon(
          Icons.check,
          color: Colors.green,
        );
      } else {
        return Icon(
          Icons.close,
          color: Colors.red,
        );
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        children: buildScoreKeeper(),
      ),
    );
  }
}
