import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:banawit/core/models/expense_model.dart';

part 'expenses_state.dart';

class ExpenseCubit extends Cubit<ExpenseState> {
  ExpenseCubit() : super(ExpenseInitial());

  static const String _expensesKey = 'expenses';

  /// Saves [expense] to SharedPreferences as a JSON string
  /// appended to the existing list stored under the key "expenses".
  Future<void> saveExpense(Expense expense) async {
    emit(ExpenseSaving());
    try {
      final prefs = await SharedPreferences.getInstance();

      // Retrieve existing list (or start fresh)
      final List<String> stored = prefs.getStringList(_expensesKey) ?? [];

      // Append the new expense as a JSON-encoded string
      stored.add(jsonEncode(expense.toJson()));

      // Persist back to SharedPreferences
      await prefs.setStringList(_expensesKey, stored);

      emit(ExpenseSaved());
    } catch (e) {
      emit(ExpenseError('Failed to save expense: $e'));
    }
  }

  /// Reads and returns all saved expenses from SharedPreferences.
  /// Used by the Home screen to display "Recent Transactions".
  Future<List<Expense>> loadExpenses() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final List<String> stored = prefs.getStringList(_expensesKey) ?? [];
      return stored
          .map((e) => Expense.fromJson(jsonDecode(e) as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return [];
    }
  }
}