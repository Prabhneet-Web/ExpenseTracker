import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction({
    Key? key,
    required this.addTx,
  }) : super(key: key);

  final Function addTx;

  TextEditingController titleController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = int.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount < 0) return;
    addTx(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Title"),
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            MaterialButton(
              onPressed: submitData,
              color: Colors.blue.shade400,
              child: const Text("Add Transaction"),
            )
          ],
        ),
      ),
    );
  }
}
