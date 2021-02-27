library persian_datepicker;

import 'package:flutter/material.dart';
import 'package:shamsi_datepicker/widgets/date_select.dart';
import 'package:shamsi_datepicker/widgets/month_select.dart';
import 'package:shamsi_date/shamsi_date.dart';

class ShamsiDatepicker extends StatefulWidget {
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

  /// Active Date onSelect. this funtion returns shamsi string date
  final Function(String) onDateSelect;

  /// Deactive Weeks number. this is a list with week number [1 => shanbe, 7 => jome]
  /// for examle [1, 2, 5] and this will disable shanbe, yekshanbe, chaharshanbe
  /// in DatePicker. if it is null then all weeks are active
  final List<int> deactiveWeekList;

  /// Deactive Day in month. this is a list with the number number of the day
  /// in month and this will disable that date in datepicker
  final List<int> deactiveDayList;

  /// Deactive Date TextStyle
  final TextStyle deactiveDateTextStyle;

  /// Deavtive Date onSelect. this funtion returns shamsi string date
  final Function(String) onDeactiveDateSelect;

  /// if sets to true, weeks name will written complete
  final bool useFullWeekName;

  /// TextStyle for weeks text
  final TextStyle weekTextStyle;

  /// Background color when an active date will select
  final Color activeSelectedDateBackColor;

  /// Text color when an active date will select
  final Color activeSelectedDateTextColor;

  /// Border radius for dates button
  final double datesBorderRadius;

  /// Background color when an deactive date will select
  final Color deactiveSelectedDateBackColor;

  /// Text color when an deactive date will select
  final Color deactiveSelectedDateTextColor;

  const ShamsiDatepicker({
    Key key,
    @required this.onMonthChange,
    @required this.onDateSelect,
    @required this.onDeactiveDateSelect,
    this.monthTextStyle,
    this.yearTextStyle,
    this.customMonthesName,
    this.activeDateTextStyle,
    this.deactiveWeekList,
    this.deactiveDateTextStyle,
    this.useFullWeekName,
    this.weekTextStyle,
    this.deactiveDayList,
    this.activeSelectedDateBackColor,
    this.activeSelectedDateTextColor,
    this.datesBorderRadius,
    this.deactiveSelectedDateBackColor,
    this.deactiveSelectedDateTextColor,
  }) : super(key: key);

  @override
  _PersianDatepickerState createState() => _PersianDatepickerState();
}

class _PersianDatepickerState extends State<ShamsiDatepicker> {
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
            onDeactiveDateSelect: widget.onDeactiveDateSelect,
            deactiveDateTextStyle: widget.deactiveDateTextStyle,
            useFullWeekName: widget.useFullWeekName,
            weekTextStyle: widget.weekTextStyle,
            deactiveDayList: widget.deactiveDayList,
            activeSelectedDateBackColor: widget.activeSelectedDateBackColor,
            activeSelectedDateTextColor: widget.activeSelectedDateTextColor,
            datesBorderRadius: widget.datesBorderRadius,
            deactiveSelectedDateBackColor: widget.deactiveSelectedDateBackColor,
            deactiveSelectedDateTextColor: widget.deactiveSelectedDateTextColor,
          ),
        ],
      ),
    );
  }
}
