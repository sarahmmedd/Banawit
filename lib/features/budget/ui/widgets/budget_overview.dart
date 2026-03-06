import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/budget_bloc.dart';
import '../../cubit/budget_state.dart';

class BudgetOverview extends StatelessWidget {
  const BudgetOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BudgetBloc, BudgetState>(
      builder: (context, state) {
        if (state.budget == 0) return const SizedBox();

        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Budget: \$${state.budget.toStringAsFixed(2)}"),
              Text("Spent: \$${state.spent.toStringAsFixed(2)}"),
              Text("Remaining: \$${state.remaining.toStringAsFixed(2)}"),
              const SizedBox(height: 10),
              LinearProgressIndicator(
                value: state.percentage,
                minHeight: 8,
              ),
            ],
          ),
        );
      },
    );
  }
}