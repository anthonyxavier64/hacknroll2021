import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final double leftMargin;
  final double rightMargin;
  final Function function;
  final TextInputType textInputType;

  CustomTextField({
    @required this.leftMargin,
    @required this.rightMargin,
    @required this.function,
    this.labelText = '',
    this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: leftMargin,
        right: rightMargin,
      ),
      child: TextField(
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
        onChanged: function,
        keyboardType: textInputType,
      ),
    );
  }
}