import 'package:flutter/material.dart';
import 'package:travel_app/pages/welcome_page.dart';
//import 'pages/detail_page.dart';
//import 'pages/home_page.dart';
//import 'pages/detail_page.dart';
//import 'pages/navPages/main_page.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:WelcomePage(), 
    );
  }
}