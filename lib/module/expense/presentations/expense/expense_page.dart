import 'package:expensemanagement/module/expense/presentations/widgets/category_bottom_sheet.dart';
import 'package:expensemanagement/module/expense/presentations/widgets/from_field_tile.dart';
import 'package:expensemanagement/module/expense/presentations/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class ExpensePage extends StatefulWidget {
  const ExpensePage({super.key});

  @override
  State<ExpensePage> createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  DateTime? _selectedDate;
  String? _selectedCategory = 'Makanan';

  void _pickDate() async {
    final now = DateTime.now();
    final result = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (result != null) {
      setState(() {
        _selectedDate = result;
      });
    }
  }

  void _saveExpense() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Pengeluaran disimpan!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Tambah Pengeluaran Baru',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: 'Ayam Geprek',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),

              FormFieldTile(
                icon: Icons.fastfood,
                label: _selectedCategory ?? 'Pilih Kategori',
                trailing: Icons.chevron_right,
                onTap: () async {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    builder: (_) {
                      return CategoryBottomSheet(
                        onSelectCategory: (selected) {
                          setState(() => _selectedCategory = selected);
                        },
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 12),

              FormFieldTile(
                icon: Icons.calendar_today,
                label: _selectedDate != null
                    ? '${_selectedDate!.day}, ${_selectedDate!.month} ${_selectedDate!.year}'
                    : 'Pilih Tanggal',
                trailing: Icons.date_range,
                onTap: _pickDate,
              ),
              const SizedBox(height: 12),

              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Rp. 15.000',
                  border: OutlineInputBorder(),
                ),
              ),
              const Spacer(),

              PrimaryButton(label: 'Simpan', onPressed: _saveExpense),
            ],
          ),
        ),
      ),
    );
  }
}
