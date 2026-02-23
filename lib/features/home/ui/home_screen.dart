import 'package:banawit/features/budget/ui/budget_screen.dart';
import 'package:banawit/features/categories/ui/categories_screen.dart';
import 'package:banawit/features/expenses/ui/expenses_screen.dart';
import 'package:banawit/features/home/ui/widgets/custom_budget_card.dart';
import 'package:banawit/features/home/ui/widgets/custom_card.dart';
import 'package:banawit/features/home/ui/widgets/main_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                MainContainer(),
                Positioned(
                  bottom: -80.h,
                  right: 20.w,
                  left: 20.w,
                  child: CustomBudgetCard(),
                ),
              ],
            ),
            SizedBox(height: 90.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BudgetScreen()),
                    );
                  },
                  child: CustomCard(icon: Icons.trending_up, title: "Budget"),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoriesScreen(),
                      ),
                    );
                  },
                  child: CustomCard(icon: Icons.grid_view, title: "Categories"),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ExpensesScreen()),
          );
        },
        child: Icon(Icons.add, color: Colors.white, size: 30),
        backgroundColor: Color(0xFFDA144F),
      ),
    );
  }
}
