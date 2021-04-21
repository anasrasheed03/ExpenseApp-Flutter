import 'dart:math';

import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';
import './widgets/transaction_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expense',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.green,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light()
              .textTheme
              .copyWith(title: TextStyle(fontFamily: 'OpenSans', fontSize: 14)),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20,
                      fontWeight: FontWeight.bold)))),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void _addNewTransactionProcess(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: NewTransaction(_addTransaction),
            onTap: () {},
          );
        });
  }

  final List<Transactions> transaction = [
    // Transactions(id: 1, title: 'Coffe', amount: 200, date: DateTime.now()),
    // Transactions(id: 2, title: 'Pizza', amount: 420, date: DateTime.now())
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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expense'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _addNewTransactionProcess(context))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
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
            TransactionList(transaction)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _addNewTransactionProcess(context),
      ),
    );
  }
}
