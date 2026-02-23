import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CustomBudgetCard extends StatelessWidget {
  const CustomBudgetCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      height: 120.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.18),
            blurRadius: 35,
            spreadRadius: 3,
            offset: Offset(0, 20),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Remaining Budget",
                  style: TextStyle(color: Colors.black, fontSize: 18.sp),
                ),
                SizedBox(height: 6.h),
                Text(
                  "\$300.00",
                  style: TextStyle(
                    color: Color(0xFFDA144F),
                    fontSize: 35.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            CircularPercentIndicator(
              radius: 30.r,
              lineWidth: 6.w,
              percent: 0.85,
              center: Text(
                "85%",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              progressColor: Colors.black,
              backgroundColor: Colors.grey.shade300,
              circularStrokeCap: CircularStrokeCap.round,
              animation: true,
              animationDuration: 800,
            ),
          ],
        ),
      ),
    );
  }
}
