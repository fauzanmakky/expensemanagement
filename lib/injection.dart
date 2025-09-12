import 'package:expensemanagement/commons/database/app_database.dart';
import 'package:expensemanagement/module/expense/datasource/category_local_datasource.dart';
import 'package:expensemanagement/module/expense/datasource/expense_local_datasource.dart';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  final db = AppDatabase();

  getIt.registerSingleton<AppDatabase>(db);
  getIt.registerLazySingleton(
    () => CategoryLocalDatasourceImpl(db.categoryDao),
  );
  getIt.registerLazySingleton(() => ExpansesLocalDatasourceImpl(db.expenseDao));


}
