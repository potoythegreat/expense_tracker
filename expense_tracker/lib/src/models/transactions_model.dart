import 'package:equatable/equatable.dart';

class TransactionModel extends Equatable {
  final double amount;
  final String title;

  const TransactionModel({required this.amount, required this.title});

  @override
  List<Object?> get props => [amount, title];
}
