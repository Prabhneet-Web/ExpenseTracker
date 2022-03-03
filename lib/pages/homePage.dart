import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<Transaction> transactions = [
    Transaction(id: "t1", title: "Shoes", amount: 2000, date: DateTime.now()),
    Transaction(id: "t1", title: "Shoes", amount: 4000, date: DateTime.now())
  ];

  TextEditingController titleController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      decoration: const InputDecoration(labelText: "Title"),
                      controller: titleController,
                    ),
                    TextField(
                      decoration: const InputDecoration(labelText: "Amount"),
                      controller: amountController,
                    ),
                    MaterialButton(
                      onPressed: () {},
                      color: Colors.blue.shade400,
                      child: const Text("Add Transaction"),
                    )
                  ],
                ),
              ),
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: transactions.map((tx) {
                  return Card(
                    child: Row(children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.blue.shade400, width: 2)),
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
          ],
        ),
      ),
    );
  }
}
