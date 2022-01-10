import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    if (amountController.text.isEmpty) {
      return;
    }
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTx(titleController.text, double.parse(amountController.text));

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: "Title",
              ),
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(
                labelText: "Amount",
              ),
              onSubmitted: (_) => submitData(),
              keyboardType: TextInputType.number,
            ),
            FlatButton(
              child: Text("Add Transaction"),
              textColor: Theme.of(context).primaryColor,
              onPressed: submitData,
            )
          ],
        ),
      ),
    ));
  }
}
