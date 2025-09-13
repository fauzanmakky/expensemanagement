import 'package:equatable/equatable.dart';
import 'package:expensemanagement/module/expense/domain/entity/category_entity.dart';
import 'package:expensemanagement/module/expense/domain/entity/expense_entity.dart';

class ExpenseState extends Equatable {
  final List<CategoryEntity> categories;
  final List<ExpenseEntity> expenses;
  final String? error;

  const ExpenseState({
    this.categories = const [],
    this.expenses = const [],
    this.error,
  });

  ExpenseState copyWith({
    List<CategoryEntity>? categories,
    List<ExpenseEntity>? expenses,
    String? error,
  }) {
    return ExpenseState(
      categories: categories ?? this.categories,
      expenses: expenses ?? this.expenses,
      error: error,
    );
  }

  @override
  List<Object?> get props => [categories, expenses, error];
}