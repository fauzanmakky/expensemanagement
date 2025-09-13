import 'package:dartz/dartz.dart' show Either;
import 'package:expensemanagement/commons/error/failure.dart';
import 'package:expensemanagement/module/expense/domain/entity/expense_entity.dart';
import 'package:expensemanagement/module/expense/domain/entity/expense_param.dart';
import 'package:expensemanagement/module/home/domain/entity/expense_category_entity.dart';

abstract class ExpenseRepository {
  Future<Either<Failure, int>> addExpense(ExpenseParam expense);

  Future<Either<Failure, List<ExpenseEntity>>> getExpensesWithCategory();

  Future<Either<Failure, List<ExpenseEntity>>> getTodayExpenses();

  Future<Either<Failure, double>> getTodayTotal();

  Future<Either<Failure, List<ExpenseEntity>>> getYesterdayExpenses();

  Future<Either<Failure, double>> getThisMonthTotal();

  Future<Either<Failure, List<ExpenseCategoryEntity>>> getThisMonthByCategory();
}
