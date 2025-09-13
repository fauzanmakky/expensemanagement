import 'package:expensemanagement/module/expense/domain/entity/category_entity.dart';
import 'package:expensemanagement/module/expense/presentations/expense/bloc/picker/picker_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PickerCubit extends Cubit<PickerState> {
  PickerCubit() : super(PickerState());

  DateTime get selectedDate => state.selectedDate;

  String get selectedCategoryId => state.selectedCategory.category;

  void pickDate(DateTime date) {
    emit(state.copyWith(selectedDate: date));
  }

  void selectCategory(CategoryEntity category) {
    emit(state.copyWith(selectedCategory: category));
  }

  void reset() {
    emit(
      PickerState(
        selectedDate: DateTime.now(),
        selectedCategory: CategoryEntity.empty(),
      ),
    );
  }
}
