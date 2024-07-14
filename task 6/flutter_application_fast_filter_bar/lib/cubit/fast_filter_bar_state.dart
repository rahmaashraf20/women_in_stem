import 'package:flutter/material.dart';
import 'package:flutter_application_fast_filter_bar/cubit/fast_filter_bar_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class FastFilterBar extends StatelessWidget {
  final List<Map<String, dynamic>> filters = [
    {'label': 'تمت', 'color': Colors.red},
    {'label': 'تحت المراجعة', 'color': Colors.red},
    {'label': 'المكتملة', 'color': Colors.red},
    {'label': 'الملغية', 'color': Colors.red},
    {'label': 'قيد التنفيذ', 'color': Colors.red},
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, int>(
      builder: (context, selectedIndex) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: filters.asMap().entries.map((entry) {
                int idx = entry.key;
                Map<String, dynamic> filter = entry.value;
                return Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: FilterButton(
                    label: filter['label'],
                    color: filter['color'],
                    isSelected: selectedIndex == idx,
                    onPressed: () {
                      context.read<FilterCubit>().selectButton(idx);
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}

class FilterButton extends StatelessWidget {
  final String label;
  final Color color;
  final bool isSelected;
  final VoidCallback onPressed;

  const FilterButton({
    required this.label,
    required this.color,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: isSelected ? Colors.black : Colors.black, 
        backgroundColor: isSelected ? color : Colors.grey,
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
