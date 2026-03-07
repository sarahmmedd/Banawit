import 'package:flutter_bloc/flutter_bloc.dart';
import 'budget_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BudgetBloc extends Cubit<BudgetState> {
  BudgetBloc() : super(const BudgetState(budget: 0, spent: 0)) {
    loadBudget();
  }

  Future<void> loadBudget() async {
    final prefs = await SharedPreferences.getInstance();

    final savedBudget = prefs.getDouble('budget') ?? 0;

    emit(state.copyWith(budget: savedBudget));
  }

  void setBudget(double amount) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setDouble('budget', amount);

    emit(BudgetState(budget: amount, spent: 0));
  }

  void addExpense(double amount) {
    final newSpent = state.spent + amount;

    emit(state.copyWith(
      spent: newSpent
    ));
  }
}
