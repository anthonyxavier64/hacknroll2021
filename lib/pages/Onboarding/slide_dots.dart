import 'package:flutter/material.dart';

class SlideDots extends StatelessWidget {
  bool isActive;
  SlideDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: isActive ? 10 : 8,
      width: isActive ? 30 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.green[900] : Colors.green[100],
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
