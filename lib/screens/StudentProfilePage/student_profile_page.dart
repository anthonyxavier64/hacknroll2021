import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentProfilePage extends StatefulWidget {
  final List studentItem;

  StudentProfilePage(this.studentItem);

  @override
  _StudentProfilePageState createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User currentUser;
  String currentUserUID;
  Object currentUserData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentUser = auth.currentUser;
    currentUserUID = currentUser.uid;
    /* print(currentUserUID);
    print(this.widget.studentItem[0]); */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Icon(
                Icons.person,
                color: Colors.teal[100],
                size: 80,
              ),
            ),
            Text(
              '${this.widget.studentItem[1]['name']}',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 25),
            ),
            SizedBox(height: 8),
            Text(
              'Faculty of ${this.widget.studentItem[1]['faculty']}',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            ),
            SizedBox(height: 5),
            Text(
              '${this.widget.studentItem[1]['yearOfStudy']}',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            ),
            SizedBox(height: 8),
            _buildSectionHeader(),
            _buildAboutMe(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal[200],

        child: Icon(Icons.add),
        onPressed: () async {
          await FirebaseFirestore.instance
              .collection('students')
              .doc('$currentUserUID')
              .collection('friends')
              .add({widget.studentItem[0]: widget.studentItem[1]});
          DocumentSnapshot currentUserData;
          currentUserData = await FirebaseFirestore.instance
              .collection('students')
              .doc('$currentUserUID')
              .get();
          await FirebaseFirestore.instance
              .collection('students')
              .doc('${widget.studentItem[0]}')
              .collection('friends')
              .add({this.currentUserUID: currentUserData.data()});
        },
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Container(
      padding: EdgeInsets.only(left: 15, top: 8, bottom: 8),
      alignment: Alignment.centerLeft,
      color: const Color(0xFFE4E4E4),
      child: Text('About me',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              fontSize: 13.5)),
    );
  }

  Widget _buildAboutMe() {
    return Container(
        padding: EdgeInsets.only(top: 13, left: 15, right: 20),
        alignment: Alignment.centerLeft,
        child: Text(
          '${this.widget.studentItem[1]['interests']}',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              fontSize: 15),
        ));
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
                  "${this.widget.studentItem[1]['name']} has been added to Friends!",
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