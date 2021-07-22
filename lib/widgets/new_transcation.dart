import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(color: Colors.purple),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple),
                ),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple)),
              ),
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.purple),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple),
                ),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple)),
                labelText: 'Amount',
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  widget.addTransaction(
                      titleController.text, amountController.text);
                  Navigator.of(context).pop();
                },
                child: Text('Add Transactions'),
                style: TextButton.styleFrom(primary: Colors.purple),
              ),
            )
          ],
        ),
      ),
    );
  }
}
