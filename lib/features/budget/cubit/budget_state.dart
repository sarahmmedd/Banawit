class BudgetState {
  final double budget;
  final double spent;

  const BudgetState({
    required this.budget,
    required this.spent,
  });

  double get remaining => budget - spent;

  double get percentage =>
      budget == 0 ? 0 : (spent / budget);

  BudgetState copyWith({
    double? budget,
    double? spent,
  }) {
    return BudgetState(
      budget: budget ?? this.budget,
      spent: spent ?? this.spent,
    );
  }
}
