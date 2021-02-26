library persian_datepicker;

import 'package:flutter/material.dart';
import 'package:persian_datepicker/widgets/date_select.dart';
import 'package:persian_datepicker/widgets/month_select.dart';
import 'package:shamsi_date/shamsi_date.dart';

class PersianDatepicker extends StatefulWidget {
  /// TextStyle for monthes
  final TextStyle monthTextStyle;

  /// TextStyle for year
  final TextStyle yearTextStyle;

  /// Default months name are set. add an array with length 12 for custom monthes name
  final List<String> customMonthesName;

  /// Evnet that calls whenever monthes changes. Fucntion(int newMonth)
  final Function(int) onMonthChange;

  /// Acvive Date TextStyle
  final TextStyle activeDateTextStyle;

  /// Active Date onSelect
  final Function(String) onDateSelect;

  /// Deactive Weeks number. this is a list with week number [1 => shanbe, 7 => jome]
  /// for examle [1, 2, 5] and this will disable shanbe, yekshanbe, chaharshanbe
  /// in DatePicker. if it is null then all weeks are active
  final List<int> deactiveWeekList;

  /// Deactive Date TextStyle

  /// Deavtive Date onSelect

  const PersianDatepicker({
    Key key,
    @required this.onMonthChange,
    @required this.onDateSelect,
    this.monthTextStyle,
    this.yearTextStyle,
    this.customMonthesName,
    this.activeDateTextStyle,
    this.deactiveWeekList,
  }) : super(key: key);

  @override
  _PersianDatepickerState createState() => _PersianDatepickerState();
}

class _PersianDatepickerState extends State<PersianDatepicker> {
  Jalali jalali;

  @override
  void initState() {
    this.jalali = new Jalali.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          MonthSelect(
            jalali: this.jalali,
            onMonthChange: (jalali) {
              setState(() {
                this.jalali = jalali;
                widget.onMonthChange(jalali.month);
              });
            },
            monthTextStyle: widget.monthTextStyle,
            yearTextStyle: widget.yearTextStyle,
            customMonthesName: widget.customMonthesName,
          ),
          DateSelect(
            jalali: this.jalali,
            onDateSelect: widget.onDateSelect,
            activeDateTextStyle: widget.activeDateTextStyle,
            deactiveWeekList: widget.deactiveWeekList,
          ),
        ],
      ),
    );
  }
}
