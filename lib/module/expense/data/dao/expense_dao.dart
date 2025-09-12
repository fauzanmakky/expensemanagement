import 'package:drift/drift.dart';
import 'package:expensemanagement/commons/database/app_database.dart';
import 'package:expensemanagement/module/expense/data/model/expense_data_model.dart';
import 'package:expensemanagement/module/expense/data/model/category_table.dart';
import 'package:expensemanagement/module/expense/data/model/expense_table.dart';



part 'expense_dao.g.dart';


@DriftAccessor(tables: [Expenses, Categories])
class ExpenseDao extends DatabaseAccessor<AppDatabase>
    with _$ExpenseDaoMixin {
  ExpenseDao(AppDatabase db) : super(db);

  Future<int> addExpense(ExpensesCompanion expense) =>
      into(expenses).insert(expense);

  Future<List<ExpenseDataModel>> getExpensesWithCategory() async {
    final query = select(expenses).join([
      innerJoin(categories, categories.idCategory.equalsExp(expenses.idCategory)),
    ]);
    final rows = await query.get();

    return rows.map((row) {
      final expense = row.readTable(expenses);
      final category = row.readTable(categories);
      return ExpenseDataModel(
        idExpense: expense.idExpense,
        idCategory: expense.idCategory,
        date: expense.date,
        title: expense.title,
        price: expense.price,
        label: category.label,
        icon: category.icon,
        color: category.color,
      );
    }).toList();
  }


  Future<List<ExpenseDataModel>> getTodayExpenses() async {
    final now = DateTime.now();
    final start = DateTime(now.year, now.month, now.day);
    final end = start.add(const Duration(days: 1));

    final query = select(expenses).join([
      innerJoin(categories, categories.idCategory.equalsExp(expenses.idCategory)),
    ])
      ..where(expenses.date.isBiggerOrEqualValue(start) &
      expenses.date.isSmallerThanValue(end));

    final rows = await query.get();
    return rows.map((row) {
      final expense = row.readTable(expenses);
      final category = row.readTable(categories);
      return ExpenseDataModel(
        idExpense: expense.idExpense,
        idCategory: expense.idCategory,
        date: expense.date,
        title: expense.title,
        price: expense.price,
        label: category.label,
        icon: category.icon,
        color: category.color,
      );
    }).toList();
  }


  Future<double> getTodayTotal() async {
    final now = DateTime.now();
    final start = DateTime(now.year, now.month, now.day);
    final end = start.add(const Duration(days: 1));

    final query = expenses.price.sum();
    final total = await (selectOnly(expenses)
      ..addColumns([query])
      ..where(expenses.date.isBiggerOrEqualValue(start) &
      expenses.date.isSmallerThanValue(end)))
        .getSingle();
    return total.read(query) ?? 0.0;
  }

  Future<List<ExpenseDataModel>> getYesterdayExpenses() async {
    final now = DateTime.now();
    final start = DateTime(now.year, now.month, now.day).subtract(const Duration(days: 1));
    final end = DateTime(now.year, now.month, now.day);

    final query = select(expenses).join([
      innerJoin(categories, categories.idCategory.equalsExp(expenses.idCategory)),
    ])
      ..where(expenses.date.isBiggerOrEqualValue(start) &
      expenses.date.isSmallerThanValue(end));

    final rows = await query.get();
    return rows.map((row) {
      final expense = row.readTable(expenses);
      final category = row.readTable(categories);
      return ExpenseDataModel(
        idExpense: expense.idExpense,
        idCategory: expense.idCategory,
        date: expense.date,
        title: expense.title,
        price: expense.price,
        label: category.label,
        icon: category.icon,
        color: category.color,
      );
    }).toList();
  }


  Future<double> getThisMonthTotal() async {
    final now = DateTime.now();
    final start = DateTime(now.year, now.month);
    final end = DateTime(now.year, now.month + 1);

    final query = expenses.price.sum();
    final total = await (selectOnly(expenses)
      ..addColumns([query])
      ..where(expenses.date.isBiggerOrEqualValue(start) &
      expenses.date.isSmallerThanValue(end)))
        .getSingle();
    return total.read(query) ?? 0.0;
  }

  Future<List<Map<String, dynamic>>> getThisMonthByCategory() async {
    final now = DateTime.now();
    final start = DateTime(now.year, now.month);
    final end = DateTime(now.year, now.month + 1);

    final priceSum = expenses.price.sum();

    final query = select(expenses).join([
      innerJoin(categories, categories.idCategory.equalsExp(expenses.idCategory)),
    ])
      ..where(expenses.date.isBiggerOrEqualValue(start) &
      expenses.date.isSmallerThanValue(end))
      ..groupBy([categories.idCategory]);

    final rows = await query.map((row) {
      final category = row.readTable(categories);
      final expenseSum = row.read(priceSum) ?? 0.0;
      return {
        'idCategory': category.idCategory,
        'label': category.label,
        'icon': category.icon,
        'color': category.color,
        'total': expenseSum,
      };
    }).get();

    return rows;
  }
}