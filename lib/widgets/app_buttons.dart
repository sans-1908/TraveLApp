import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_text.dart';

//import '../misc/color.dart';

// ignore: must_be_immutable
class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  String? text;
  IconData? icon;
  double size;
  final Color borderColor;
  bool isIcon;
  AppButtons({
  this.isIcon=false,
  required this.color,
  required this.size,
  required this.backgroundColor,
  required this.borderColor,
  this.text="Hi",
  this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
                          width: size,
                          height: size,
                          decoration: BoxDecoration(
                            border: Border.all(
                            color: borderColor,
                            width:1.0,
                          ),
                            borderRadius: BorderRadius.circular(15),
                            color: backgroundColor,
                          ),
                          child: isIcon==false?Center(child: AppText(text: text!,color:color)):Center(child: Icon(icon,color: color,)),
                        );
  }
}