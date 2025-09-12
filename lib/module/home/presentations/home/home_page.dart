import 'package:expensemanagement/commons/constants/route_constants.dart';
import 'package:expensemanagement/module/home/presentations/widget/category_card.dart';
import 'package:expensemanagement/module/home/presentations/widget/expense_item_card.dart';
import 'package:expensemanagement/module/home/presentations/widget/summary_card.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'icon': Icons.fastfood, 'label': 'Makanan', 'amount': 70000.0, 'color': Colors.amber},
      {'icon': Icons.wifi, 'label': 'Internet', 'amount': 50000.0, 'color': Colors.blue},
      {'icon': Icons.directions_car, 'label': 'Transport', 'amount': 20000.0, 'color': Colors.purple},
    ];

    final todayExpenses = [
      {'label': 'Ayam Geprek', 'amount': 15000.0, 'icon': Icons.fastfood, 'color': Colors.amber},
      {'label': 'Gojek', 'amount': 15000.0, 'icon': Icons.directions_car, 'color': Colors.purple},
    ];

    final yesterdayExpenses = [
      {'label': 'Paket Data', 'amount': 50000.0, 'icon': Icons.wifi, 'color': Colors.blue},
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Halo, User!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                const Text('Jangan lupa catat keuanganmu setiap hari!',
                    style: TextStyle(color: Colors.grey)),

                const SizedBox(height: 16),
                Row(
                  children: const [
                    Expanded(
                      child: SummaryCard(
                        title: 'Pengeluaranmu hari ini',
                        amount: 'Rp. 30.000',
                        color: Colors.teal,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: SummaryCard(
                        title: 'Pengeluaranmu bulan ini',
                        amount: 'Rp. 335.500',
                        color: Colors.tealAccent,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                const Text('Pengeluaran berdasarkan kategori',
                    style: TextStyle(fontWeight: FontWeight.bold)),

                const SizedBox(height: 12),
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final c = categories[index];
                      return CategoryCard(
                        icon: c['icon'] as IconData,
                        label: c['label'] as String,
                        amount: c['amount'] as double,
                        color: c['color'] as Color,
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),
                const Text('Hari ini', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                ...todayExpenses.map((e) => ExpenseItemCard(
                  label: e['label'] as String,
                  amount: e['amount'] as double,
                  icon: e['icon'] as IconData,
                  color: e['color'] as Color,
                )),

                const SizedBox(height: 16),
                const Text('Kemarin', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                ...yesterdayExpenses.map((e) => ExpenseItemCard(
                  label: e['label'] as String,
                  amount: e['amount'] as double,
                  icon: e['icon'] as IconData,
                  color: e['color'] as Color,
                )),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            RouteConstants.expense,
          );
        },
        shape: const CircleBorder(),
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add),
      ),
    );
  }
}
