import 'package:expensemanagement/module/home/data/model/expense_category_data_model.dart';
import 'package:expensemanagement/module/home/domain/entity/expense_category_entity.dart';

extension ExpenseCategoryMapper on ExpenseCategoryDataModel {
  ExpenseCategoryEntity toEntity() {
    return ExpenseCategoryEntity(
      category: category,
      label: label,
      icon: icon,
      color: color,
      total: total,
    );
  }
}

extension ExpenseCategoryEntityMapper on ExpenseCategoryEntity {
  ExpenseCategoryDataModel toModel() {
    return ExpenseCategoryDataModel(
      category: category,
      label: label,
      icon: icon,
      color: color,
      total: total,
    );
  }
}
