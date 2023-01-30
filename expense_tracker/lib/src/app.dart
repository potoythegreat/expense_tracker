import 'package:expense_tracker/src/cubit/transactions_cubit.dart';
import 'package:expense_tracker/src/widgets/add_transaction_widget.dart';
import 'package:expense_tracker/src/widgets/expense_widget.dart';
import 'package:expense_tracker/src/widgets/transaction_history.dart';
import 'package:expense_tracker/src/widgets/income_widget.dart';
import 'package:expense_tracker/src/widgets/balance_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      home: BlocProvider(
        create: (context) => BalanceCubit(),
        child: const MyHomePage(),
      ),
    );
  }
}

Widget heightSpacer(double height) {
  return SizedBox(
    height: height,
  );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appTitle(),
                heightSpacer(40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      amountSection(),
                      heightSpacer(50),
                      historySection(),
                      heightSpacer(50),
                      newTransactionSection(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget appTitle() {
    return const Text(
      'Expense Tracker',
      style: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget amountSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BalanceTracker(),
        heightSpacer(20),
        Container(
          color: Colors.grey[900],
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  IncomeTracker(),
                  VerticalDivider(
                    color: Colors.white,
                    thickness: 2,
                  ),
                  ExpenseTracker(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget historySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'History',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(
          color: Colors.white,
          thickness: 3,
        ),
        TransactionHistory(),
      ],
    );
  }

  Widget newTransactionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Add New Transaction',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(
          thickness: 3,
          color: Colors.white,
        ),
        NewTransactionWidget(),
      ],
    );
  }
}
