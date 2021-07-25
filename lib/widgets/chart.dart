import 'package:flutter/material.dart';
import 'package:persona_expenses/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:persona_expenses/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get totalSpeading{
    return  groupTransaction.fold(0.0, (sum, item){
      return sum + (item['amount'] as double) ;
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(groupTransaction[0]['amount'].toString());
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupTransaction.map((e) {
        return Flexible(
          fit:FlexFit.tight,
          child: ChartBar(e['day'].toString(), 
          (e['amount'] as double), 
               totalSpeading == 0.0 ? 00 : (e['amount'] as double) / totalSpeading),
        );
      }).toList()),
    );
  }
}
