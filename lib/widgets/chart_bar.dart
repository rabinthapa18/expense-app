// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;
  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 35,
          padding: EdgeInsets.only(top: 8, bottom: 5),
          child: FittedBox(
            child: Text(
              '\u{20B9}' + spendingAmount.toStringAsFixed(0),
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
            height: 70,
            width: 10,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(220, 220, 220, 1)),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPctOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )
              ],
            )),
        SizedBox(
          height: 4,
        ),
        Container(
            padding: EdgeInsets.only(top: 5, bottom: 8), child: Text(label))
      ],
    );
  }
}
