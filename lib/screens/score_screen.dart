import 'package:flutter/material.dart';
import 'package:team_quiz_app/screens/category_screen.dart';
import 'package:team_quiz_app/screens/landing_screen.dart';
import 'package:team_quiz_app/utils/globals.dart';

class ScoreScreen extends StatelessWidget {
  final int totalScore;
  final int numberOfQuestions;
  const ScoreScreen(
      {super.key, required this.totalScore, required this.numberOfQuestions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "Hello $userName, you have finished the quiz, and your acore is "),
            Text(
              "$totalScore/$numberOfQuestions",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 22, color: Colors.red),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => CategoryScreen(),
                    ),
                  );
                },
                child: Text("Play again")),
            OutlinedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => LandingScreen()),
                    ModalRoute.withName('//'),
                  );
                },
                child: Text("Exit")),
          ],
        ),
      ),
    );
  }
}
