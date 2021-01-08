import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hacknroll2021/MyHomePage.dart';
import 'package:hacknroll2021/authentication/signup.dart';
import 'package:hacknroll2021/pages/home_page.dart';
import 'package:hacknroll2021/services/auth.dart';
import 'package:hacknroll2021/wrapper.dart';
import 'authentication/login.dart';
import 'package:provider/provider.dart';
import './models/user.dart';
import './widgets/loading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Once complete, show your application
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return Loading();
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return StreamProvider<CurrentUser>.value(
            value: AuthService().user,
            child: MaterialApp(
              title: 'CHAKmate2021',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: Wrapper(),
              routes: {
                RegistrationPage.routeName: (ctx) => RegistrationPage(),
                LoginPage.routeName: (ctx) => LoginPage(),
                HomePage.routeName: (ctx) => HomePage(),
              },
            ),
          );
        }

        return Loading();
      },
    );
  }
}
