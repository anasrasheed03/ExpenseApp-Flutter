import 'package:flutter/foundation.dart';

class Transactions {
  final String title;
  final int id;
  final int amount;
  final DateTime date;

  Transactions(
      {@required this.id,
      @required this.title,
      @required this.amount,
      @required this.date});
}
