import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:persian_datepicker/persian_datepicker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale("fa", "IR"),
      ],
      locale: Locale("fa", "IR"),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final activeDateTextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: Colors.black,
  );

  final deactiveDateTextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: Colors.red[900],
  );

  final monthTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: Colors.grey[850],
  );

  final yearTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: Colors.grey[850],
  );

  final weekTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: Colors.grey[850],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Persian Datepicker example"),
      ),
      body: Center(
        child: PersianDatepicker(
          deactiveWeekList: [1, 2, 5],
          deactiveDayList: [11, 28],
          activeDateTextStyle: activeDateTextStyle,
          deactiveDateTextStyle: deactiveDateTextStyle,
          monthTextStyle: monthTextStyle,
          yearTextStyle: yearTextStyle,
          weekTextStyle: weekTextStyle,
          // customMonthesName: [],
          onMonthChange: (result) {
            print("onMonthChange => " + result.toString());
          },
          onDateSelect: (result) {
            print('onDateSelect => ' + result);
          },
          onDeactiveDateSelect: (result) {
            print('onDeactiveDateSelect => ' + result);
          },
        ),
      ),
    );
  }
}
