import 'package:flutter/material.dart';
import 'package:team_quiz_app/screens/questions_screen.dart';
import 'package:team_quiz_app/widgets/category_card.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  List data = [
    {'name': 'IQ quiz', 'color': Colors.red},
    {'name': 'Sport quiz', 'color': Colors.white},
    {'name': 'History quiz', 'color': Colors.green},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (int i = 0; i < data.length; i++)
            CategoryCard(
              quizName: data[i]['name'],
              quizColor: data[i]['color'],
            ),
        ],
      ),
    );
  }
}
