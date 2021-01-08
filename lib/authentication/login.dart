import 'package:flutter/material.dart';
import 'package:hacknroll2021/screens/faculty_list_page/faculty_list_page.dart';
import 'package:hacknroll2021/widgets/custom_text_field.dart';
import 'package:hacknroll2021/services/auth.dart';

class LoginPage extends StatefulWidget {
  static const routeName = './loginPage';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  String _email = '';
  String _password = '';

  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => FacultyListPage(),
            ),
          );
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Builder(
        builder: (ctx) => GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 150),
                  CustomTextField(
                    rightMargin: 20,
                    leftMargin: 20,
                    function: (val) => setState(() {
                      this._email = val;
                    }),
                    labelText: 'Email',
                  ),
                  SizedBox(height: 25),
                  CustomTextField(
                    rightMargin: 20,
                    leftMargin: 20,
                    function: (val) => setState(() {
                      this._password = val;
                    }),
                    labelText: 'Password',
                  ),
                  SizedBox(height: 25),
                  FlatButton(
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () async {
                      try {
                        await _auth.signInWithEmailAndPassword(
                            _email, _password);
                        print('log in');
                      } catch (e) {}
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
