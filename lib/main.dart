import 'package:flutter/material.dart';
import 'package:bmi_calc/pages/homepage.dart';
import 'package:bmi_calc/constants/theme.dart'as theme;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        'HomePage': (BuildContext context) => new HomePage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'BMI Calc',
      theme: ThemeData(
        primaryColor: theme.blue,
        accentColor: theme.green
      ),

      home: HomePage(),
    );
  }
}

