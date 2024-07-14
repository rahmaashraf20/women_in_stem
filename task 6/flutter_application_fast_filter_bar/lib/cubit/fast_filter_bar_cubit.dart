import 'package:flutter_bloc/flutter_bloc.dart';

class FilterCubit extends Cubit<int> {
  FilterCubit() : super(-1);

  void selectButton(int index) {
    emit(index);
  }
}
