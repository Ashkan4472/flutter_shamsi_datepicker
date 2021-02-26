import 'package:flutter/material.dart';
import 'package:shamsi_date/shamsi_date.dart';

class DateUtil {
  static final _shortWeekName = [
    "ش",
    "ی",
    "د",
    "س",
    "چ",
    "پ",
    "ج",
  ];

  static final _fullWeekNames = [
    "شنبه",
    "یکشنبه",
    "دوشنبه",
    "سه شنبه",
    "چهارشنبه",
    "پنجشنبه",
    "جمعه",
  ];

  static int _startWeekDayOfMonth(Jalali jalali) {
    return jalali.withDay(1).weekDay;
  }

  static int _monthLength(Jalali jalali) {
    return jalali.monthLength;
  }

  static List<Widget> daysWidget({
    Jalali jalali,
    Function(Jalali) onDateSelect,
    TextStyle activeDateTextStyle,
    TextStyle deactiveDateTextStyle,
    List<int> deactiveWeekList,
    Function(Jalali) onDeactiveDateSelect,
  }) {
    final startDay = _startWeekDayOfMonth(jalali) - 1;

    return List.generate(_monthLength(jalali) + startDay, (index) {
      if (index < startDay) {
        return FlatButton(
          child: Text('-'),
          onPressed: null,
        );
      }

      var activeStyle =
          activeDateTextStyle ?? TextStyle(fontWeight: FontWeight.w400);
      var deactiveStyle = deactiveDateTextStyle ??
          TextStyle(color: Colors.red, fontWeight: FontWeight.w400);
      var day = index - startDay + 1;

      // this checks whethter it is in deactive list or not
      if (deactiveWeekList != null &&
          deactiveWeekList.contains(jalali.withDay(day).weekDay)) {
        return FlatButton(
          child: Text(
            '$day',
            style: deactiveStyle,
          ),
          onPressed: () {
            onDeactiveDateSelect(jalali.withDay(day));
          },
        );
      }

      return FlatButton(
        child: Text(
          '$day',
          style: activeStyle,
        ),
        onPressed: () {
          onDateSelect(jalali.withDay(index - startDay + 1));
        },
      );
    });
  }

  static List<Widget> headerWidget(
    bool useFullWeekName,
    TextStyle weekTextStyle,
  ) {
    final _header = useFullWeekName ? _fullWeekNames : _shortWeekName;
    final _headerWidget = _header.map((x) {
      if (weekTextStyle != null) {
        return Center(
          child: Text(
            '$x',
            style: weekTextStyle,
          ),
        );
      }

      return Center(
        child: Text(
          '$x',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      );
    }).toList();

    return _headerWidget;
  }
}
