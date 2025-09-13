import 'package:equatable/equatable.dart';
import 'package:expensemanagement/commons/constants/assets_constants.dart';
import 'package:expensemanagement/commons/constants/color_constants.dart';

class CategoryEntity extends Equatable {
  final int idCategory;
  final String category;
  final String label;
  final String icon;
  final String color;

  const CategoryEntity({
    required this.idCategory,
    required this.category,
    required this.label,
    required this.icon,
    required this.color,
  });

  factory CategoryEntity.empty() {
    return CategoryEntity(
      idCategory: 0,
      label: 'Makanan',
      icon: AssetsConstants.iconFood,
      color: ColorConstants.yellow,
      category: 'makanan',
    );
  }

  @override
  List<Object?> get props => [idCategory, category, label, icon, color];
}
