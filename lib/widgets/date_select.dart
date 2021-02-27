import 'package:flutter/material.dart';
import 'package:shamsi_datepicker/utils/date_util.dart';
import 'package:shamsi_date/shamsi_date.dart';

class DateSelect extends StatefulWidget {
  final Jalali jalali;
  final bool useFullWeekName;
  final TextStyle weekTextStyle;
  final Function(String) onDateSelect;
  final TextStyle activeDateTextStyle;
  final List<int> deactiveWeekList;
  final Function(String) onDeactiveDateSelect;
  final TextStyle deactiveDateTextStyle;
  final List<int> deactiveDayList;
  final Color activeSelectedDateBackColor;
  final Color deactiveSelectedDateBackColor;
  final Color activeSelectedDateTextColor;
  final Color deactiveSelectedDateTextColor;
  final double datesBorderRadius;

  const DateSelect({
    Key key,
    @required this.jalali,
    @required this.onDateSelect,
    @required this.onDeactiveDateSelect,
    this.useFullWeekName = false,
    this.weekTextStyle,
    this.activeDateTextStyle,
    this.deactiveWeekList,
    this.deactiveDateTextStyle,
    this.deactiveDayList,
    this.activeSelectedDateBackColor,
    this.activeSelectedDateTextColor,
    this.datesBorderRadius,
    this.deactiveSelectedDateBackColor,
    this.deactiveSelectedDateTextColor,
  }) : super(key: key);

  @override
  _DateSelectState createState() => _DateSelectState();
}

class _DateSelectState extends State<DateSelect> {
  int selectedDate = -1;

  @override
  Widget build(BuildContext context) {
    var gridViewChild = List<Widget>();
    gridViewChild.addAll(
        DateUtil.headerWidget(widget.useFullWeekName, widget.weekTextStyle));
    gridViewChild.addAll(
      DateUtil.daysWidget(
          jalali: widget.jalali,
          activeDateTextStyle: widget.activeDateTextStyle,
          deactiveWeekList: widget.deactiveWeekList,
          deactiveDateTextStyle: widget.deactiveDateTextStyle,
          deactiveDayList: widget.deactiveDayList,
          selectedDay: selectedDate,
          activeSelectedDateBackColor: widget.activeSelectedDateBackColor,
          activeSelectedDateTextColor: widget.deactiveSelectedDateBackColor,
          datesBorderRadius: widget.datesBorderRadius,
          deactiveSelectedDateBackColor: widget.deactiveSelectedDateBackColor,
          deactiveSelectedDateTextColor: widget.deactiveSelectedDateTextColor,
          onDateSelect: (Jalali jalai) {
            setState(() {
              selectedDate = jalai.day;
            });
            final y = jalai.formatter.yyyy;
            final m = jalai.formatter.mm;
            final d = jalai.formatter.dd;
            widget.onDateSelect('$y/$m/$d');
          },
          onDeactiveDateSelect: (Jalali jalai) {
            setState(() {
              selectedDate = jalai.day;
            });
            final y = jalai.formatter.yyyy;
            final m = jalai.formatter.mm;
            final d = jalai.formatter.dd;
            widget.onDeactiveDateSelect('$y/$m/$d');
          }),
    );

    return Expanded(
      child: GridView.count(
        crossAxisCount: 7,
        children: gridViewChild.toList(),
      ),
    );
  }
}
