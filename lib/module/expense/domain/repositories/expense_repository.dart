import 'package:dartz/dartz.dart' show Either;
import 'package:expensemanagement/commons/error/failure.dart';
import 'package:expensemanagement/module/expense/domain/entitiy/expense_entitiy.dart';

abstract class ExpenseRepository {
  Future<Either<Failure, int>> addExpense(ExpenseEntity expense);

  Future<Either<Failure, List<ExpenseEntity>>> getExpensesWithCategory();

  Future<Either<Failure, List<ExpenseEntity>>> getTodayExpenses();

  Future<Either<Failure, double>> getTodayTotal();

  Future<Either<Failure, List<ExpenseEntity>>> getYesterdayExpenses();

  Future<Either<Failure, double>> getThisMonthTotal();

  Future<Either<Failure, List<Map<String, dynamic>>>> getThisMonthByCategory();
}
