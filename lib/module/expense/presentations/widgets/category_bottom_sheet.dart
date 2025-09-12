import 'package:flutter/material.dart';

class CategoryBottomSheet extends StatelessWidget {
  final void Function(String) onSelectCategory;

  const CategoryBottomSheet({super.key, required this.onSelectCategory});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'label': 'Makanan', 'icon': Icons.restaurant, 'color': Colors.amber},
      {'label': 'Internet', 'icon': Icons.wifi, 'color': Colors.lightBlue},
      {'label': 'Edukasi', 'icon': Icons.book, 'color': Colors.orange},
      {'label': 'Hadiah', 'icon': Icons.card_giftcard, 'color': Colors.red},
      {'label': 'Transport', 'icon': Icons.directions_car, 'color': Colors.purple},
      {'label': 'Belanja', 'icon': Icons.shopping_cart, 'color': Colors.green},
      {'label': 'Alat Rumah', 'icon': Icons.home, 'color': Colors.deepPurple},
      {'label': 'Olahraga', 'icon': Icons.sports_soccer, 'color': Colors.blue},
      {'label': 'Hiburan', 'icon': Icons.movie, 'color': Colors.indigo},
    ];

    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Pilih Kategori',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
            const SizedBox(height: 8),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final item = categories[index];
                return InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    onSelectCategory(item['label'] as String);
                    Navigator.pop(context);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 26,
                        backgroundColor: (item['color'] as Color).withOpacity(0.2),
                        child: Icon(item['icon'] as IconData,
                            color: item['color'] as Color),
                      ),
                      const SizedBox(height: 6),
                      Text(item['label'] as String,
                          style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
