import 'package:expense_tracker/src/widgets/transaction_history_Item.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/transactions_cubit.dart';
import '../models/transactions_model.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BalanceCubit, List<TransactionModel>>(
      builder: (context, balance) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: balance.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TransactionItem(
                transaction: balance[index],
                index: index,
              ),
            );
          },
        );
      },
    );
  }
}
