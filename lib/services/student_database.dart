import 'package:cloud_firestore/cloud_firestore.dart';

class StudentDatabaseService {
  StudentDatabaseService();

  final CollectionReference studentCollection =
  FirebaseFirestore.instance.collection('students');

  Future getStudentData({
    String fullname,
    String faculty,
    String interests,
  }) async {
    QuerySnapshot query = await studentCollection.get();
    for (int i = 0; i < query.docs.length; i++) {
      var a = query.docs[i];
      print(a);
    }
  }
}