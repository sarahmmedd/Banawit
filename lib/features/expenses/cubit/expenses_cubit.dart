import 'package:bloc/bloc.dart';
import 'package:banawit/core/models/expense_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

part 'expenses_state.dart';

class ExpenseCubit extends Cubit<ExpenseState> {
  ExpenseCubit() : super(ExpenseInitial());

  static const _storageKey = 'expenses';

  List<Expense> _expenses = [];

  Future<void> loadExpenses() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList(_storageKey) ?? [];
    _expenses = data.map((e) => Expense.fromJson(jsonDecode(e))).toList();
    emit(ExpenseLoaded(List.from(_expenses)));
  }

  Future<void> saveExpense(Expense expense) async {
    emit(ExpenseSaving());
    _expenses.add(expense);
    await _saveToPrefs();
    emit(ExpenseLoaded(List.from(_expenses)));
  }

  Future<void> deleteAllExpenses() async {
    _expenses.clear();
    await _saveToPrefs();
    emit(ExpenseLoaded(List.from(_expenses)));
  }

  Future<void> _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final data = _expenses.map((e) => jsonEncode(e.toJson())).toList();
    await prefs.setStringList(_storageKey, data);
  }
}