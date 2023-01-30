import 'package:expense_tracker/src/models/transactions_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BalanceCubit extends Cubit<List<TransactionModel>> {
  BalanceCubit() : super([]);

  void addTransaction(TransactionModel transaction) {
    emit([...state, transaction]);
  }

  void removeTransaction(int index) {
    List<TransactionModel> tempList = [...state];
    tempList.removeAt(index);
    emit(tempList);
  }
}
