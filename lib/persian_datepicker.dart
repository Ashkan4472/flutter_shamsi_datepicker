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

  /// Evnet that calls whenever monthes changes. Fucntion(Jalali)
  final Function(DateTime) onMonthChange;

  /// Acvive Date TextStyle

  /// Active Date onSelect
  final Function(String) onDateSelect;

  /// Deactive Date TextStyle

  /// Deavtive Date onSelect

  const PersianDatepicker({
    Key key,
    @required this.onMonthChange,
    @required this.onDateSelect,
    this.monthTextStyle,
    this.yearTextStyle,
    this.customMonthesName,
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
                widget.onMonthChange(jalali.toDateTime());
              });
            },
            monthTextStyle: widget.monthTextStyle,
            yearTextStyle: widget.yearTextStyle,
            customMonthesName: widget.customMonthesName,
          ),
          DateSelect(
            jalali: this.jalali,
            onDateSelect: widget.onDateSelect,
          ),
        ],
      ),
    );
  }
}
