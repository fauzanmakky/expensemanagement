import 'package:expensemanagement/module/expense/data/dao/category_dao.dart';
import 'package:expensemanagement/module/expense/data/model/category_data_model.dart';



abstract class CategoryLocalDataSource {
  Future<List<CategoryDataModel>> getAllCategory();

  Future<void> insertDefaults();
}

class CategoryLocalDatasourceImpl implements CategoryLocalDataSource {
  final CategoryDao _dao;

  CategoryLocalDatasourceImpl(this._dao);

  @override
  Future<List<CategoryDataModel>> getAllCategory() async {
    return await _dao.getAllCategories();
  }

  @override
  Future<void> insertDefaults() async {
    await _dao.insertDefaultCategories();
  }
}
