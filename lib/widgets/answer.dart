import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final bool value;
  final Function updateAnswerState;

  Answer({this.value, this.updateAnswerState});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: FlatButton(
          textColor: Colors.white,
          color: value ? Colors.green : Colors.red,
          child: Text(
            '${value.toString()[0].toUpperCase()}${value.toString().substring(1)}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          onPressed: () {
            updateAnswerState(value);
          },
        ),
      ),
    );
  }
}
