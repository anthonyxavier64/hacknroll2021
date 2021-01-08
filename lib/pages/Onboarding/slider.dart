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
    imageUrl: "assets/images/Welcome.png",
    title: "Welcome to Cycled",
    description: "Make cents and sense\nwith your food waste!",
  ),
  Slide(
    imageUrl: "assets/images/secondscreen.png",
    title: "Trash is Cash",
    description: "Dispose your food waste to earn exciting rewards ",
  ),
  Slide(
    imageUrl: "assets/images/third.png",
    title: "Learn and Earn",
    description: "Learn with us to save our environment for a better tomorrow",
  ),
  Slide(
    imageUrl: "assets/images/Eat and Shop.png",
    title: "Be a Host",
    description:
        "Champion the green movement with food waste collected from your neighbours",
  ),
  Slide(
    imageUrl: "assets/images/community.png",
    title: "Your effort counts",
    description: "Are you ready?",
  ),
];
