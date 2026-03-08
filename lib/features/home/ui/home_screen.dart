import 'package:banawit/core/theme/app_colors.dart';
import 'package:banawit/features/home/ui/widgets/recent_transactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../core/theme/app_colors.dart';
import '../../expenses/cubit/expenses_cubit.dart';
// import '../../expenses/ui/recent_transactions.dart';
import '../../expenses/ui/expenses_screen.dart';
import '../../categories/cubit/categories_cubit.dart';
import '../../categories/ui/categories_screen.dart';
import '../../budget/cubit/budget_cubit.dart';
import '../../budget/ui/budget_screen.dart';
import 'widgets/main_container.dart';
import 'widgets/custom_card.dart';
import 'widgets/custom_budget_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                    child: const CustomBudgetCard(),
                  ),
                ],
              ),
              SizedBox(height: 100.h),

              /// CARDS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (_) => BlocProvider(
                          create: (_) => BudgetBloc(),
                          child: const BudgetScreen(),
                        ),
                      ));
                    },
                    child: const CustomCard(icon: Icons.trending_up, title: "Budget"),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (_) => BlocProvider(
                          create: (_) => CategoriesCubit(),
                          child: const CategoriesScreen(),
                        ),
                      ));
                    },
                    child: const CustomCard(icon: Icons.grid_view, title: "Categories"),
                  ),
                ],
              ),

              SizedBox(height: 40.h),

              /// RECENT TRANSACTIONS
              const RecentTransactions(),

              SizedBox(height: 120.h),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white, size: 30),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: context.read<ExpenseCubit>(),
              child: const ExpensesScreen(),
            ),
          ));
        },
      ),
    );
  }
}