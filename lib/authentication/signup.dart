import 'package:flutter/material.dart';
import 'DummyData.dart';
import 'custom_multiline_text_field.dart';
import 'custom_text_field.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  ScrollController controller;
  String _email = '';
  String _password = '';
  String _fullname = '';
  String _facultySelected;

  final _formKey = GlobalKey<FormState>();

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
                    labelText: 'Password',
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
                  CustomMultilineTextField(
                    labelText:
                        'List your interests!\n(Use  ","  to separate them)',
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
                    onPressed: () {},
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