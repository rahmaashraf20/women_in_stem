import 'dart:async';

import 'package:flutter/material.dart';
import 'package:team_quiz_app/screens/score_screen.dart';

class QuestionsScreen extends StatefulWidget {
  final List<Map<String, dynamic>> questions;
  final String title;
  final Color color;

  QuestionsScreen({
    required this.questions,
    required this.title,
    required this.color,
  });

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int _questionsIndex = 0;
  int _totalScore = 0;
  int _timeLeft = 300; // 5 minutes in seconds
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      setState(() {
        if (_timeLeft < 1) {
          timer.cancel();
          _navigateToScoreScreen();
        } else {
          _timeLeft--;
        }
      });
    });
  }

  void _navigateToScoreScreen() {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => ScoreScreen(
          totalScore: _totalScore,
          numberOfQuestions: widget.questions.length,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _showLeaveQuizDialog(); // Show dialog when user presses back button
            },
          ),
          actions: [
            Icon(Icons.message),
            SizedBox(width: 12),
            Icon(Icons.notification_add),
            SizedBox(width: 12),
            Icon(Icons.search),
            SizedBox(width: 12),
          ],
          title: Text(widget.title),
          backgroundColor: widget.color,
        ),
        body: Padding(
          padding: const EdgeInsets.all(22),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Question number ${_questionsIndex + 1}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.questions[_questionsIndex]['question'] ??
                      'No question available',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 22),
                Text(
                  'Time left: ${_formatTime(_timeLeft)}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 22),
                for (int i = 0;
                    i <
                        (widget.questions[_questionsIndex]['answers'] as List)
                            .length;
                    i++)
                  ElevatedButton(
                    onPressed: () {
                      _totalScore +=
                          widget.questions[_questionsIndex]['answers'][i]
                              ['score'] as int;
                      if (_questionsIndex < widget.questions.length - 1) {
                        setState(() {
                          _questionsIndex++;
                        });
                      } else {
                        _navigateToScoreScreen();
                      }
                    },
                    child: Text(
                        widget.questions[_questionsIndex]['answers'][i]['ans']),
                  ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Person"),
          ],
        ),
      ),
    );
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = remainingSeconds.toString().padLeft(2, '0');
    return '$minutesStr:$secondsStr';
  }

  Future<bool> _onBackPressed() {
    _showLeaveQuizDialog();
    return Future.value(false);
  }

  void _showLeaveQuizDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Leave Quiz?"),
          content: Text("Are you sure you want to leave the quiz?"),
          actions: <Widget>[
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Leave"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop(); // Pop twice to exit the quiz screen
              },
            ),
          ],
        );
      },
    );
  }
}
