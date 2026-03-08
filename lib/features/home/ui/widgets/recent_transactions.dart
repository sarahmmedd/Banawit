import 'package:banawit/core/models/expense_model.dart';
import 'package:banawit/features/expenses/cubit/expenses_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:banawit/core/theme/app_colors.dart';

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key});

  IconData _getIcon(String category) {
    switch (category) {
      case "food": return Icons.fastfood;
      case "transport": return Icons.directions_car;
      case "shopping": return Icons.shopping_bag;
      case "entertainment": return Icons.movie;
      case "health": return Icons.local_hospital;
      case "bills": return Icons.lightbulb;
      default: return Icons.attach_money;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpenseCubit, ExpenseState>(
      builder: (context, state) {
        List<Expense> expenses = [];
        if (state is ExpenseLoaded) expenses = state.expenses;

        if (expenses.isEmpty) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0,4))],
            ),
            child: Column(
              children: [
                Text("Recent Transactions", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700)),
                SizedBox(height: 20.h),
                Icon(Icons.account_balance_wallet_outlined, size: 60.sp, color: Colors.grey),
                SizedBox(height: 10.h),
                Text("No expenses yet", style: TextStyle(fontSize: 14.sp, color: Colors.grey)),
                SizedBox(height: 5.h),
                Text("Tap the + button to add your first expense", style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
              ],
            ),
          );
        }

        final recentExpenses = expenses.reversed.take(5).toList();

        return Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0,4))],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Recent Transactions", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700)),
              SizedBox(height: 15.h),
              ...recentExpenses.map((expense) => ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColors.primary.withOpacity(.1),
                  child: Icon(_getIcon(expense.category), color: AppColors.primary),
                ),
                title: Text(expense.title, style: TextStyle(fontSize: 14.sp)),
                subtitle: Text("${expense.date.month}/${expense.date.day}/${expense.date.year}", style: TextStyle(fontSize: 12.sp)),
                trailing: Text("\$${expense.amount.toStringAsFixed(2)}", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colors.red)),
              )).toList(),
            ],
          ),
        );
      },
    );
  }
}