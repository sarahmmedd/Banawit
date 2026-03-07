import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:banawit/core/theme/app_colors.dart';

import '../../../core/models/expense_model.dart';
import '../cubit/expenses_cubit.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  // ── Controllers 
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  // ── Dropdown & date state 
  String? _selectedCategory;
  DateTime? _selectedDate;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  // ── Date picker 
  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  /// Formats DateTime → MM/DD/YYYY for display
  String _formatDate(DateTime date) {
    final m = date.month.toString().padLeft(2, '0');
    final d = date.day.toString().padLeft(2, '0');
    return '$m/$d/${date.year}';
  }

  // ── Save logic
  void _saveExpense() {
    final title = _titleController.text.trim();
    final amountText = _amountController.text.trim();

    if (title.isEmpty) {
      _showSnackBar('Please enter a title');
      return;
    }
    if (amountText.isEmpty || double.tryParse(amountText) == null) {
      _showSnackBar('Please enter a valid amount');
      return;
    }
    if (_selectedCategory == null) {
      _showSnackBar('Please select a category');
      return;
    }
    if (_selectedDate == null) {
      _showSnackBar('Please select a date');
      return;
    }

    final expense = Expense(
      title: title,
      amount: double.parse(amountText),
      category: _selectedCategory!,
      date: _selectedDate!,
    );

    context.read<ExpenseCubit>().saveExpense(expense);
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void _resetForm() {
    _titleController.clear();
    _amountController.clear();
    setState(() {
      _selectedCategory = null;
      _selectedDate = null;
    });
  }


  @override
  Widget build(BuildContext context) {
    return BlocListener<ExpenseCubit, ExpenseState>(
      listener: (context, state) {
        if (state is ExpenseSaved) {
          _showSnackBar('Expense saved!');
          _resetForm();
        } else if (state is ExpenseError) {
          _showSnackBar(state.message);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        body: Column(
          children: [
            /// HEADER 
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                top: 50.h,
                left: 20.w,
                right: 20.w,
                bottom: 30.h,
              ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFF5C8A), Color(0xFFFF2A5F)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.2),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Text(
                    "Add Expense",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            /// FORM 
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// TITLE
                    Text(
                      "Title",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    TextField(
                      controller: _titleController, // ← wired
                      decoration: InputDecoration(
                        hintText: "e.g., Grocery shopping",
                        hintStyle: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 14.sp,
                        ),
                        filled: true,
                        fillColor: AppColors.cardBackground,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 14.h,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(color: AppColors.border),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(color: AppColors.primary),
                        ),
                      ),
                    ),

                    SizedBox(height: 20.h),

                    /// AMOUNT
                    Text(
                      "Amount",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    TextField(
                      controller: _amountController, // ← wired
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "0.00",
                        hintStyle: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 14.sp,
                        ),
                        filled: true,
                        fillColor: AppColors.cardBackground,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 14.h,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(color: AppColors.primary),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(color: AppColors.primary),
                        ),
                      ),
                    ),

                    SizedBox(height: 20.h),

                    /// CATEGORY
                    Text(
                      "Category",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    DropdownButtonFormField<String>(
                      value: _selectedCategory, // ← wired
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.cardBackground,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 14.h,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(color: AppColors.border),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(color: AppColors.border),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(color: AppColors.primary),
                        ),
                      ),
                      hint: const Text("Select a category"),
                      items: const [
                        DropdownMenuItem(value: "food", child: Text("🍔 Food")),
                        DropdownMenuItem(
                          value: "transport",
                          child: Text("🚗 Transport"),
                        ),
                        DropdownMenuItem(
                          value: "shopping",
                          child: Text("🛍 Shopping"),
                        ),
                        DropdownMenuItem(
                          value: "entertainment",
                          child: Text("🎬 Entertainment"),
                        ),
                        DropdownMenuItem(
                          value: "health",
                          child: Text("🏥 Health"),
                        ),
                        DropdownMenuItem(
                          value: "bills",
                          child: Text("💡 Bills"),
                        ),
                      ],
                      onChanged:
                          (value) => // ← wired
                              setState(() => _selectedCategory = value),
                    ),

                    SizedBox(height: 20.h),

                    /// DATE
                    Text(
                      "Date",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    TextField(
                      readOnly: true, // ← prevents keyboard; opens picker only
                      onTap: _pickDate, // ← wired
                      controller: TextEditingController(
                        text: _selectedDate != null
                            ? _formatDate(_selectedDate!)
                            : '',
                      ),
                      decoration: InputDecoration(
                        hintText: "02/24/2026",
                        hintStyle: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 14.sp,
                        ),
                        filled: true,
                        fillColor: AppColors.cardBackground,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 14.h,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(color: AppColors.border),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(color: AppColors.primary),
                        ),
                      ),
                    ),

                    SizedBox(height: 40.h),

                    /// SAVE BUTTON
                    BlocBuilder<ExpenseCubit, ExpenseState>(
                      builder: (context, state) {
                        return SizedBox(
                          width: double.infinity,
                          height: 55.h,
                          child: ElevatedButton(
                            onPressed: state is ExpenseSaving
                                ? null
                                : _saveExpense, // ← wired
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              elevation: 6,
                            ),
                            child: state is ExpenseSaving
                                ? const SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2.5,
                                    ),
                                  )
                                : Text(
                                    "✓  Save Expense",
                                    style: TextStyle(
                                      color: AppColors.scaffoldBackground,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}