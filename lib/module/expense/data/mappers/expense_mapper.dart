import 'package:expensemanagement/commons/database/app_database.dart';
import 'package:expensemanagement/module/expense/data/model/expense_data_model.dart';
import 'package:expensemanagement/module/expense/domain/entitiy/expense_entitiy.dart';

extension ExpenseMapper on ExpenseDataModel {
  ExpenseEntity toEntity() {
    return ExpenseEntity(
      idExpense: idExpense,
      idCategory: idCategory,
      date: date,
      title: title,
      price: price,
      label: label,
      icon: icon,
      color: color,
    );
  }
}

extension ExpenseEntityMapper on ExpenseEntity {
  ExpenseDataModel toDataModel() {
    return ExpenseDataModel(
      idExpense: idExpense,
      idCategory: idCategory,
      date: date,
      title: title,
      price: price,
      label: label,
      icon: icon,
      color: color,
    );
  }
}

extension ExpenseEntityToCompanion on ExpenseEntity {
  ExpensesCompanion toCompanion() {
    return ExpensesCompanion.insert(
      idCategory: idCategory,
      date: date,
      title: title,
      price: price,
    );
  }
}
