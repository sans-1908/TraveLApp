import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class AppLargeText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  AppLargeText({
   this.size=30,
     this.color=Colors.black,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}