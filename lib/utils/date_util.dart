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

  static List<Widget> daysWidget(Jalali jalali) {
    final startDay = _startWeekDayOfMonth(jalali) - 1;

    return List.generate(_monthLength(jalali) + startDay, (index) {
      if (index < startDay) {
        return Center(
          child: Text('-'),
        );
      }

      return Center(
        child: Text(
          '${index - startDay + 1}',
        ),
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
