import 'package:flutter/material.dart';
import 'package:flutter_complete_course/widgets/new_transaction.dart';
import 'package:flutter_complete_course/widgets/user_transaction.dart';

import 'pojo/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transaction> _userTransaction = [
    Transaction(
        id: "t1",
        title: "Python Book",
        txnAmount: 19.99,
        txnDate: DateTime.now()),
    Transaction(
        id: "t2",
        title: "Kotlin Book",
        txnAmount: 99.99,
        txnDate: DateTime.now()),
    Transaction(
        id: "t3",
        title: "Augmented Reality Book",
        txnAmount: 100.00,
        txnDate: DateTime.now()),
    Transaction(
        id: "t4",
        title: "Machine Learning Book",
        txnAmount: 9.99,
        txnDate: DateTime.now())
  ];

  void _addNewTransaction(String txnTitle, double txnAmount) {
    final newTxn = Transaction(
        title: txnTitle,
        txnAmount: txnAmount,
        txnDate: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      _userTransaction.add(newTxn);
    });
  }

  void addNewTransactionDialog(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addNewTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("My Expense App"),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => addNewTransactionDialog(context),
                ),
              ],
            ),
            body: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: Card(color: Colors.blue, child: Text("CHART!")),
                ),
                UserTransaction(_userTransaction),
              ],
            ))));
  }
}
