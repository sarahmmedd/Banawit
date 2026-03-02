import 'package:banawit/features/categories/cubit/categories_cubit.dart';
import 'package:banawit/features/categories/cubit/categories_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:banawit/core/theme/app_colors.dart';
import 'widgets/category_card.dart';
import 'popup.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Column(
          children: [
            /// HEADER
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primary, const Color(0xFFFF7FA8)],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30.r),
                ),
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 40.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColors.cardBackground,
                      ),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Categories",
                        style: TextStyle(
                          color: AppColors.cardBackground,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Manage your expense categories",
                        style: TextStyle(
                          color: AppColors.cardBackground,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 25.h),

            /// GRID
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: BlocBuilder<CategoriesCubit, CategoriesState>(
                  builder: (context, state) {
                    if (state is CategoriesLoaded) {
                      return GridView.builder(
                        itemCount: state.categories.length,
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20.h,
                          crossAxisSpacing: 20.w,
                          childAspectRatio: 0.9,
                        ),
                        itemBuilder: (context, index) {
                          final category = state.categories[index];

                          return CategoryCard(
                            title: category["title"]!,
                            emoji: category["emoji"]!,
                            onDelete: () async {
                              final deletedItem = category;

                              final confirm = await showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text("Delete Category"),
                                  content: const Text(
                                      "Are you sure you want to delete this category?"),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, false),
                                      child: const Text("Cancel"),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, true),
                                      child: const Text("Delete"),
                                    ),
                                  ],
                                ),
                              );

                              if (confirm == true) {
                                context
                                    .read<CategoriesCubit>()
                                    .deleteCategory(index);

                                // SnackBar مع Undo
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        "${deletedItem['title']} deleted"),
                                    action: SnackBarAction(
                                      label: "Undo",
                                      onPressed: () {
                                        context
                                            .read<CategoriesCubit>()
                                            .addCategory(deletedItem);
                                      },
                                    ),
                                  ),
                                );
                              }
                            },
                          );
                        },
                      );
                    }

                    return const Center(
                        child: CircularProgressIndicator());
                  },
                ),
              ),
            ),

            /// ADD BUTTON
            Padding(
              padding: EdgeInsets.all(20.w),
              child: SizedBox(
                width: 200.w,
                height: 60.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  onPressed: () async {
                    final result = await showDialog(
                      context: context,
                      builder: (context) => const Popup(),
                    );

                    if (result != null) {
                      context.read<CategoriesCubit>().addCategory(result);
                    }
                  },
                  child: const Text(
                    "Add Category",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}