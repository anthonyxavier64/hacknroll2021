import 'package:flutter/material.dart';

class Slide {
  final String image;
  final String title;
  final String description;

  Slide({
    @required this.image,
    @required this.title,
    @required this.description,
  });
}

final slideList = [
  Slide(
    image: "assets/school.png",
    title: "Welcome to ChakMate",
    description: "Know your friends \ndoing the same module ",
  ),
  Slide(
    image: "assets/third.png",
    title: "Learn Together",
    description: "Form projects group easily and quickly",
  ),
  Slide(
    image: "assets/last.png",
    title: "School is Fun!",
    description: "Stay engaged and connected as a community",
  ),
  
  
    
];
