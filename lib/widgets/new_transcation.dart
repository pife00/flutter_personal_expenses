import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  void _presentDatePicker(
    context,
  ) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((pickDate) {
      if (pickDate == null) {
        return;
      } else {
        setState(() {
          _selectedDate = pickDate;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom +10
          ),
          child: Column(
            children: <Widget>[
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
              ),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Amount',
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('Pick Date: ' + DateFormat.yMd().format(_selectedDate)),
                  Container(
                    child: TextButton(
                      onPressed: () {
                        _presentDatePicker(context);
                      },
                      child: Text('Add Date'),
                    ),
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        widget.addTransaction(
                            titleController.text, amountController.text,_selectedDate);
                        Navigator.of(context).pop();
                      },
                      child: Text('Add Transactions'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
