import 'package:flutter/material.dart';
import 'package:persona_expenses/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteBtn;

  TransactionList(this.transaction, this.deleteBtn);

  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? Column(
            children: <Widget>[
              Text(
                'No transaction yet',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                child: Image.asset(
                  'assets/images/waiting.png',
                ),
              )
            ],
          )
        : Expanded(
            child: Container(
              child: ListView(
                children: transaction.map((e) {
                  return Card(
                      child: Row(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          )),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            '\$' '${e.amount}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Theme.of(context).primaryColor),
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '${e.title}',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat().format(e.date),
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: IconButton(
                              onPressed: () {deleteBtn(e.id);},
                              color: Theme.of(context).primaryColor,
                              icon: Icon(Icons.delete)),
                        ),
                      )
                    ],
                  ));
                }).toList(),
              ),
            ),
          );
  }
}
