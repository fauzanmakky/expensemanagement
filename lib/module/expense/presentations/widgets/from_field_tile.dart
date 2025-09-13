import 'package:expensemanagement/commons/constants/color_constants.dart';
import 'package:expensemanagement/commons/util/color_from_hex.dart';
import 'package:expensemanagement/commons/util/herlper.dart';
import 'package:expensemanagement/module/expense/presentations/widgets/picker_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormFieldTile extends StatelessWidget {
  final String? icon;
  final String label;
  final Color? colors;
  final Color? backgroundColor;
  final IconData trailing;
  final VoidCallback onTap;

  const FormFieldTile({
    super.key,
    this.icon,
    required this.label,
    required this.trailing,
    required this.onTap,
    this.colors,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            (!Helpers.isEmpty(icon))
                ? PickerIcon(
                    assetPath: icon!,
                    color: colors,
                    width: 24.w,
                    height: 24.h,
                  )
                : Container(),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 14.sp,
                  color: colorFromHex(ColorConstants.grey1),
                ),
              ),
            ),
            Container(
              width: 24.w,
              height: 24.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: backgroundColor,
              ),
              child: Icon(trailing, color: Colors.grey, size: 22.sp),
            ),
          ],
        ),
      ),
    );
  }
}
