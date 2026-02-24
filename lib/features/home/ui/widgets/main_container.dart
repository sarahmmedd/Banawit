import 'package:banawit/features/settings/ui/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:banawit/core/theme/app_colors.dart';

class MainContainer extends StatelessWidget {
  final String date = DateFormat.yMMMM().format(DateTime.now());

  MainContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 225.w,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, Color(0xFFFF7FA8)],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
        borderRadius: BorderRadiusDirectional.vertical(
          bottom: Radius.circular(30.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "SpendWise",
                      style: TextStyle(
                        color: AppColors.cardBackground,
                        fontWeight: FontWeight.w800,
                        fontSize: 32.sp,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      date,
                      style: TextStyle(
                        color: AppColors.cardBackground,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (value) => SettingsScreen()),
                    );
                  },
                  child: Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: AppColors.cardBackground.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(
                      Icons.settings,
                      color: AppColors.cardBackground,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Total Expenses",
                  style: TextStyle(
                    color: AppColors.cardBackground,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  "\$0.00",
                  style: TextStyle(
                    color: AppColors.cardBackground,
                    fontSize: 46.sp,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
