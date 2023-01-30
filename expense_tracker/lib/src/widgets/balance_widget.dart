import 'package:flutter/material.dart';
import '../cubit/transactions_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/transactions_model.dart';

class BalanceTracker extends StatelessWidget {
  const BalanceTracker({super.key});

  @override
  Widget build(BuildContext context) {
    String finalTotal;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'YOUR BALANCE',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        BlocBuilder<BalanceCubit, List<TransactionModel>>(
          builder: (context, balance) {
            double total = 0;
            for (var i = 0; i < balance.length; i++) {
              total += balance[i].amount;
            }
            total >= 0
                ? finalTotal = total.toStringAsFixed(2)
                : finalTotal = (total * -1).toStringAsFixed(2);
            return Text(
              total >= 0 ? '₱ $finalTotal' : '- ₱ $finalTotal',
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            );
          },
        ),
      ],
    );
  }
}
