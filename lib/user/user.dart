import 'package:flutter/material.dart';

class User {
  String image;
  // Image image;
  String name;
  String email;
  String phone;
  String aboutMeDescription;

  // Constructor
  User({
    required this.image,
    required this.name,
    required this.email,
    required this.phone,
    required this.aboutMeDescription,
  });
}
