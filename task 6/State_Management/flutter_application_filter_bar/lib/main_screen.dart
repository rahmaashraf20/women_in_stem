import 'package:flutter/material.dart';
import 'package:flutter_application_filter_bar/cubit/cubit/fast_filter_bar_cubit.dart';
import 'package:flutter_application_filter_bar/cubit/cubit/fast_filter_bar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('fast filter bar'),
      ),
      body: BlocProvider(
        create: (context) => FilterCubit(),
        child: Column(
          children: [
            FastFilterBar(),
            Expanded(
              child: Center(
                child: Text(
                  '',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
