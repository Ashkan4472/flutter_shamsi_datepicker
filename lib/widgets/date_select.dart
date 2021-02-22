import 'package:flutter/material.dart';
import 'package:shamsi_date/shamsi_date.dart';

class DateSelect extends StatefulWidget {
  final Jalali jalali;

  const DateSelect({
    Key key,
    @required this.jalali,
  }) : super(key: key);

  @override
  _DateSelectState createState() => _DateSelectState();
}

class _DateSelectState extends State<DateSelect> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
