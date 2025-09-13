import 'package:dartz/dartz.dart';
import 'package:expensemanagement/commons/error/failure.dart';
import 'package:expensemanagement/module/expense/domain/entity/expense_param.dart';
import 'package:expensemanagement/module/expense/domain/repositories/expense_repository.dart';

class AddExpense {
  final ExpenseRepository repository;

  AddExpense(this.repository);

  Future<Either<Failure, int>> call(ExpenseParam expense) {
    return repository.addExpense(expense);
  }
}
