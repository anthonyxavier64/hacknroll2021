import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart';
import './database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  CurrentUser _userFromFirebaseUser(User user) {
    return user != null ? CurrentUser(uid: user.uid) : null;
  }

  Stream<CurrentUser> get user {
    return _auth
        .authStateChanges()
        .map((User user) => _userFromFirebaseUser(user));
  }

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }

  Future registerWithEmailAndPassword({
    String email,
    String password,
    String fullname,
    String faculty,
    String interests,
  }) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      await DatabaseService(uid: user.uid).updateStudentData(
        fullname: fullname,
        faculty: faculty,
        interests: interests,
      );
      return _userFromFirebaseUser(user);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
