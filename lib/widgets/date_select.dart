import 'package:flutter/material.dart';
import 'package:persian_datepicker/utils/date_util.dart';
import 'package:shamsi_date/shamsi_date.dart';

class DateSelect extends StatefulWidget {
  final Jalali jalali;
  final bool useFullWeekName;
  final TextStyle weekTextStyle;
  final Function(String) onDateSelect;

  const DateSelect({
    Key key,
    @required this.jalali,
    @required this.onDateSelect,
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
    gridViewChild.addAll(DateUtil.daysWidget(
      widget.jalali,
      (Jalali jalai) {
        final y = jalai.formatter.yyyy;
        final m = jalai.formatter.mm;
        final d = jalai.formatter.dd;
        widget.onDateSelect('$y/$m/$d');
      },
    ));

    return Expanded(
      child: GridView.count(
        crossAxisCount: 7,
        children: gridViewChild.toList(),
      ),
    );
  }
}
