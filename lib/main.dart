import 'package:flutter/material.dart';
import 'package:main_project/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: new ThemeData(scaffoldBackgroundColor: Colors.grey[100]),
      home: HomeScreen(),
    );
  }
}
