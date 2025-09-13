import 'package:expensemanagement/commons/constants/color_constants.dart';
import 'package:expensemanagement/commons/util/color_from_hex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final String color;
  final VoidCallback onPressed;

  const PrimaryButton({
    super.key,
    this.color = ColorConstants.blue,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorFromHex(color),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontSize: 18.sp,
            color: colorFromHex(ColorConstants.white),
          ),
        ),
      ),
    );
  }
}
