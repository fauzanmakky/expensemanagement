import 'package:expensemanagement/commons/database/app_database.dart';
import 'package:expensemanagement/module/expense/data/dao/expense_dao.dart';
import 'package:expensemanagement/module/expense/data/model/expense_data_model.dart';

abstract class ExpenseLocalDataSource {
  Future<int> addExpense(ExpensesCompanion expense);

  Future<List<ExpenseDataModel>> getExpensesWithCategory();

  Future<List<ExpenseDataModel>> getTodayExpenses();

  Future<double> getTodayTotal();

  Future<List<ExpenseDataModel>> getYesterdayExpenses();

  Future<double> getThisMonthTotal();

  Future<List<Map<String, dynamic>>> getThisMonthByCategory();
}

class ExpansesLocalDatasourceImpl implements ExpenseLocalDataSource {
  final ExpenseDao _dao;

  ExpansesLocalDatasourceImpl(this._dao);

  @override
  Future<int> addExpense(ExpensesCompanion expense) {
    return _dao.addExpense(expense);
  }

  @override
  Future<List<ExpenseDataModel>> getExpensesWithCategory() {
    return _dao.getExpensesWithCategory();
  }

  @override
  Future<List<ExpenseDataModel>> getTodayExpenses() {
    return _dao.getTodayExpenses();
  }

  @override
  Future<double> getTodayTotal() {
    return _dao.getTodayTotal();
  }

  @override
  Future<List<ExpenseDataModel>> getYesterdayExpenses() {
    return _dao.getYesterdayExpenses();
  }

  @override
  Future<double> getThisMonthTotal() {
    return _dao.getThisMonthTotal();
  }

  @override
  Future<List<Map<String, dynamic>>> getThisMonthByCategory() {
    return _dao.getThisMonthByCategory();
  }
}
