import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:banawit/core/theme/app_colors.dart';
>>>>>>> budget_states

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Scaffold();
=======
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Column(
        children: [
          /// HEADER
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              top: 50.h,
              left: 20.w,
              right: 20.w,
              bottom: 30.h,
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFF5C8A), Color(0xFFFF2A5F)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.2),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
                Text(
                  "Add Expense",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          /// FORM
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// TITLE
                  Text(
                    "Title",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "e.g., Grocery shopping",
                      hintStyle: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 14.sp,
                      ),
                      filled: true,
                      fillColor: AppColors.cardBackground,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 14.h,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(color: AppColors.border),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(color: AppColors.primary),
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  /// AMOUNT
                  Text(
                    "Amount",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "0.00",
                      hintStyle: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 14.sp,
                      ),
                      filled: true,
                      fillColor: AppColors.cardBackground,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 14.h,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(color: AppColors.primary),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(color: AppColors.primary),
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  /// CATEGORY
                  Text(
                    "Category",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.cardBackground,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 14.h,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(color: AppColors.border),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(color: AppColors.border),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(color: AppColors.primary),
                      ),
                    ),
                    hint: const Text("Select a category"),
                    items: const [
                      DropdownMenuItem(value: "food", child: Text("🍔 Food")),
                      DropdownMenuItem(
                        value: "transport",
                        child: Text("🚗 Transport"),
                      ),
                      DropdownMenuItem(
                        value: "shopping",
                        child: Text("🛍 Shopping"),
                      ),
                      DropdownMenuItem(
                        value: "entertainment",
                        child: Text("🎬 Entertainment"),
                      ),
                      DropdownMenuItem(
                        value: "health",
                        child: Text("🏥 Health"),
                      ),
                      DropdownMenuItem(value: "bills", child: Text("💡 Bills")),
                    ],
                    onChanged: (value) {},
                  ),

                  SizedBox(height: 20.h),

                  /// DATE
                  Text(
                    "Date",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "02/24/2026",
                      hintStyle: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 14.sp,
                      ),
                      filled: true,
                      fillColor: AppColors.cardBackground,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 14.h,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(color: AppColors.border),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(color: AppColors.primary),
                      ),
                    ),
                  ),

                  SizedBox(height: 40.h),

                  /// SAVE BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 55.h,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        elevation: 6,
                      ),
                      child: Text(
                        "✓  Save Expense",
                        style: TextStyle(
                          color: AppColors.scaffoldBackground,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
>>>>>>> budget_states
  }
}
