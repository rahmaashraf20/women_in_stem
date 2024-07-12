import 'package:flutter/material.dart';
import 'package:team_quiz_app/screens/questions_screen.dart';

class CategoryCard extends StatelessWidget {
  final String quizName;
  final Color quizColor;
  CategoryCard({
    required this.quizName,
    required this.quizColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => QuestionsScreen(),
          ),
        ),
        child: Container(
          color: quizColor,
          child: Center(
              child: Text(
            quizName,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          )),
        ),
      ),
    );
  }
}
