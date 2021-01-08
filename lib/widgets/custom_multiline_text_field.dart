import 'package:flutter/material.dart';

class CustomMultilineTextField extends StatelessWidget {
  final String labelText;
<<<<<<< HEAD

  CustomMultilineTextField({this.labelText = ''});
=======
  final Function function;

  CustomMultilineTextField({
    this.labelText = '',
    this.function,
  });
>>>>>>> master

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          errorStyle: TextStyle(color: Colors.red),
          labelText: labelText,
          labelStyle: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
        ),
        maxLines: 5,
<<<<<<< HEAD
=======
        onChanged: function,
>>>>>>> master
      ),
    );
  }
}
