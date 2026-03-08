part of 'expenses_cubit.dart';

abstract class ExpenseState {}

class ExpenseInitial extends ExpenseState {}

class ExpenseSaving extends ExpenseState {}

class ExpenseLoaded extends ExpenseState {
  final List<Expense> expenses;
  ExpenseLoaded(this.expenses);
}