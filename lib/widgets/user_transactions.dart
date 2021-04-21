import 'dart:math';

import 'package:flutter/material.dart';
import '../widgets/transaction_list.dart';
import '../widgets/new_transaction.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transactions> transaction = [
    Transactions(id: 1, title: 'Coffe', amount: 200, date: DateTime.now()),
    Transactions(id: 2, title: 'Pizza', amount: 420, date: DateTime.now())
  ];

  void _addTransaction(txTitle, txAmount) {
    final txData = Transactions(
        id: new Random().nextInt(1000),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());

    setState(() {
      transaction.add(txData);
    });
    print(transaction);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [NewTransaction(_addTransaction), TransactionList(transaction)],
    );
  }
}
