import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final double amount;
  final Color color;

  const CategoryCard({
    super.key,
    required this.icon,
    required this.label,
    required this.amount,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,
      height: 120.h,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 6.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 10.r,
            backgroundColor: color.withOpacity(0.2),
            child: Icon(icon, color: color, size: 18.sp),
          ),
          SizedBox(height: 6.h),
          Flexible(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12.sp),
              overflow: TextOverflow.visible,
              maxLines: 1,
            ),
          ),
          SizedBox(height: 4.h),
          Flexible(
            child: Text(
              'Rp. ${amount.toStringAsFixed(0)}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
