class CategoryDataModel {
  final int idCategory;
  final String category;
  final String label;
  final String icon;
  final String color;

  const CategoryDataModel({
    required this.idCategory,
    required this.category,
    required this.label,
    required this.icon,
    required this.color,
  });


  factory CategoryDataModel.fromMap(Map<String, dynamic> map) {
    return CategoryDataModel(
      idCategory: map['idCategory'] as int,
      category: map['category'] as String,
      label: map['label'] as String,
      icon: map['icon'] as String,
      color: map['color'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idCategory': idCategory,
      'category': category,
      'label': label,
      'icon': icon,
      'color': color,
    };
  }
}