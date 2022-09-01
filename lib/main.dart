import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proj_ver1/FirstPage/first_page_screen.dart';
import 'package:proj_ver1/constants.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UIS Wheels',
      theme: ThemeData(
          primaryColor: Colors.green.withOpacity(0.8),
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.latoTextTheme(),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Color.fromARGB(255, 242, 255, 239),
            iconColor: Colors.grey,
            prefixIconColor: Colors.grey.withOpacity(0.8),
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            border: OutlineInputBorder(
              // borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide.none
            ),
          ),

        ),
      home: const FirstPage(),
    );
  }
}
