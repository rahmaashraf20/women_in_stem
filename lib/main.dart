import 'package:flutter/material.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'quiz app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LandingScreen(),
    );
  }
}
