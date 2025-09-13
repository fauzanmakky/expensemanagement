import 'package:expensemanagement/commons/error/failure.dart';
import 'package:expensemanagement/module/expense/domain/usecase/add_default_category.dart';
import 'package:expensemanagement/module/expense/domain/usecase/add_expense.dart';
import 'package:expensemanagement/module/expense/domain/usecase/get_all_categories.dart';
import 'package:expensemanagement/module/expense/presentations/expense/bloc/expense_event.dart';
import 'package:expensemanagement/module/expense/presentations/expense/bloc/expense_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  final AddExpense addExpenseUseCase;
  final InsertDefaultCategories insertDefaultCategoriesUseCase;
  final GetAllCategories getAllCategoriesUseCase;

  ExpenseBloc({
    required this.addExpenseUseCase,
    required this.insertDefaultCategoriesUseCase,
    required this.getAllCategoriesUseCase,
  }) : super(const ExpenseState()) {
    on<AddExpenseEvent>((event, emit) async {
      final result = await addExpenseUseCase(event.expense);
      result.fold(
        (failure) {
          if (failure is DatabaseFailure) {
            emit(state.copyWith(error: failure.message));
          }
        },
        (_) {
          emit(state.copyWith(error: null));
        },
      );
    });

    on<InsertDefaultCategoriesEvent>((event, emit) async {
      final result = await insertDefaultCategoriesUseCase();
      result.fold((failure) {
        if (failure is DatabaseFailure) {
          emit(state.copyWith(error: failure.message));
        }
      }, (_) => emit(state.copyWith(error: null)));
    });

    on<GetAllCategoriesEvent>((event, emit) async {
      final result = await getAllCategoriesUseCase();
      result.fold(
        (failure) {
          if (failure is DatabaseFailure) {
            emit(state.copyWith(error: failure.message));
          }
        },
        (categories) =>
            emit(state.copyWith(categories: categories, error: null)),
      );
    });
  }
}
