import 'package:equatable/equatable.dart';

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

  @override
  List<Object?> get props => [idCategory, category, label, icon, color];
}