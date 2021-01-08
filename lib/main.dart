import 'package:flutter/material.dart';
import 'package:hacknroll2021/MyHomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Cycled',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'SFProText',
      ),
      home: new MyHomePage(),
    );
  }
}
