import 'package:flutter/material.dart';
import 'package:persian_datepicker/utils/month_util.dart';
import 'package:shamsi_date/shamsi_date.dart';

class MonthSelect extends StatefulWidget {
  Jalali jalali;

  MonthSelect({
    Key key,
    @required jalali,
  });

  @override
  _MonthSelectState createState() => _MonthSelectState();
}

class _MonthSelectState extends State<MonthSelect> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined),
            onPressed: () {
              setState(() {
                widget.jalali = widget.jalali.addMonths(1);
              });
            },
          ),
          Spacer(),
          Text(widget.jalali.year.toString()),
          SizedBox(width: 8),
          Text(MonthUtil.getMonthName(widget.jalali.month)),
          Spacer(),
          IconButton(
            icon: Icon(Icons.arrow_forward_ios_outlined),
            onPressed: () {
              setState(() {
                widget.jalali = widget.jalali.addMonths(-1);
              });
            },
          ),
        ],
      ),
    );
  }
}
