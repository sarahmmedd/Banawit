import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final IconData icon;
  const CustomCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 146.w,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: Color(0xFFDA144F),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(icon, color: Colors.white),
            ),
            SizedBox(height: 10.h),
            Center(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
