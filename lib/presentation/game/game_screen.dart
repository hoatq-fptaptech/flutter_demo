import 'dart:math';

import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget{
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}
class _GameScreenState extends State<GameScreen>{

  int num1 = 0;
  int num2 = 0;
  int answer = 0;
  int score = 0;
  bool isCorrect = false;

  @override
  void initState() {
    super.initState();
    generateQuestion();
  }

  void generateQuestion() {
    Random random = Random();
    num1 = random.nextInt(10) + 1;
    num2 = random.nextInt(10) + 1;
    answer = num1 + num2;
  }

  void checkAnswer(int input) {
    setState(() {
      if (input == answer) {
        isCorrect = true;
        score++;
      } else {
        isCorrect = false;
      }
      generateQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<int> answers = [answer-1,answer,answer+1];
    answers.shuffle();
    print(answers[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text('Addition Subtraction Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Score: $score',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              '$num1 + $num2 = ?',
              style: TextStyle(fontSize: 36),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => checkAnswer(answers[0]),
                  child: Text('${answers[0]}'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => checkAnswer(answers[1]),
                  child: Text('${answers[1]}'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => checkAnswer(answers[2]),
                  child: Text('${answers[2]}'),
                ),
              ],
            ),
            SizedBox(height: 20),
            if (isCorrect != null)
              Text(
                isCorrect ? 'Correct!' : 'Incorrect!',
                style: TextStyle(fontSize: 24, color: isCorrect ? Colors.green : Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}