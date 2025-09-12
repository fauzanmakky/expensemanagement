import 'package:dartz/dartz.dart';
import 'package:expensemanagement/commons/error/failure.dart';
import 'package:expensemanagement/module/expense/data/mappers/expense_mapper.dart';
import 'package:expensemanagement/module/expense/datasource/expense_local_datasource.dart';
import 'package:expensemanagement/module/expense/domain/entitiy/expense_entitiy.dart';
import 'package:expensemanagement/module/expense/domain/repositories/expense_repository.dart';

class ExpenseRepositoryImpl implements ExpenseRepository {
  final ExpenseLocalDataSource localDataSource;

  ExpenseRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, int>> addExpense(ExpenseEntity expense) async {
    try {
      final result = await localDataSource.addExpense(expense.toCompanion());
      return Right(result);
    } catch (e) {
      return Left(DatabaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ExpenseEntity>>> getExpensesWithCategory() async {
    try {
      final result = await localDataSource.getExpensesWithCategory();
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(DatabaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ExpenseEntity>>> getTodayExpenses() async {
    try {
      final result = await localDataSource.getTodayExpenses();
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(DatabaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, double>> getTodayTotal() async {
    try {
      final total = await localDataSource.getTodayTotal();
      return Right(total);
    } catch (e) {
      return Left(DatabaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ExpenseEntity>>> getYesterdayExpenses() async {
    try {
      final result = await localDataSource.getYesterdayExpenses();
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(DatabaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, double>> getThisMonthTotal() async {
    try {
      final total = await localDataSource.getThisMonthTotal();
      return Right(total);
    } catch (e) {
      return Left(DatabaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getThisMonthByCategory() async {
    try {
      final result = await localDataSource.getThisMonthByCategory();
      return Right(result);
    } catch (e) {
      return Left(DatabaseFailure(message: e.toString()));
    }
  }
}