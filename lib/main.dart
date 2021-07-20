import 'package:flutter/material.dart';
import './transaction.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final List<Transaction> transaction = [
    Transaction(
        id: 't1', title: 'New shoes', amount: 59.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'MP3', amount: 19.05, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Apple Earphones', amount: 100, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text('Chart'),
              elevation: 5,
            ),
          ),
          Column(
            children: transaction.map((e) {
              return Card(
                  child: Row(
                children: <Widget>[
                  Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.purple,
                        width: 2,
                      )),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        e.amount.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple),
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        e.title.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(e.date.toString(),
                      style: TextStyle(
                        color: Colors.grey
                      ),
                      ),
                    ],
                  )
                ],
              ));
            }).toList(),
          )
        ],
      ),
    );
  }
}
