import 'package:flutter/material.dart';

class Slide {
  final String imageUrl;
  final String title;
  final String description;

  Slide({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
  });
}

final slideList = [
  Slide(
    imageUrl: "assets/school.png",
    title: "Welcome to ChakMate",
    description: "Know your friends \ndoing the same module ",
  ),
  Slide(
    imageUrl: "assets/third.png",
    title: "Learn Together",
    description: "Form projects group easily and quickly",
  ),
  Slide(
    imageUrl: "assets/last.png",
    title: "School is Fun!",
    description: "Stay engaged and connected as a community",
  ),
  
  
    
];
