import 'package:flutter/material.dart';
import 'package:persian_datepicker/utils/month_util.dart';
import 'package:shamsi_date/shamsi_date.dart';

class MonthSelect extends StatefulWidget {
  final TextStyle monthTextStyle;
  final TextStyle yearTextStyle;
  final List<String> customMonthesName;
  final Jalali jalali;
  final Function(Jalali) onMonthChange;

  MonthSelect({
    Key key,
    @required this.jalali,
    @required this.onMonthChange,
    this.monthTextStyle,
    this.yearTextStyle,
    this.customMonthesName,
  });

  @override
  _MonthSelectState createState() => _MonthSelectState(
        jalali: jalali,
      );
}

class _MonthSelectState extends State<MonthSelect> {
  Jalali jalali;

  _MonthSelectState({
    @required this.jalali,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_forward_ios_outlined),
            onPressed: () {
              setState(() {
                this.jalali = this.jalali.addMonths(-1);
                widget.onMonthChange(this.jalali);
              });
            },
          ),
          Spacer(),
          Text(
            (widget.customMonthesName != null &&
                    widget.customMonthesName.length == 11)
                ? widget.customMonthesName[this.jalali.month - 1]
                : MonthUtil.getMonthName(this.jalali.month),
            style: widget.monthTextStyle,
          ),
          SizedBox(width: 8),
          Text(
            this.jalali.year.toString(),
            style: widget.yearTextStyle,
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined),
            onPressed: () {
              setState(() {
                this.jalali = this.jalali.addMonths(1);
                widget.onMonthChange(this.jalali);
              });
            },
          ),
        ],
      ),
    );
  }
}
