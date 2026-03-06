import 'package:banawit/features/budget/cubit/budget_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'budget_event.dart';
import 'budget_state.dart';

class BudgetBloc extends Bloc<BudgetEvent, BudgetState> {
  BudgetBloc() : super(const BudgetState(budget: 0, spent: 0)) {

    on<SetBudget>((event, emit) {
      emit(BudgetState(
        budget: event.amount,
        spent: 0,
      ));
    });

    on<AddExpense>((event, emit) {
      final newSpent = state.spent + event.amount;

      emit(state.copyWith(
        spent: newSpent,
      ));
    });

  }
}