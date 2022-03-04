import 'package:expense_tracker/models/transaction.dart';
import 'package:expense_tracker/widgets/newTransaction.dart';
import 'package:expense_tracker/widgets/transactionList.dart';
import 'package:flutter/material.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(id: "t1", title: "Shoes", amount: 2000, date: DateTime.now()),
    Transaction(id: "t1", title: "Shoes", amount: 4000, date: DateTime.now())
  ];

  void _addNewTransaction(String txTitle, int txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(addTx: _addNewTransaction),
        TransactionList(
          transactions: _userTransactions,
        )
      ],
    );
  }
}
