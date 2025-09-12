import 'package:drift/drift.dart';
import 'package:expensemanagement/module/expense/data/model/category_table.dart';


class Expenses extends Table {
  IntColumn get idExpense => integer().autoIncrement()();
  IntColumn get idCategory =>
      integer().references(Categories, #idCategory)();
  DateTimeColumn get date => dateTime()();
  TextColumn get title => text().withLength(min: 1, max: 100)();
  RealColumn get price => real()();
}
