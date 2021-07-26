import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double speandingAmount;
  final double speadingPctTotal;

  ChartBar(this.label, this.speandingAmount, this.speadingPctTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Column(
        children: <Widget>[
          Container(
              height: 20,
              child: FittedBox(
                  child: Text('\$${speandingAmount.toStringAsFixed(0)}'))),
          SizedBox(
            height: 4,
          ),
          Container(
            height:MediaQuery.of(context).size.height/10,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20)),
                ),
                FractionallySizedBox(
                  heightFactor: speadingPctTotal,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(label)
        ],
      );
    });
  }
}
