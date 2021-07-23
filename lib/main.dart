import 'package:flutter/material.dart';
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

  void addTranscations(String title, String amount) {
    var el = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: double.parse(amount),
        date: DateTime.now());
    setState(() {
      transaction.add(el);
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
          Container(
            width: double.infinity,
            child: Card(
              child: Text('Chart'),
              elevation: 5,
            ),
          ),
          TransactionList(transaction),
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
