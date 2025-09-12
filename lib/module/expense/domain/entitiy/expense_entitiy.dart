class ExpenseEntity {
  final int idExpense;
  final int idCategory;
  final DateTime date;
  final String title;
  final double price;
  final String label;
  final String icon;
  final String color;

  const ExpenseEntity({
    required this.idExpense,
    required this.idCategory,
    required this.date,
    required this.title,
    required this.price,
    required this.label,
    required this.icon,
    required this.color,
  });
}