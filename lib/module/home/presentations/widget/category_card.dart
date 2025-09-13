import 'package:expensemanagement/commons/constants/color_constants.dart';
import 'package:expensemanagement/commons/util/color_from_hex.dart';
import 'package:expensemanagement/commons/util/number_format.dart';
import 'package:expensemanagement/style/typography/expense_management_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryCard extends StatelessWidget {
  final String icon;
  final String title;
  final String amount;
  final Color iconColor;

  const CategoryCard({
    super.key,
    required this.icon,
    required this.title,
    required this.amount,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      child: LayoutBuilder(
        builder: (context,constraints) {
          debugPrint('Tinggi aktual: ${constraints.maxHeight}');
          return Container(
            padding: EdgeInsets.fromLTRB(19.w, 16.h, 19.w, 18.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(6.w),
                  decoration: BoxDecoration(
                    color: iconColor,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(icon, width: 24.w, height: 24.h),
                ),
                SizedBox(height: 12.h),
                Text(
                  title,
                  style: Theme.of(context).textTheme.labelMedium
                      ?.copyWith(
                    fontSize: 12.sp,
                    color: colorFromHex(ColorConstants.grey3),
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(height: 8.h),
                Text(
                  FormatNumber.currency(amount),
                  style: Theme.of(context).textTheme.labelLarge
                      ?.copyWith(
                    fontSize: 14.sp,
                    color: colorFromHex(ColorConstants.grey1),
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
