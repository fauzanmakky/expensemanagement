import 'package:equatable/equatable.dart';
import 'package:expensemanagement/module/expense/domain/entity/expense_entity.dart';
import 'package:expensemanagement/module/home/domain/entity/expense_category_entity.dart';

class HomeState extends Equatable {
  final List<ExpenseEntity> todayExpenses;
  final List<ExpenseEntity> yesterdayExpenses;
  final List<ExpenseCategoryEntity> thisMonthByCategory;
  final double todayTotal;
  final double thisMonthTotal;
  final bool isLoading;
  final String? error;

  const HomeState({
    this.todayExpenses = const [],
    this.yesterdayExpenses = const [],
    this.thisMonthByCategory = const [],
    this.todayTotal = 0.0,
    this.thisMonthTotal = 0.0,
    this.isLoading = false,
    this.error,
  });

  HomeState copyWith({
    List<ExpenseEntity>? todayExpenses,
    List<ExpenseEntity>? yesterdayExpenses,
    List<ExpenseCategoryEntity>? thisMonthByCategory,
    double? todayTotal,
    double? thisMonthTotal,
    bool? isLoading,
    String? error,
  }) {
    return HomeState(
      todayExpenses: todayExpenses ?? this.todayExpenses,
      yesterdayExpenses: yesterdayExpenses ?? this.yesterdayExpenses,
      thisMonthByCategory: thisMonthByCategory ?? this.thisMonthByCategory,
      todayTotal: todayTotal ?? this.todayTotal,
      thisMonthTotal: thisMonthTotal ?? this.thisMonthTotal,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
    todayExpenses,
    yesterdayExpenses,
    thisMonthByCategory,
    todayTotal,
    thisMonthTotal,
    isLoading,
    error,
  ];
}
