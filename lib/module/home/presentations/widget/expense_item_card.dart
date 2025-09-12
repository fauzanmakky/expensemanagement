import 'package:flutter/material.dart';

class ExpenseItemCard extends StatelessWidget {
  final String label;
  final double amount;
  final IconData icon;
  final Color color;

  const ExpenseItemCard({
    super.key,
    required this.label,
    required this.amount,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: color.withOpacity(0.2),
                child: Icon(icon, color: color),
              ),
              const SizedBox(width: 12),
              Text(label, style: const TextStyle(fontSize: 16)),
            ],
          ),
          Text(
            'Rp. ${amount.toStringAsFixed(0)}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
