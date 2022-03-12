import 'package:expense_tracker/widgets/transactionList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/HomePageProvider.dart';
import '../widgets/chart.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Expenses Tracker",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          actions: [
            Consumer<HomePageProvider>(
              builder: (context, value, child) {
                return IconButton(
                    onPressed: () {
                      value.startAddNewTransaction(context);
                    },
                    icon: const Icon(Icons.add));
              },
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Consumer<HomePageProvider>(
              builder: (context, value, child) {
                return Column(
                  children: [
                    Chart(
                      recentTransactions: value.recentTransactions,
                    ),
                    TransactionList(
                        transactions: value.userTransactions,
                        deleteTransaction: value.deleteTransaction),
                  ],
                );
              },
            ),
          ),
        ),
        floatingActionButton: Consumer<HomePageProvider>(
          builder: (context, value, child) {
            return FloatingActionButton(
                onPressed: () {
                  value.startAddNewTransaction(context);
                },
                child: const Icon(Icons.add));
          },
        ));
  }
}
