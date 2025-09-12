import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:expensemanagement/module/expense/data/dao/category_dao.dart';
import 'package:expensemanagement/module/expense/data/dao/expense_dao.dart';
import 'package:expensemanagement/module/expense/data/model/category_table.dart';
import 'package:expensemanagement/module/expense/data/model/expense_table.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';


part 'app_database.g.dart';


@DriftDatabase(tables: [Categories, Expenses], daos: [CategoryDao, ExpenseDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'app_db.sqlite'));
    return NativeDatabase(file);
  });
}