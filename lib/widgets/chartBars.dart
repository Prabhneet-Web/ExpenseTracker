import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPcnOfTotal;
  const ChartBar({
    Key? key,
    required this.label,
    required this.spendingAmount,
    required this.spendingPcnOfTotal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Column(
        children: [
          Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                  child: Text("₹${spendingAmount.toStringAsFixed(0)}"))),
          SizedBox(height: constraints.maxHeight * 0.04),
          Container(
              height: constraints.maxHeight * 0.62,
              width: 10,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        color: const Color.fromRGBO(220, 220, 220, 1),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPcnOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                ],
              )),
          SizedBox(height: constraints.maxHeight * 0.05),
          Container(height: constraints.maxHeight * 0.14, child: FittedBox(child: Text(label)))
        ],
      ),
    );
  }
}
