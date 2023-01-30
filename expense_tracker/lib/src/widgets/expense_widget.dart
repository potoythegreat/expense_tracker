import 'package:expense_tracker/src/cubit/transactions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/transactions_model.dart';

class ExpenseTracker extends StatelessWidget {
  const ExpenseTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'EXPENSE',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        BlocBuilder<BalanceCubit, List<TransactionModel>>(
          builder: (context, balance) {
            num expense = 0;
            for (var i = 0; i < balance.length; i++) {
              if (balance[i].amount < 0) {
                expense += balance[i].amount * -1;
              }
            }
            final String finalExpense = expense.toStringAsFixed(2);
            return Text(
              '₱ $finalExpense',
              style: TextStyle(
                color: Colors.red[500],
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      ],
    );
  }
}
