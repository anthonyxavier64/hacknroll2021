import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hacknroll2021/screens/StudentProfilePage/student_profile_page.dart';
import 'package:hacknroll2021/widgets/loading.dart';

class FriendPage extends StatefulWidget {
  static const routeName = './friendPage';

  FriendPage();

  @override
  _FriendPageState createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> {
  List friends = [];
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_getFriends();
  }

  /*
  _getFriends() async {
    QuerySnapshot result;
    result = await FirebaseFirestore.instance
        .collection('students')
        .where('faculty', isEqualTo: widget.faculty)
        .get();
    for (int i = 0; i < result.docs.length; i++) {
      students.add(result.docs[i].data());
    }
    setState(() {
      isLoading = false;
    });
  }

   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Friends'),
      ),
      body: isLoading
          ? Loading()
          : Container(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildFriendList()
          ],
        ),
      ),
    );
  }

  Widget _buildFriendList() {
    return Expanded(
        child: ListView(children: <Widget>[
          new ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: this.friends.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildFriendCard(
                  this.friends[index]['fullname'],
                  this.friends[index]['faculty'],
                  this.friends[index]['yearOfStudy'],
                  this.friends[index]['interests'],
                );
              }),
        ]));
  }

  Widget _buildFriendCard(
      String name, String faculty, String year, String interests) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.only(top: 13, left: 20, right: 20),
        //hoverColor: Color(0xFFA3A3A3),
        leading: Icon(
          Icons.person,
          color: Colors.teal[100],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$name",
              style: TextStyle(
                  fontFamily: 'Montserrat', fontWeight: FontWeight.w600),
            ),
          ],
        ),
        subtitle: Text('$year'),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.teal[100]),
        dense: true,
        isThreeLine: true,
        onTap: () {

        },
      ),
    );
  }
}
