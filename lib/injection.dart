import 'package:expensemanagement/commons/database/app_database.dart';
import 'package:expensemanagement/module/expense/data/dao/category_dao.dart';
import 'package:expensemanagement/module/expense/data/dao/expense_dao.dart';
import 'package:expensemanagement/module/expense/data/repositories/category_repository_impl.dart';
import 'package:expensemanagement/module/expense/data/repositories/expense_repository_impl.dart';
import 'package:expensemanagement/module/expense/datasource/category_local_datasource.dart';
import 'package:expensemanagement/module/expense/datasource/expense_local_datasource.dart';
import 'package:expensemanagement/module/expense/domain/repositories/category_repository.dart';
import 'package:expensemanagement/module/expense/domain/repositories/expense_repository.dart';
import 'package:expensemanagement/module/expense/domain/usecase/add_default_category.dart';
import 'package:expensemanagement/module/expense/domain/usecase/add_expense.dart';
import 'package:expensemanagement/module/expense/domain/usecase/get_all_categories.dart';
import 'package:expensemanagement/module/expense/presentations/expense/bloc/expense_bloc.dart';
import 'package:expensemanagement/module/home/domain/usecase/get_this_month_by_category.dart';
import 'package:expensemanagement/module/home/domain/usecase/get_this_month_total.dart';
import 'package:expensemanagement/module/home/domain/usecase/get_today_expenses.dart';
import 'package:expensemanagement/module/home/domain/usecase/get_today_total.dart';
import 'package:expensemanagement/module/home/domain/usecase/get_yesterday_expenses.dart';
import 'package:expensemanagement/module/home/presentations/home/bloc/home_bloc.dart';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());

  getIt.registerLazySingleton<ExpenseDao>(() => ExpenseDao(getIt()));
  getIt.registerLazySingleton<CategoryDao>(() => CategoryDao(getIt()));

  getIt.registerLazySingleton<ExpenseLocalDataSource>(
    () => ExpansesLocalDatasourceImpl(getIt()),
  );
  getIt.registerLazySingleton<CategoryLocalDataSource>(
    () => CategoryLocalDatasourceImpl(getIt()),
  );

  getIt.registerLazySingleton<ExpenseRepository>(
    () => ExpenseRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(getIt()),
  );

  getIt.registerLazySingleton<GetAllCategories>(
    () => GetAllCategories(getIt()),
  );
  getIt.registerLazySingleton<InsertDefaultCategories>(
    () => InsertDefaultCategories(getIt()),
  );

  getIt.registerLazySingleton<AddExpense>(() => AddExpense(getIt()));
  getIt.registerLazySingleton<GetTodayExpenses>(
    () => GetTodayExpenses(getIt()),
  );
  getIt.registerLazySingleton<GetTodayTotal>(() => GetTodayTotal(getIt()));
  getIt.registerLazySingleton<GetYesterdayExpenses>(
    () => GetYesterdayExpenses(getIt()),
  );
  getIt.registerLazySingleton<GetThisMonthTotal>(
    () => GetThisMonthTotal(getIt()),
  );
  getIt.registerLazySingleton<GetThisMonthByCategory>(
    () => GetThisMonthByCategory(getIt()),
  );

  getIt.registerFactory(
    () => ExpenseBloc(
      addExpenseUseCase: getIt(),
      insertDefaultCategoriesUseCase: getIt(),
      getAllCategoriesUseCase: getIt(),
    ),
  );

  getIt.registerFactory(
    () => HomeBloc(
      getTodayExpenses: getIt(),
      getYesterdayExpenses: getIt(),
      getTodayTotal: getIt(),
      getThisMonthTotal: getIt(),
      getThisMonthByCategory: getIt(),
    ),
  );
}
