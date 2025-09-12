import 'package:expensemanagement/module/expense/data/model/category_data_model.dart';
import 'package:expensemanagement/module/expense/domain/entitiy/category_entity.dart';

class CategoryMapper {
  static CategoryEntity toEntity(CategoryDataModel model) {
    return CategoryEntity(
      idCategory: model.idCategory,
      category: model.category,
      label: model.label,
      icon: model.icon,
      color: model.color,
    );
  }

  static List<CategoryEntity> toEntityList(List<CategoryDataModel> models) {
    return models.map((m) => toEntity(m)).toList();
  }
}
