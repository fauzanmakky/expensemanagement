import 'package:expensemanagement/commons/constants/color_constants.dart';
import 'package:expensemanagement/commons/util/color_from_hex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SummaryCard extends StatelessWidget {
  final String title;
  final String amount;
  final Color color;

  const SummaryCard({
    Key? key,
    required this.title,
    required this.amount,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 158.w,
        maxWidth: 158.w,
        minHeight: 97.h,
        maxHeight: 97.h,
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(14.w, 14.h, 14.w, 10.h),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 14.sp,
                color: colorFromHex(ColorConstants.white),
              ),
            ),
            Text(
              amount,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 18.sp,
                color: colorFromHex(ColorConstants.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
