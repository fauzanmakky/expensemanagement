class ExpenseEntity {
  final int idExpense;
  final String category;
  final DateTime date;
  final String title;
  final double price;
  final String label;
  final String icon;
  final String color;

  const ExpenseEntity({
    required this.idExpense,
    required this.category,
    required this.date,
    required this.title,
    required this.price,
    required this.label,
    required this.icon,
    required this.color,
  });
}
