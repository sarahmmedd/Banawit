import 'package:banawit/features/budget/ui/budget_screen.dart';
import 'package:banawit/features/categories/cubit/categories_cubit.dart';
import 'package:banawit/features/categories/ui/categories_screen.dart';
import 'package:banawit/features/expenses/ui/expenses_screen.dart';
import 'package:banawit/features/home/ui/widgets/custom_budget_card.dart';
import 'package:banawit/features/home/ui/widgets/custom_card.dart';
import 'package:banawit/features/home/ui/widgets/main_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:banawit/core/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// TOP SECTION
              Stack(
                clipBehavior: Clip.none,
                children: [
                  MainContainer(),

                  Positioned(
                    bottom: -85.h,
                    right: 20.w,
                    left: 20.w,
                    child: CustomBudgetCard(),
                  ),
                ],
              ),

              SizedBox(height: 100.h),

              /// CARDS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  /// BUDGET
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BudgetScreen()),
                      );
                    },
                    child: CustomCard(icon: Icons.trending_up, title: "Budget"),
                  ),

                  /// CATEGORIES
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) => CategoriesCubit(),
                            child: const CategoriesScreen(),
                          ),
                        ),
                      );
                    },
                    child: CustomCard(
                      icon: Icons.grid_view,
                      title: "Categories",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      /// FLOATING BUTTON
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white, size: 30),

        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ExpensesScreen()),
          );
        },
      ),
    );
  }
}
