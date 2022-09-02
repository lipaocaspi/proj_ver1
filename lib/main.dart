import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proj_ver1/FirstPage/first_page_screen.dart';
import 'package:proj_ver1/constants.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UIS Wheels',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: kPrimaryColor,
          centerTitle: true,
          foregroundColor: Colors.black
        ),
          primaryColor: Colors.green.withOpacity(0.8),
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.latoTextTheme(),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: kButtonPrimaryColor,
              elevation: 4,
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18)
              ),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: const Color.fromARGB(255, 242, 255, 239),
            iconColor: Colors.white,
            prefixIconColor: Colors.grey.withOpacity(0.8),
            contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            border: const OutlineInputBorder(
              // borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide.none
            ),
          ),

        ),
      home: const FirstPage(),
    );
  }
}
