import 'package:flutter/material.dart';
import 'package:hacknroll2021/pages/home_page.dart';
import 'package:hacknroll2021/screens/faculty_list_page/faculty_list_page.dart';
import 'package:hacknroll2021/widgets/custom_text_field.dart';
import 'package:hacknroll2021/services/auth.dart';
import 'package:hacknroll2021/MainInterface.dart';

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
                            _email.trim(), _password.trim());
                       
                           Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => MainInterface()));
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
