// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 570,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No transactions added yet!',
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/a.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 15,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 2,
                              ),
                            ),
                            padding: EdgeInsets.all(8),
                            child: Text(
                              '\u{20B9} ${transactions[index].amount.toStringAsFixed(2)}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Theme.of(context).primaryColor),
                            )),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(transactions[index].title,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18))),
                              Container(
                                padding: EdgeInsets.only(
                                  right: 10,
                                ),
                                child: Text(
                                  DateFormat.yMMMd()
                                      .add_jm()
                                      .format(transactions[index].date),
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                              ),
                            ])
                      ]),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
