import 'package:dartz/dartz.dart';
import 'package:expensemanagement/commons/error/failure.dart';
import 'package:expensemanagement/module/expense/domain/entity/expense_entity.dart';
import 'package:expensemanagement/module/expense/domain/repositories/expense_repository.dart';

class GetYesterdayExpenses {
  final ExpenseRepository repository;

  GetYesterdayExpenses(this.repository);

  Future<Either<Failure, List<ExpenseEntity>>> call() {
    return repository.getYesterdayExpenses();
  }
}