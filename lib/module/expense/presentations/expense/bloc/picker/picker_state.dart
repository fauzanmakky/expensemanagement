import 'package:expensemanagement/module/expense/domain/entity/category_entity.dart';

class PickerState {
  final DateTime selectedDate;
  final CategoryEntity selectedCategory;


  PickerState({
    DateTime? selectedDate,
    CategoryEntity? selectedCategory,
  })  : selectedDate = selectedDate ?? DateTime.now(),
        selectedCategory = selectedCategory ?? CategoryEntity.empty();

  PickerState copyWith({
    DateTime? selectedDate,
    CategoryEntity? selectedCategory,
  }) {
    return PickerState(
      selectedDate: selectedDate ?? this.selectedDate,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}