import 'package:expense_tracker/pages/transaction.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<Transaction> transactions = [
    Transaction(id: "t1", title: "Shoes", amount: 2000, date: DateTime.now()),
    Transaction(id: "t1", title: "Shoes", amount: 2000, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: transactions.map((tx) {
                return Card(
                  child: Text(tx.title),
                );
              }).toList()),
        ),
      ),
    );
  }
}
