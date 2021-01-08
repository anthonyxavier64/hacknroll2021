import 'package:flutter/material.dart';

class SlideDots extends StatelessWidget {
  bool isActive;
  SlideDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 10,
      width: 30,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.blueGrey[100],
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
