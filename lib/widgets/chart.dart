import 'package:flutter/material.dart';

import 'package:expense_tracker/models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  const Chart({
    Key? key,
    required this.recentTransactions,
  }) : super(key: key);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDays = DateTime.now().subtract(Duration(days: index));
      int totalSum = 0;

      for (int i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDays.day &&
            recentTransactions[i].date.month == weekDays.month &&
            recentTransactions[i].date.year == weekDays.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDays).substring(0, 1),
        'amount': totalSum
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(
          children: groupedTransactionValues.map((data) {
        return Text("${data['day']} : ${data['amount']}");
      }).toList()),
    );
  }
}
