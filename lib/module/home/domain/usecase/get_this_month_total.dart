import 'package:dartz/dartz.dart';
import 'package:expensemanagement/commons/error/failure.dart';
import 'package:expensemanagement/module/expense/domain/repositories/expense_repository.dart';

class GetThisMonthTotal {
  final ExpenseRepository repository;

  GetThisMonthTotal(this.repository);

  Future<Either<Failure, double>> call() {
    return repository.getThisMonthTotal();
  }
}