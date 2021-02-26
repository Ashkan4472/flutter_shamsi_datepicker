import 'package:flutter/material.dart';
import 'package:persian_datepicker/utils/date_util.dart';
import 'package:shamsi_date/shamsi_date.dart';

class DateSelect extends StatefulWidget {
  final Jalali jalali;
  final bool useFullWeekName;
  final TextStyle weekTextStyle;

  const DateSelect({
    Key key,
    @required this.jalali,
    this.useFullWeekName = false,
    this.weekTextStyle,
  }) : super(key: key);

  @override
  _DateSelectState createState() => _DateSelectState();
}

class _DateSelectState extends State<DateSelect> {
  @override
  Widget build(BuildContext context) {
    var gridViewChild = List<Widget>();
    gridViewChild.addAll(
        DateUtil.headerWidget(widget.useFullWeekName, widget.weekTextStyle));
    gridViewChild.addAll(DateUtil.daysWidget(widget.jalali));

    return Expanded(
      child: GridView.count(
        crossAxisCount: 7,
        children: gridViewChild.toList(),
      ),
    );
  }
}
