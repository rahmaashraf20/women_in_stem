//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:team_quiz_app/data/quiz_app_data.dart';
import 'package:team_quiz_app/utils/globals.dart';
import 'package:team_quiz_app/widgets/category_card.dart';



class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);

  List<Map<String, dynamic>> data = [
    {'name': 'IQ quiz', 'color': Colors.red,'questions': iqQuestions},
    {'name': 'Sports quiz', 'color': Colors.white,'questions': sportsQuestions},
    {'name': 'History quiz', 'color': Colors.green,'questions': historyQuestions},
  ];

  Future<bool> _onBackPressed(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure'),
          content: Text('Do you want to exit ?'),
          actions: <Widget>[
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    ).then((value) => value ?? false); // Ensure a default value is returned if showDialog returns null
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () => _onBackPressed(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (int i = 0; i < data.length; i++)
              CategoryCard(
                quizName: data[i]['name'],
                quizColor: data[i]['color'],
                questions: data[i]['questions'],
              ),
          ],
        ),
      ),
    );
  }
}