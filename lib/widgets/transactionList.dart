import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({Key? key, required this.transactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: transactions.map((tx) {
            return Card(
              child: Row(children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Colors.blue.shade400, width: 2)),
                  child: Text(
                    "₹ ${tx.amount}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color.fromARGB(255, 1, 98, 177)),
                  ),
                  padding: const EdgeInsets.all(8),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tx.title,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat.yMMMMd().format(tx.date),
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ]),
            );
          }).toList()),
    );
  }
}
