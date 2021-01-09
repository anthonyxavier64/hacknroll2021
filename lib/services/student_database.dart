import 'package:cloud_firestore/cloud_firestore.dart';

class StudentDatabaseService {
  StudentDatabaseService();

  final CollectionReference studentCollection =
  FirebaseFirestore.instance.collection('students');

  Future<QuerySnapshot> getStudentData({
    String fullname,
    String faculty,
    String interests,
  }) async {
    return await studentCollection.get();
  }
}