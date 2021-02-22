library persian_datepicker;

import 'package:flutter/material.dart';
import 'package:persian_datepicker/widgets/month_select.dart';
import 'package:shamsi_date/shamsi_date.dart';

class PersianDatepicker extends StatefulWidget {
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
          ),
        ],
      ),
    );
  }
}
