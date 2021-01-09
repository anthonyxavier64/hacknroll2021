import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentProfilePage extends StatefulWidget {
  final String name;
  final String faculty;
  final String year;
  final String interests;

  StudentProfilePage(this.name, this.faculty, this.year, this.interests);

  @override
  _StudentProfilePageState createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top:10, bottom: 10),
              child: Icon(
                Icons.person,
                color: Colors.teal[100],
                size: 80,
              ),
            ),
            Text(
              '${this.widget.name}',
              style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w600, fontSize: 25),
            ),
            SizedBox(height: 8),
            Text(
              'Faculty of ${this.widget.faculty}',
              style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w600, fontSize: 15),
            ),
            SizedBox(height: 5),
            Text(
              '${this.widget.year}',
              style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w600, fontSize: 15),
            ),
            SizedBox(height: 8),
            _buildSectionHeader(),
            _buildAboutMe(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal[200],
        child: Icon(
            Icons.person_add
        ),
        onPressed: () async {
          await _showFriendAddedDialog();
        },
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Container(
      padding: EdgeInsets.only(left: 15, top:8, bottom: 8),
      alignment: Alignment.centerLeft,
      color: const Color(0xFFE4E4E4),
      child: Text(
          'About me',
          style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w500, fontSize: 13.5)),
    );
  }

  Widget _buildAboutMe() {
    return Container(
      padding: EdgeInsets.only(top: 13, left: 15, right: 20),
        alignment: Alignment.centerLeft,
      child: Text(
        '${this.widget.interests}',
        style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w600, fontSize: 15),
      )
    );
  }

  Future<void> _showFriendAddedDialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Success',
            style: TextStyle(
                fontFamily: 'MontSerrat',
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 22),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  "${this.widget.name} has been added to Friends!",
                  style: TextStyle(fontFamily: 'MontSerrat'),
                )
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('DONE'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}