import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransactionHandler;

  NewTransaction(this.addTransactionHandler);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submit() {
    final titleValue = titleController.text;
    final amountValue = int.parse(amountController.text);

    if (titleValue.isEmpty || amountValue < 0) {
      return;
    }
    widget.addTransactionHandler(titleValue, amountValue);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(20),
      child: Card(
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
                keyboardType: TextInputType.number,
              ),
              FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  onPressed: submit,
                  child: Text('Add Transaction'))
            ],
          )),
    );
  }
}
