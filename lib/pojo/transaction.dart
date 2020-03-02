import 'package:flutter/foundation.dart';

class Transaction {
  String id;
  String title;
  double txnAmount;
  DateTime txnDate;

  Transaction({
    @required this.id,
    @required this.title,
    @required this.txnAmount,
    @required this.txnDate,
  });
}
