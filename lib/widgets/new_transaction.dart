// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    final enteredTitle = titleController.text;
    if (amountController.text.isEmpty) {
      return;
    }
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTx(titleController.text, double.parse(amountController.text),
        _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(
                labelText: "Amount",
              ),
              onSubmitted: (_) => _submitData(),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_selectedDate == null
                    ? "No Date Chosen"
                    : 'Picked Date :  ' +
                        DateFormat.yMMMd().format(_selectedDate!)),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    primary: Theme.of(context).primaryColor,
                  ),
                  child: Text("Choose Date",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  onPressed: _presentDatePicker,
                )
              ],
            ),
            ElevatedButton(
              child: Text("Add Transaction"),
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
              ),
              onPressed: _submitData,
            )
          ],
        ),
      ),
    ));
  }
}
