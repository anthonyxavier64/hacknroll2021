import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hacknroll2021/MyHomePage.dart';
import 'package:hacknroll2021/pages/home_page.dart';
import 'package:hacknroll2021/widgets/loading.dart';

class Wrapper extends StatelessWidget {
  static const routeName = './wrapper';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Loading();
        }
        if (snapshot.hasData) {
          return HomePage();
        }
        return MyHomePage();
      },
    );
  }
}
