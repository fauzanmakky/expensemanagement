import 'package:dartz/dartz.dart';
import 'package:expensemanagement/commons/error/failure.dart';
import 'package:expensemanagement/module/expense/domain/repositories/expense_repository.dart';
import 'package:expensemanagement/module/home/domain/entity/expense_category_entity.dart';

class GetThisMonthByCategory {
  final ExpenseRepository repository;

  GetThisMonthByCategory(this.repository);

  Future<Either<Failure, List<ExpenseCategoryEntity>>> call() {
    return repository.getThisMonthByCategory();
  }
}
