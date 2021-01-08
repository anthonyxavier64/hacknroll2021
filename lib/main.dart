import 'package:flutter/material.dart';
import 'package:hacknroll2021/pages/home_page.dart';
import 'package:hacknroll2021/pages/Onboarding/slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        // if (snapshot.hasError) {
        //   return Scaffold(
        //
        //   );
        // }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
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
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        // return Scaffold(
        //
        // );;
        return Scaffold();
      },
    );
  }
}
