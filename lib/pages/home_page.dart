import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hacknroll2021/dummy_data.dart';
import 'package:hacknroll2021/screens/faculty_list_page/faculty_list_page.dart';
import 'package:hacknroll2021/services/auth.dart';
import 'package:hacknroll2021/widgets/custom_multiline_text_field.dart';

class HomePage extends StatefulWidget {
  static const routeName = './homepage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> faculties = DummyData().getFaculties();

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List of Faculties'),
          actions: [
            FlatButton(
              onPressed: () async {
                await _auth.signOut();
              },
              child: Text('Logout'),
              color: Colors.grey,
            ),
          ],
        ),
        body: Scrollbar(
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              for (var i in faculties)
                FlatButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return FacultyListPage(
                          faculty: i.toString(),
                        );
                      },
                    ),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Text(i.toString()),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.teal[100],
                ),
            ],
          )

          // Container(
          //   padding: const EdgeInsets.all(8),
          //   child: const Text("He'd have you all unravel at the"),
          //   color: Colors.teal[100],
          // ),
          // Container(
          //   padding: const EdgeInsets.all(8),
          //   child: const Text('Heed not the rabble'),
          //   color: Colors.teal[200],
          // ),
          // Container(
          //   padding: const EdgeInsets.all(8),
          //   child: const Text('Sound of screams but the'),
          //   color: Colors.teal[300],
          // ),
          // Container(
          //   padding: const EdgeInsets.all(8),
          //   child: const Text('Who scream'),
          //   color: Colors.teal[400],
          // ),
          // Container(
          //   padding: const EdgeInsets.all(8),
          //   child: const Text('Revolution is coming...'),
          //   color: Colors.teal[500],
          // ),
          // Container(
          //   padding: const EdgeInsets.all(8),
          //   child: const Text('Revolution, they...'),
          //   color: Colors.teal[600],
          // ),
          ,
        ));
  }
}
