import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hacknroll2021/screens/StudentProfilePage/student_profile_page.dart';
import 'package:hacknroll2021/widgets/loading.dart';

class FacultyListPage extends StatefulWidget {
  static const routeName = './facultyListPage';
  final String faculty;

  FacultyListPage({this.faculty});

  @override
  _FacultyListPageState createState() => _FacultyListPageState();
}

class _FacultyListPageState extends State<FacultyListPage> {
  bool viewStudentList = true;
  bool isLoading = true;
  List students = [];
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getStudents();
  }

  _getStudents() async {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${widget.faculty}'),
      ),
      body: isLoading
          ? Loading()
          : Container(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FlatButton(
                            onPressed: () {
                              this.setState(() {
                                this.viewStudentList = true;
                              });
                            },
                            color: this.viewStudentList
                                ? Colors.teal[100]
                                : Theme.of(context).scaffoldBackgroundColor,
                            minWidth: 150,
                            child: Text('Students')),
                        FlatButton(
                            onPressed: () {
                              this.setState(() {});
                            },
                            color: this.viewStudentList
                                ? Theme.of(context).scaffoldBackgroundColor
                                : Colors.teal[100],
                            minWidth: 150,
                            child: Text('Tutors'))
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildSectionHeader(),
                  this.viewStudentList ? _buildStudentList() : Container()
                ],
              ),
            ),
    );
  }

  Widget _buildSectionHeader() {
    return Container(
      //height: 4 * SizeConfig.heightMultiplier,
      padding: EdgeInsets.only(left: 15, top: 8, bottom: 8),
      alignment: Alignment.centerLeft,
      color: const Color(0xFFE4E4E4),
      child: Text('Filter by:  Relevance',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              fontSize: 13.5)),
    );
  }

  Widget _buildStudentList() {
    return Expanded(
        child: ListView(children: <Widget>[
      new ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: this.students.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildStudentCard(
              this.students[index]['fullname'],
              this.students[index]['faculty'],
              this.students[index]['yearOfStudy'],
              this.students[index]['interests'],
            );
          }),
    ]));
  }

  Widget _buildStudentCard(
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
            Text(
              "Faculty of $faculty",
              style: TextStyle(fontFamily: 'Montserrat'),
            ),
          ],
        ),
        subtitle: Text('$year'),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.teal[100]),
        dense: true,
        isThreeLine: true,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) =>
                  StudentProfilePage(name, faculty, year, interests),
            ),
          );
        },
      ),
    );
  }
}
