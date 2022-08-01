import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proj_ver1/constants.dart';
import '../components/background.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Text("Hola", style: GoogleFonts.arapey()),
    ); // backgroundColor: kPrimaryColor;
  }
}