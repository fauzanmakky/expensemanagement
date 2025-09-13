import 'package:expensemanagement/commons/constants/color_constants.dart';
import 'package:expensemanagement/commons/util/color_from_hex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExpenseItemCard extends StatelessWidget {
  final String icon;
  final Color iconColor;
  final String title;
  final String amount;

  const ExpenseItemCard({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
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
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            width: 24.w,
            height: 24.h,
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
          SizedBox(width: 12.w),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 14.sp,
              color: colorFromHex(ColorConstants.grey1),
            ),
          ),
          const Spacer(),
          Text(
            amount,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 14.sp,
              color: colorFromHex(ColorConstants.grey1),
            ),
          ),
        ],
      ),
    );
  }
}
