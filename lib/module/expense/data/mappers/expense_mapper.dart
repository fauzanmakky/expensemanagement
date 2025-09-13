import 'package:expensemanagement/commons/database/app_database.dart';
import 'package:expensemanagement/module/expense/data/model/expense_data_model.dart';
import 'package:expensemanagement/module/expense/domain/entity/expense_entity.dart';
import 'package:expensemanagement/module/expense/domain/entity/expense_param.dart';


extension ExpenseMapper on ExpenseDataModel {
  ExpenseEntity toEntity() {
    return ExpenseEntity(
      idExpense: idExpense,
      category: category,
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
      category: category,
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
      category: category,
      date: date,
      title: title,
      price: price,
    );
  }
}

extension ExpenseParamsToCompanion on ExpenseParam {
  ExpensesCompanion toCompanion() {
    return ExpensesCompanion.insert(
      category: category,
      date: date,
      title: title,
      price: price,
    );
  }
}
