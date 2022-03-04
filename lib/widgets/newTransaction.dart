import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction({
    Key? key,
    required this.addTx,
  }) : super(key: key);

  final Function addTx;

  TextEditingController titleController = TextEditingController();
  TextEditingController amountController = TextEditingController();

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
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Amount"),
              controller: amountController,
            ),
            MaterialButton(
              onPressed: () {
                addTx(titleController.text, int.parse(amountController.text));
              },
              color: Colors.blue.shade400,
              child: const Text("Add Transaction"),
            )
          ],
        ),
      ),
    );
  }
}
