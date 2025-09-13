import 'package:equatable/equatable.dart';
import 'package:expensemanagement/module/expense/domain/entity/expense_param.dart';

abstract class ExpenseEvent extends Equatable {
  const ExpenseEvent();

  @override
  List<Object?> get props => [];
}

class AddExpenseEvent extends ExpenseEvent {
  final ExpenseParam expense;

  const AddExpenseEvent(this.expense);

  @override
  List<Object?> get props => [expense];
}

class InsertDefaultCategoriesEvent extends ExpenseEvent {}

class GetAllCategoriesEvent extends ExpenseEvent {}