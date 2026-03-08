import 'package:banawit/banawit_app.dart';
import 'package:banawit/features/budget/cubit/budget_cubit.dart';
import 'package:banawit/features/categories/cubit/categories_cubit.dart';
import 'package:banawit/features/expenses/cubit/expenses_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// void main() {
//   runApp(BanawitApp());
// }

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CategoriesCubit()),
        BlocProvider(create: (_) => BudgetBloc()),
        BlocProvider(create: (_) => ExpenseCubit()),
      ],
      child: const BanawitApp(),
    ),
  );
}
