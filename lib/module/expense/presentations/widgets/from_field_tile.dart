import 'package:flutter/material.dart';

class FormFieldTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final IconData trailing;
  final VoidCallback onTap;

  const FormFieldTile({
    super.key,
    required this.icon,
    required this.label,
    required this.trailing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.teal),
            const SizedBox(width: 12),
            Expanded(
              child: Text(label,
                  style: const TextStyle(fontSize: 14, color: Colors.black87)),
            ),
            Icon(trailing, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
