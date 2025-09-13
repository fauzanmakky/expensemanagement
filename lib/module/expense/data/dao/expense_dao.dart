import 'package:drift/drift.dart';
import 'package:expensemanagement/commons/database/app_database.dart';
import 'package:expensemanagement/module/expense/data/model/expense_data_model.dart';
import 'package:expensemanagement/module/expense/data/model/category_table.dart';
import 'package:expensemanagement/module/expense/data/model/expense_table.dart';
import 'package:expensemanagement/module/home/data/model/expense_category_data_model.dart';

part 'expense_dao.g.dart';

@DriftAccessor(tables: [Expenses, Categories])
class ExpenseDao extends DatabaseAccessor<AppDatabase> with _$ExpenseDaoMixin {
  ExpenseDao(AppDatabase db) : super(db);

  Future<int> addExpense(ExpensesCompanion expense) =>
      into(expenses).insert(expense);

  Future<List<ExpenseDataModel>> getExpensesWithCategory() async {
    final query = select(expenses).join([
      innerJoin(categories, categories.category.equalsExp(expenses.category)),
    ]);
    final rows = await query.get();

    return rows.map((row) {
      final expense = row.readTable(expenses);
      final category = row.readTable(categories);
      return ExpenseDataModel(
        idExpense: expense.idExpense,
        category: expense.category,
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

    final query =
        select(expenses).join([
          innerJoin(
            categories,
            categories.category.equalsExp(expenses.category),
          ),
        ])..where(
          expenses.date.isBiggerOrEqualValue(start) &
              expenses.date.isSmallerThanValue(end),
        );

    final rows = await query.get();
    return rows.map((row) {
      final expense = row.readTable(expenses);
      final category = row.readTable(categories);
      return ExpenseDataModel(
        idExpense: expense.idExpense,
        category: expense.category,
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
    final total =
        await (selectOnly(expenses)
              ..addColumns([query])
              ..where(
                expenses.date.isBiggerOrEqualValue(start) &
                    expenses.date.isSmallerThanValue(end),
              ))
            .getSingle();
    return total.read(query) ?? 0.0;
  }

  Future<List<ExpenseDataModel>> getYesterdayExpenses() async {
    final now = DateTime.now();
    final start = DateTime(
      now.year,
      now.month,
      now.day,
    ).subtract(const Duration(days: 1));
    final end = DateTime(now.year, now.month, now.day);

    final query =
        select(expenses).join([
          innerJoin(
            categories,
            categories.category.equalsExp(expenses.category),
          ),
        ])..where(
          expenses.date.isBiggerOrEqualValue(start) &
              expenses.date.isSmallerThanValue(end),
        );

    final rows = await query.get();

    return rows.map((row) {
      final expense = row.readTable(expenses);
      final category = row.readTable(categories);
      return ExpenseDataModel(
        idExpense: expense.idExpense,
        category: expense.category,
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
    final total =
        await (selectOnly(expenses)
              ..addColumns([query])
              ..where(
                expenses.date.isBiggerOrEqualValue(start) &
                    expenses.date.isSmallerThanValue(end),
              ))
            .getSingle();
    return total.read(query) ?? 0.0;
  }

  Future<List<ExpenseCategoryDataModel>> getThisMonthByCategory() async {
    final now = DateTime.now();
    final start = DateTime(now.year, now.month);
    final end = DateTime(now.year, now.month + 1);

    final priceSum = expenses.price.sum();

    final query =
        select(expenses).join([
            innerJoin(
              categories,
              categories.category.equalsExp(expenses.category),
            ),
          ])
          ..addColumns([priceSum])
          ..where(
            expenses.date.isBiggerOrEqualValue(start) &
                expenses.date.isSmallerThanValue(end),
          )
          ..groupBy([categories.category]);

    final result = await query.get();

    final data = result.map((row) {
      final category = row.readTable(categories);
      final total = row.read(priceSum) ?? 0;

      return ExpenseCategoryDataModel(
        category: category.category,
        label: category.label,
        icon: category.icon,
        color: category.color,
        total: total,
      );
    }).toList();

    return data;
  }
}
