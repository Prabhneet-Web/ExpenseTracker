import 'package:expense_tracker/database/transactionListDb.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../widgets/newTransaction.dart';

class HomePageProvider with ChangeNotifier {
  final List<Transaction> userTransactions = [];
  int id = 0;
  void addNewTransaction(String txTitle, int txAmount, DateTime chosenDate) {
    final newTx = Transaction(
        id: id++, title: txTitle, amount: txAmount, date: chosenDate);
    userTransactions.add(newTx);
    notifyListeners();
  }

  //Using video
  // updateTransactionList() {
  //   userList = DatabaseHelper.instance.getTransactionList();
  //   notifyListeners();
  // }

  List<Transaction> get recentTransactions {
    return userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList(); //Where allows us to run a function on every item in a list. And if that functin returns true, the item is kept in newly returned list else it's not included in that list.
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(addTx: addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void deleteTransaction(int id) {
    userTransactions.removeWhere((tx) => tx.id == id);
    notifyListeners();
  }
}
