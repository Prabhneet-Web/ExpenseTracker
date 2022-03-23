import 'package:expense_tracker/widgets/transactionList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/homePageProvider.dart';
import '../widgets/chart.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showChart = false;

  final appBar = AppBar(
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
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Consumer<HomePageProvider>(
              builder: (context, value, child) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Show Chart"),
                        Switch(
                            value: _showChart,
                            onChanged: (val) {
                              setState(() {
                                _showChart = val;
                              });
                            })
                      ],
                    ),
                    _showChart
                        ? Container(
                            height: (MediaQuery.of(context).size.height -
                                    appBar.preferredSize.height -
                                    MediaQuery.of(context).padding.top) *
                                0.23,
                            child: Chart(
                              recentTransactions: value.recentTransactions,
                            ),
                          )
                        : Container(
                            height: (MediaQuery.of(context).size.height -
                                    appBar.preferredSize.height -
                                    MediaQuery.of(context).padding.top) *
                                0.7,
                            child: TransactionList(
                                transactions: value.userTransactions,
                                deleteTransaction: value.deleteTransaction),
                          ),
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
