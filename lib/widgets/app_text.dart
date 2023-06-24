import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class AppText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  AppText({
   this.size=18,
     this.color=Colors.black54,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }
}