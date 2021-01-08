import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference studentCollection =
      FirebaseFirestore.instance.collection('students');

  Future updateStudentData({
    String fullname,
    String faculty,
    String interests,
  }) async {
    return await studentCollection.doc(uid).set({
      'fullname': fullname,
      'faculty': faculty,
      'interests': interests,
    });
  }
}
