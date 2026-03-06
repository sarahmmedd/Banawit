import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:banawit/core/theme/app_colors.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String emoji;
  final VoidCallback onDelete;

  const CategoryCard({
    super.key,
    required this.title,
    required this.emoji,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 160.w,
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.textPrimary.withOpacity(0.08),
                blurRadius: 20,
<<<<<<< HEAD
                offset:  Offset(0, 10),
=======
                offset: Offset(0, 10),
>>>>>>> budget_states
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Column(
              children: [
                Container(
                  width: 60.w,
                  height: 60.w,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Center(
<<<<<<< HEAD
                    child: Text(
                      emoji,
                      style: TextStyle(fontSize: 28.sp),
                    ),
=======
                    child: Text(emoji, style: TextStyle(fontSize: 28.sp)),
>>>>>>> budget_states
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: GestureDetector(
            onTap: onDelete,
<<<<<<< HEAD
            child: Icon(
              Icons.delete,
              color: Colors.red,
              size: 20,
            ),
=======
            child: Icon(Icons.delete, color: Colors.red, size: 20),
>>>>>>> budget_states
          ),
        ),
      ],
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> budget_states
