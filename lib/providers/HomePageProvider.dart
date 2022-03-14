import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../widgets/newTransaction.dart';

class HomePageProvider with ChangeNotifier {
  final List<Transaction> userTransactions = [];

  void addNewTransaction(String txTitle, int txAmount, DateTime chosenDate) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: chosenDate);
    userTransactions.add(newTx);
    notifyListeners();
  }

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

  void deleteTransaction(String id) {
    userTransactions.removeWhere((tx) => tx.id == id);
    notifyListeners();
  }

  
}
