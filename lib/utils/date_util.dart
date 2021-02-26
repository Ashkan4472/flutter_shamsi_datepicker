import 'package:flutter/material.dart';

class DateUtil {
  static final shortWeekName = [
    "ش",
    "ی",
    "د",
    "س",
    "چ",
    "پ",
    "ج",
  ];

  static final fullWeekNames = [
    "شنبه",
    "یکشنبه",
    "دوشنبه",
    "سه شنبه",
    "چهارشنبه",
    "پنجشنبه",
    "جمعه",
  ];

  static List<Widget> headerWidget(
    bool useFullWeekName,
    TextStyle weekTextStyle,
  ) {
    final _header =
        useFullWeekName ? DateUtil.fullWeekNames : DateUtil.shortWeekName;
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
