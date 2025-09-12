import 'package:drift/drift.dart';
import 'package:expensemanagement/commons/database/app_database.dart';
import 'package:expensemanagement/module/expense/data/model/category_data_model.dart';
import 'package:expensemanagement/module/expense/data/model/category_table.dart';

part 'category_dao.g.dart';

@DriftAccessor(tables: [Categories])
class CategoryDao extends DatabaseAccessor<AppDatabase>
    with _$CategoryDaoMixin {
  CategoryDao(AppDatabase db) : super(db);

  Future<void> insertDefaultCategories() async {
    if ((await select(categories).get()).isEmpty) {
      await batch((batch) {
        batch.insertAll(categories, [
          CategoriesCompanion.insert(
            category: 'makanan',
            label: 'Makanan',
            icon: 'restaurant',
            color: '#FFC107',
          ),
          CategoriesCompanion.insert(
            category: 'internet',
            label: 'Internet',
            icon: 'wifi',
            color: '#03A9F4',
          ),
          CategoriesCompanion.insert(
            category: 'edukasi',
            label: 'Edukasi',
            icon: 'book',
            color: '#FF9800',
          ),
          CategoriesCompanion.insert(
            category: 'hadiah',
            label: 'Hadiah',
            icon: 'card_giftcard',
            color: '#F44336',
          ),
          CategoriesCompanion.insert(
            category: 'transport',
            label: 'Transport',
            icon: 'directions_car',
            color: '#9C27B0',
          ),
          CategoriesCompanion.insert(
            category: 'belanja',
            label: 'Belanja',
            icon: 'shopping_cart',
            color: '#4CAF50',
          ),
          CategoriesCompanion.insert(
            category: 'alatrumah',
            label: 'Alat Rumah',
            icon: 'home',
            color: '#673AB7',
          ),
          CategoriesCompanion.insert(
            category: 'olahraga',
            label: 'Olahraga',
            icon: 'sports_soccer',
            color: '#2196F3',
          ),
          CategoriesCompanion.insert(
            category: 'liburan',
            label: 'Hiburan',
            icon: 'movie',
            color: '#3F51B5',
          ),
        ]);
      });
    }
  }

  Future<List<CategoryDataModel>> getAllCategories() async {
    final rows = await select(categories).get();
    return rows
        .map(
          (row) => CategoryDataModel(
            idCategory: row.idCategory,
            category: row.category,
            label: row.label,
            icon: row.icon,
            color: row.color,
          ),
        )
        .toList();
  }
}
