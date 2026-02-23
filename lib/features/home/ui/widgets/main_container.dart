import 'package:banawit/features/settings/ui/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class MainContainer extends StatelessWidget {
  final String date = DateFormat.yMMMM().format(DateTime.now());
  MainContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 210.w,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFDA144F), Color(0xFFFF7FA8)],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
        borderRadius: BorderRadiusDirectional.vertical(
          bottom: Radius.circular(30.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.all(20),
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
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 30.sp,
                      ),
                    ),
                    Text(
                      date,
                      style: TextStyle(color: Colors.white, fontSize: 15.sp),
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
                      color: Color(0x40FFFFFF),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(Icons.settings, color: Colors.white),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Total Expenses",
                  style: TextStyle(color: Colors.white, fontSize: 15.sp),
                ),
                Text(
                  "\$0.00",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.sp,
                    fontWeight: FontWeight.w900,
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
