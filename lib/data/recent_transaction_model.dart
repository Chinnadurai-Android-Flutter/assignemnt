import 'package:flutter/cupertino.dart';

class RecentTransaction {
  String companyName;
  String time;
  String price;
  String date;
  IconData imagePath;

  RecentTransaction(
      {this.companyName, this.date, this.time, this.price, this.imagePath});
}
