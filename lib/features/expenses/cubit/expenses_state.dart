part of 'expenses_cubit.dart';

abstract class ExpenseState {}

class ExpenseInitial extends ExpenseState {}

class ExpenseSaving extends ExpenseState {}

class ExpenseSaved extends ExpenseState {}

class ExpenseError extends ExpenseState {
  final String message;
  ExpenseError(this.message);
}