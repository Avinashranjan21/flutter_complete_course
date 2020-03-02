import 'package:flutter/material.dart';
import 'package:flutter_complete_course/pojo/transaction.dart';

import 'transaction_list.dart';

class UserTransaction extends StatelessWidget {
  List<Transaction> _userTransaction;

  UserTransaction(this._userTransaction);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionList(_userTransaction),
      ],
    );
  }
}
