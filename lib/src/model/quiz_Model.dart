import 'package:flutter/material.dart';

class QuizModel {
  final String name;
  final String msg;
  final Image img;
  final bool isUser;

  QuizModel({
    required this.name,
    required this.msg,
    required this.img,
    required this.isUser,
  });
}
