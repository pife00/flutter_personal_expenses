import 'package:flutter/material.dart';
import 'package:persona_expenses/widgets/chart.dart';
import 'package:persona_expenses/widgets/new_transcation.dart';
import 'package:persona_expenses/widgets/transaction_list.dart';

import 'models/transaction.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    title: "Personal Expenses",
    theme: ThemeData(
        fontFamily: 'Manjari',
        primarySwatch: Colors.indigo,
        accentColor: Colors.indigo[900],
        inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(color: Colors.indigo),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.indigo)))),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transaction> transaction = [];

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  List<Transaction> get _recentTransactions{
    return transaction.where((element){
      return element.date.isAfter(DateTime.now().subtract(Duration(days:7)));
    }).toList();
  }

  void startNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewTransaction(addTranscations),
          );
        });
  }

  

  void addTranscations(String title, String amount,DateTime pickDate) {
    var el = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: double.parse(amount),
        date: pickDate);
    setState(() {
      transaction.add(el);
    });
  }

  void deleteTransactions(String id){
    setState(() {
      transaction.removeWhere((element) {
        return element.id == id;
      });
    });
  }
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        actions: <Widget>[],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
         Chart(_recentTransactions),

          TransactionList(transaction,deleteTransactions),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          startNewTransaction(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
