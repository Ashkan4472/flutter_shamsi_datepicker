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

  static String formatDate(Jalali jalali, String format) {
    var result = format;
    if (result == null || result == "") {
      result = "yyyy/mm/dd";
    }

    var d = jalali.formatter.d;
    var dd = jalali.formatter.dd;
    var m = jalali.formatter.m;
    var mm = jalali.formatter.mm;
    var yy = jalali.formatter.yy;
    var yyyy = jalali.formatter.yyyy;

    result = result.replaceAll(new RegExp('yyyy'), yyyy);
    result = result.replaceAll(new RegExp('yy'), yy);
    result = result.replaceAll(new RegExp('mm'), mm);
    result = result.replaceAll(new RegExp('m'), m);
    result = result.replaceAll(new RegExp('dd'), dd);
    result = result.replaceAll(new RegExp('d'), d);

    return result;
  }

  static String formatGregorianDate(Gregorian gregorian, String format) {
    var result = format;
    if (result == null || result == "") {
      result = "yyyy/mm/dd";
    }

    var d = gregorian.formatter.d;
    var dd = gregorian.formatter.dd;
    var m = gregorian.formatter.m;
    var mm = gregorian.formatter.mm;
    var yy = gregorian.formatter.yy;
    var yyyy = gregorian.formatter.yyyy;

    result = result.replaceAll(new RegExp('yyyy'), yyyy);
    result = result.replaceAll(new RegExp('yy'), yy);
    result = result.replaceAll(new RegExp('mm'), mm);
    result = result.replaceAll(new RegExp('m'), m);
    result = result.replaceAll(new RegExp('dd'), dd);
    result = result.replaceAll(new RegExp('d'), d);

    return result;
  }

  static List<Widget> daysWidget({
    Jalali jalali,
    Function(Jalali) onDateSelect,
    TextStyle activeDateTextStyle,
    TextStyle deactiveDateTextStyle,
    List<int> deactiveWeekList,
    Function(Jalali) onDeactiveDateSelect,
    List<int> deactiveDayList,
    int selectedDay,
    double datesBorderRadius = 32.0,
    Color deactiveSelectedDateBackColor = Colors.red,
    Color activeSelectedDateBackColor = Colors.blue,
    Color deactiveSelectedDateTextColor = Colors.black,
    Color activeSelectedDateTextColor = Colors.white,
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
      var _datesBorderRadius = datesBorderRadius ?? 32;
      var _deactiveSelectedDateBackColor =
          deactiveSelectedDateBackColor ?? Colors.red;
      var _activeSelectedDateBackColor =
          activeSelectedDateBackColor ?? Colors.blue;
      var _deactiveSelectedDateTextColor =
          deactiveSelectedDateTextColor ?? Colors.black;
      var _activeSelectedDateTextColor =
          activeSelectedDateTextColor ?? Colors.white;
      var day = index - startDay + 1;

      // HACK: overrides the sent color in style if date is selected
      if (selectedDay == day) {
        activeStyle = activeStyle.copyWith(color: _activeSelectedDateTextColor);
        deactiveStyle =
            deactiveStyle.copyWith(color: _deactiveSelectedDateTextColor);
      }

      // this checks whethter it is in deactive list or not
      if (deactiveWeekList != null &&
          deactiveWeekList.contains(jalali.withDay(day).weekDay)) {
        return FlatButton(
          child: Text(
            '$day',
            style: deactiveStyle,
          ),
          onPressed: () {
            selectedDay = day;
            onDeactiveDateSelect(jalali.withDay(day));
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(_datesBorderRadius)),
          ),
          color: selectedDay == day
              ? _deactiveSelectedDateBackColor
              : Colors.transparent,
        );
      }

      // sets deactive days
      if (deactiveDayList != null && deactiveDayList.contains(day)) {
        return FlatButton(
          child: Text(
            '$day',
            style: deactiveStyle,
          ),
          onPressed: () {
            selectedDay = day;
            onDeactiveDateSelect(jalali.withDay(day));
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(_datesBorderRadius)),
          ),
          color: selectedDay == day
              ? _deactiveSelectedDateBackColor
              : Colors.transparent,
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(_datesBorderRadius)),
        ),
        color: selectedDay == day
            ? _activeSelectedDateBackColor
            : Colors.transparent,
      );
    });
  }

  static List<Widget> headerWidget(
    bool useFullWeekName,
    TextStyle weekTextStyle,
  ) {
    final _header = (useFullWeekName != null && useFullWeekName)
        ? _fullWeekNames
        : _shortWeekName;
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
