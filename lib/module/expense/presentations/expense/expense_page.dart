import 'package:expensemanagement/commons/constants/color_constants.dart';
import 'package:expensemanagement/commons/util/color_from_hex.dart';
import 'package:expensemanagement/commons/util/number_format.dart';
import 'package:expensemanagement/module/expense/domain/entity/expense_param.dart';
import 'package:expensemanagement/module/expense/presentations/expense/bloc/expense_bloc.dart';
import 'package:expensemanagement/module/expense/presentations/expense/bloc/expense_event.dart';
import 'package:expensemanagement/module/expense/presentations/expense/bloc/picker/picker_cubit.dart';
import 'package:expensemanagement/module/expense/presentations/expense/bloc/picker/picker_state.dart';
import 'package:expensemanagement/module/expense/presentations/widgets/category_bottom_sheet.dart';
import 'package:expensemanagement/module/expense/presentations/widgets/from_field_tile.dart';
import 'package:expensemanagement/module/expense/presentations/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class ExpensePage extends StatefulWidget {
  const ExpensePage({super.key});

  @override
  State<ExpensePage> createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final ValueNotifier<bool> buttonEnabledNotifier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _amountController.addListener(_validateFields);
    _nameController.addListener(_validateFields);
    initializeDateFormatting('id_ID', null);
  }

  void _validateFields() {
    final amountFilled = _amountController.text.trim().isNotEmpty;
    final titleFilled = _nameController.text.trim().isNotEmpty;
    buttonEnabledNotifier.value = amountFilled && titleFilled;
  }

  void _saveExpense() {
    context.read<ExpenseBloc>().add(
      AddExpenseEvent(
        ExpenseParam(
          category: context.read<PickerCubit>().selectedCategoryId,
          date: context.read<PickerCubit>().selectedDate,
          title: _nameController.text,
          price: double.parse(_amountController.text.replaceAll('.', '')),
        ),
      ),
    );
    context.read<PickerCubit>().reset();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Pengeluaran disimpan!')));

    Navigator.pop(context);
  }

  InputDecoration _inputDecoration({required String hintText}) {
    return InputDecoration(
      hintText: hintText,
      labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
        fontSize: 14.sp,
        color: colorFromHex(ColorConstants.grey3),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: Color(0xFF4DB6AC)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pickerCubit = context.read<PickerCubit>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Tambah Pengeluaran Baru',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontSize: 18.sp,
            color: colorFromHex(ColorConstants.grey1),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 38.h),
              SizedBox(
                height: 50.h,
                child: TextField(
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 14.sp,
                    color: colorFromHex(ColorConstants.grey1),
                  ),
                  controller: _nameController,
                  decoration: _inputDecoration(hintText: 'Ayam Geprek'),
                ),
              ),
              SizedBox(height: 20.h),

              BlocBuilder<PickerCubit, PickerState>(
                builder: (context, state) {
                  return SizedBox(
                    height: 50.h,
                    child: FormFieldTile(
                      icon: state.selectedCategory.icon,
                      label: state.selectedCategory.label,
                      trailing: Icons.chevron_right,
                      backgroundColor: Colors.grey.shade300,
                      colors: colorFromHex(state.selectedCategory.color),
                      onTap: () async {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          builder: (_) => CategoryBottomSheet(
                            onSelectCategory: (categoryEntity) {
                              pickerCubit.selectCategory(categoryEntity);
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h),

              BlocBuilder<PickerCubit, PickerState>(
                builder: (context, state) {
                  return SizedBox(
                    height: 50.h,
                    child: FormFieldTile(
                      label: DateFormat(
                        'EEEE, d MMMM yyyy',
                        'id_ID',
                      ).format(state.selectedDate),
                      trailing: Icons.calendar_month_outlined,
                      onTap: () async {
                        final result = await showDatePicker(
                          context: context,
                          initialDate: state.selectedDate,
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2030),
                        );
                        if (result != null) {
                          pickerCubit.pickDate(result);
                        }
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h),
              SizedBox(
                height: 50.h,
                child: TextField(
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 14.sp,
                    color: colorFromHex(ColorConstants.grey1),
                  ),
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    ThousandsInputFormatter(locale: 'id_ID'),
                  ],
                  decoration: _inputDecoration(hintText: 'Rp. 15.000'),
                ),
              ),
              SizedBox(height: 32.h),
              ValueListenableBuilder<bool>(
                builder: (context, enable, _) {
                  return PrimaryButton(
                    color: enable ? ColorConstants.blue : ColorConstants.grey5,
                    label: 'Simpan',
                    onPressed: () {
                      enable ? _saveExpense() : null;
                    },
                  );
                },
                valueListenable: buttonEnabledNotifier,
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _amountController.dispose();
    _nameController.dispose();
    buttonEnabledNotifier.dispose();
    super.dispose();
  }
}
