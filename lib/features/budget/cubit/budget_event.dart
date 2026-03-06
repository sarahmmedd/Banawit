abstract class BudgetEvent {}

class SetBudget extends BudgetEvent {
  final double amount;
  SetBudget(this.amount);
}

class AddExpense extends BudgetEvent {
  final double amount;
  AddExpense(this.amount);
}