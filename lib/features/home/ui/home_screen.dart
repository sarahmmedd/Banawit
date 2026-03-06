<<<<<<< HEAD
// import 'package:banawit/features/budget/ui/budget_screen.dart';
// import 'package:banawit/features/categories/cubit/categories_cubit.dart';
// import 'package:banawit/features/categories/ui/categories_screen.dart';
// import 'package:banawit/features/expenses/ui/expenses_screen.dart';
// import 'package:banawit/features/home/ui/widgets/custom_budget_card.dart';
// import 'package:banawit/features/home/ui/widgets/custom_card.dart';
// import 'package:banawit/features/home/ui/widgets/main_container.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:banawit/core/theme/app_colors.dart';

// class HomeScreen extends StatelessWidget {
//   HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.scaffoldBackground,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Stack(
//                 clipBehavior: Clip.none,
//                 children: [
//                   MainContainer(),
//                   Positioned(
//                     bottom: -85.h,
//                     right: 20.w,
//                     left: 20.w,
//                     child: CustomBudgetCard(),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 100.h),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => BudgetScreen()),
//                       );
//                     },
//                     child: CustomCard(icon: Icons.trending_up, title: "Budget"),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (_) => BlocProvider(
//                             create: (_) => CategoriesCubit(),
//                             child: const CategoriesScreen(),
//                           ),
//                         ),
//                       );
//                     },
//                     child: CustomCard(
//                       icon: Icons.grid_view,
//                       title: "Categories",
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => ExpensesScreen()),
//           );
//         },
//         backgroundColor: AppColors.primary,
//         child: const Icon(Icons.add, color: Colors.white, size: 30),
//       ),
//     );
//   }
// }

//

=======
import 'package:banawit/features/budget/cubit/budget_bloc.dart';
>>>>>>> budget_states
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
<<<<<<< HEAD
=======
                  /// BUDGET
>>>>>>> budget_states
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
<<<<<<< HEAD
                        MaterialPageRoute(builder: (context) => BudgetScreen()),
=======
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (_) => BudgetBloc(),
                            child: const BudgetScreen(),
                          ),
                        ),
>>>>>>> budget_states
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
