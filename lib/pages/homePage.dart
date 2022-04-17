import 'dart:io';

import 'package:expense_tracker/widgets/transactionList.dart';
import 'package:flutter/cupertino.dart';
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
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    final pageBody = SafeArea(
      child: SingleChildScrollView(
        child: Consumer<HomePageProvider>(
          builder: (context, value, child) {
            return Column(
              children: [
                if (isLandscape)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Show Chart"),
                      Switch.adaptive(
                          activeColor: Theme.of(context).colorScheme.secondary,
                          value: _showChart,
                          onChanged: (val) {
                            setState(() {
                              _showChart = val;
                            });
                          })
                    ],
                  ),
                if (!isLandscape)
                  Container(
                    height: (mediaQuery.size.height -
                            appBar.preferredSize.height -
                            mediaQuery.padding.top) *
                        0.23,
                    child: Chart(
                      recentTransactions: value.recentTransactions,
                    ),
                  ),
                if (!isLandscape)
                  Container(
                    height: (mediaQuery.size.height -
                            appBar.preferredSize.height -
                            mediaQuery.padding.top) *
                        0.7,
                    child: TransactionList(
                        transactions: value.userTransactions,
                        deleteTransaction: value.deleteTransaction),
                  ),
                if (isLandscape)
                  _showChart
                      ? Container(
                          height: (mediaQuery.size.height -
                                  appBar.preferredSize.height -
                                  mediaQuery.padding.top) *
                              0.6,
                          child: Chart(
                            recentTransactions: value.recentTransactions,
                          ),
                        )
                      : Container(
                          height: (mediaQuery.size.height -
                                  appBar.preferredSize.height -
                                  mediaQuery.padding.top) *
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
    );

    return Scaffold(
        appBar: appBar,
        body: pageBody,
        floatingActionButton: Platform.isIOS
            ? Container()
            : Consumer<HomePageProvider>(
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
