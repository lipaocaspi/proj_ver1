import 'package:flutter/material.dart';
import 'package:proj_ver1/constants.dart';
import 'FirstPage/first_page_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UIS Wheels',
      theme: ThemeData(
          primaryColor: Colors.green,
          scaffoldBackgroundColor: Colors.white,
      ),
      home: const FirstPage(),
    );
  }
}
