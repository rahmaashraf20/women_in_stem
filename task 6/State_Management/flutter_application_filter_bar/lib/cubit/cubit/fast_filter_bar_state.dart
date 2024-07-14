import 'package:flutter/material.dart';
import 'package:flutter_application_filter_bar/cubit/cubit/fast_filter_bar_cubit.dart';
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
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: [
                for (int i = 0; i < filters.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: FilterButton(
                      label: filters[i]['label'],
                      color: filters[i]['color'],
                      isSelected: selectedIndex == i,
                      onPressed: () {
                        context.read<FilterCubit>().selectButton(i);
                      },
                    ),
                  ),
              ],
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
