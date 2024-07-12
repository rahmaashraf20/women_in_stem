import 'package:flutter/material.dart';
import 'package:team_quiz_app/notes.dart';
import 'package:team_quiz_app/screens/category_screen.dart';
import 'package:team_quiz_app/screens/landing_screen.dart';
import 'package:team_quiz_app/screens/questions_screen.dart';
import 'dart:io' show Platform;

import 'package:team_quiz_app/screens/score_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'quiz app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: LandingScreen(),
    );
  }
}
