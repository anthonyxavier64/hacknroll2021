import 'package:flutter/material.dart';
import 'package:hacknroll2021/services/auth.dart';
import 'pages/login_page.dart';
import 'package:provider/provider.dart';
import './models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Once complete, show your application
    return StreamProvider<CurrentUser>.value(
      value: Auth().user,
      child: MaterialApp(
        title: 'CHAKmate2021',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginPage(),
        },
      ),
    );
  }
}
