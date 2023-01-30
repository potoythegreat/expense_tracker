import 'package:expense_tracker/src/app.dart';
import 'package:expense_tracker/src/models/transactions_model.dart';
import 'package:flutter/material.dart';
import '../cubit/transactions_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

class NewTransactionWidget extends StatelessWidget {
  const NewTransactionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final amountController = TextEditingController();
    ToastContext().init(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleField(titleController),
        amountField(amountController),
        heightSpacer(10),
        submitButton(context, titleController, amountController),
      ],
    );
  }

  Widget titleField(controller) {
    return TextField(
      controller: controller,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: const InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        labelText: 'Transaction',
        hintText: 'ex. Food Expense',
        hintStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget amountField(controller) {
    return TextField(
      style: const TextStyle(
        color: Colors.white,
      ),
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        labelText: "Amount (negative - expense, positive - income)",
        hintText: 'ex. 500',
        hintStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget submitButton(
      BuildContext context,
      TextEditingController titleController,
      TextEditingController amountController) {
    return ElevatedButton(
      onPressed: () {
        if (titleController.text == "" || amountController.text == "") {
          Toast.show(
            backgroundColor: Colors.grey,
            "Error: Inputs should not be empty",
            duration: Toast.lengthLong,
            gravity: Toast.bottom,
          );
        } else {
          final model = TransactionModel(
              amount: double.parse(amountController.text),
              title: titleController.text);
          context.read<BalanceCubit>().addTransaction(model);
          titleController.clear();
          amountController.clear();
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Colors.white,
        ),
        minimumSize: MaterialStateProperty.all(
          const Size.fromHeight(50),
        ),
      ),
      child: const Text(
        'Add Transaction',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
