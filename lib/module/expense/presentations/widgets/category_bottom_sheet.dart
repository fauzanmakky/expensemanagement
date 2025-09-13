import 'package:expensemanagement/commons/constants/color_constants.dart';
import 'package:expensemanagement/commons/util/color_from_hex.dart';
import 'package:expensemanagement/module/expense/domain/entity/category_entity.dart';

import 'package:expensemanagement/module/expense/presentations/expense/bloc/expense_bloc.dart';
import 'package:expensemanagement/module/expense/presentations/expense/bloc/expense_event.dart';
import 'package:expensemanagement/module/expense/presentations/expense/bloc/expense_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryBottomSheet extends StatelessWidget {
  final void Function(CategoryEntity) onSelectCategory;

  const CategoryBottomSheet({super.key, required this.onSelectCategory});

  @override
  Widget build(BuildContext context) {
    context.read<ExpenseBloc>().add(GetAllCategoriesEvent());

    return SafeArea(
      top: false,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pilih Kategori',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 14.sp,
                    color: colorFromHex(ColorConstants.grey2),
                  ),
                ),
                IconButton(
                  icon:  Icon(Icons.close,color:Colors.black, ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            SizedBox(height: 345.h,
              child: BlocBuilder<ExpenseBloc, ExpenseState>(
                builder: (context, state) {
                  final categories = state.categories;

                  if (categories.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: categories.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 23.h,
                      crossAxisSpacing: 16.w,
                      childAspectRatio: 1.2,
                    ),
                    itemBuilder: (context, index) {
                      final item = categories[index];
                      return InkWell(
                        borderRadius: BorderRadius.circular(16.r),
                        onTap: () {
                          onSelectCategory(item);
                          Navigator.pop(context);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(6.w),
                              decoration: BoxDecoration(
                                color: colorFromHex(item.color),
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(item.icon, width: 24.w, height: 24.h),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              item.label,
                              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                fontSize: 12.sp,
                                color: colorFromHex(ColorConstants.grey3),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
