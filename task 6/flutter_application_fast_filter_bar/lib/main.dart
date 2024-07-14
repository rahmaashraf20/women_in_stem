import 'package:flutter/material.dart';
import 'package:flutter_application_fast_filter_bar/cubit/fast_filter_bar_cubit.dart';
import 'package:flutter_application_fast_filter_bar/main_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fast Filter Bar',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFCACDCA)),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => FilterCubit(),
        child: const MainScreen(),
      ),
    );
  }
}
