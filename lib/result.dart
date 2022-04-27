import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

//positional argument
  Result(this.resultScore, this.resetHandler);

//getter
  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'Success';
    } else if (resultScore <= 12) {
      resultText = 'Fine';
    } else if (resultScore <= 16) {
      resultText = 'OK';
    } else {
      resultText = 'ok ok';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          TextButton(
            child: Text('Restart Quiz'),
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
