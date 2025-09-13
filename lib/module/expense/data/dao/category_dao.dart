import 'package:drift/drift.dart';
import 'package:expensemanagement/commons/constants/assets_constants.dart';
import 'package:expensemanagement/commons/constants/color_constants.dart';
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
            icon: AssetsConstants.iconFood,
            color: ColorConstants.orange,
          ),
          CategoriesCompanion.insert(
            category: 'internet',
            label: 'Internet',
            icon: AssetsConstants.iconInternet,
            color: ColorConstants.blue3,
          ),
          CategoriesCompanion.insert(
            category: 'edukasi',
            label: 'Edukasi',
            icon: AssetsConstants.iconEducation,
            color: ColorConstants.orange,
          ),
          CategoriesCompanion.insert(
            category: 'hadiah',
            label: 'Hadiah',
            icon: AssetsConstants.iconGift,
            color: ColorConstants.red,
          ),
          CategoriesCompanion.insert(
            category: 'transport',
            label: 'Transport',
            icon: AssetsConstants.iconTransport,
            color: ColorConstants.purple1,
          ),
          CategoriesCompanion.insert(
            category: 'belanja',
            label: 'Belanja',
            icon: AssetsConstants.iconShop,
            color: ColorConstants.green2,
          ),
          CategoriesCompanion.insert(
            category: 'alatrumah',
            label: 'Alat Rumah',
            icon: AssetsConstants.iconHome,
            color: ColorConstants.purple2,
          ),
          CategoriesCompanion.insert(
            category: 'olahraga',
            label: 'Olahraga',
            icon: AssetsConstants.iconSport,
            color: ColorConstants.blue2,
          ),
          CategoriesCompanion.insert(
            category: 'liburan',
            label: 'Hiburan',
            icon: AssetsConstants.iconEntertainment,
            color: ColorConstants.blue1,
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
