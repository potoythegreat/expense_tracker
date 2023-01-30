import 'package:expense_tracker/src/cubit/transactions_cubit.dart';
import 'package:expense_tracker/src/models/transactions_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem(
      {super.key, required this.transaction, required this.index});
  final int index;
  final TransactionModel transaction;
  @override
  Widget build(BuildContext context) {
    String amount;
    if (transaction.amount > 0) {
      amount = transaction.amount.toStringAsFixed(2);
    } else {
      amount = (transaction.amount * -1).toStringAsFixed(2);
    }
    return Container(
      color: Colors.grey[850],
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [ 
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                onPressed: () {
                  context.read<BalanceCubit>().removeTransaction(index);
                },
              ),
              Text(
                transaction.title,
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                transaction.amount > 0 ? "₱ $amount" : "- ₱ $amount",
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  width: 10,
                  height: 40,
                  color: transaction.amount > 0 ? Colors.green : Colors.red,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
