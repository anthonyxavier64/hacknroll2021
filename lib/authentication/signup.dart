import 'package:flutter/material.dart';
import 'package:hacknroll2021/dummy_data.dart';
import 'package:hacknroll2021/pages/home_page.dart';
import 'package:hacknroll2021/widgets/custom_multiline_text_field.dart';
import 'package:hacknroll2021/widgets/custom_text_field.dart';
import '../services/auth.dart';
import 'package:hacknroll2021/MainInterface.dart';

class RegistrationPage extends StatefulWidget {
  static const routeName = './registrationpage';

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String _email = '';
  String _password = '';
  String _fullname = '';
  String _interests = '';
  String _facultySelected;
  int _yearOfStudySelected;

  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registration',
        ),
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
                  SizedBox(
                    height: 25,
                  ),
                  CustomTextField(
                    leftMargin: 20,
                    rightMargin: 20,
                    labelText: 'Email',
                    function: (val) => setState(
                      () {
                        this._email = val;
                      },
                    ),
                    textInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  CustomTextField(
                    leftMargin: 20,
                    rightMargin: 20,
                    labelText: 'Password. Min: 6 characters',
                    function: (val) => setState(
                      () {
                        this._password = val;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  CustomTextField(
                    leftMargin: 20,
                    rightMargin: 20,
                    labelText: 'Full name',
                    function: (val) => setState(
                      () {
                        this._fullname = val;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                        ),
                      ),
                      hint: Text(
                        'Select faculty',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      value: _facultySelected,
                      items: DummyData()
                          .faculties
                          .map((faculty) => DropdownMenuItem(
                                child: Text(faculty),
                                value: faculty,
                              ))
                          .toList(),
                      onChanged: (val) => setState(
                        () {
                          this._facultySelected = val;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 20,
                      right: 200,
                    ),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                        ),
                      ),
                      hint: Text(
                        'Select year of study',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      value: _yearOfStudySelected,
                      items: DummyData()
                          .yearOfStudy
                          .map((year) => DropdownMenuItem(
                                child: Text('$year'),
                                value: year,
                              ))
                          .toList(),
                      onChanged: (val) => setState(
                        () {
                          this._yearOfStudySelected = val;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  CustomMultilineTextField(
                    labelText:
                        'List your interests!\n(Use  ","  to separate them)',
                    function: (val) => setState(
                      () {
                        this._interests = val;
                      },
                    ),
                  ),
                  SizedBox(height: 25),
                  FlatButton(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Theme.of(context).primaryColor,
                    onPressed: () async {
                      try {
                        dynamic result =
                            await _auth.registerWithEmailAndPassword(
                          email: this._email.trim(),
                          password: this._password.trim(),
                          faculty: this._facultySelected.trim(),
                          fullname: this._fullname.trim(),
                          yearOfStudy: this._yearOfStudySelected,
                          interests: this._interests,
                        );
                        
                           Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => MainInterface()));
                      } catch (e) {
                        print(e);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
