import 'package:flutter/material.dart';
import 'package:flutter_application_fast_filter_bar/cubit/fast_filter_bar_cubit.dart';
import 'package:flutter_application_fast_filter_bar/cubit/fast_filter_bar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fast Filter Bar'),
      ),
      body: Column(
        children: [
          FastFilterBar(),
          Expanded(
            child: Center(
              child: BlocBuilder<FilterCubit, int>(
                builder: (context, selectedIndex) {
                  return Text(
                    selectedIndex == -1
                        ? ''
                        : '',
                    style: const TextStyle(fontSize: 24),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
