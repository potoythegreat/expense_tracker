import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/transactions_cubit.dart';
import '../models/transactions_model.dart';

class IncomeTracker extends StatelessWidget {
  const IncomeTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'INCOME',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        BlocBuilder<BalanceCubit, List<TransactionModel>>(
          builder: (context, balance) {
            double income = 0;
            for (var i = 0; i < balance.length; i++) {
              if (balance[i].amount > 0) {
                income += balance[i].amount;
              }
            }
            final finalIncome = income.toStringAsFixed(2);
            return Text(
              '₱ $finalIncome',
              style: TextStyle(
                color: Colors.green[500],
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
