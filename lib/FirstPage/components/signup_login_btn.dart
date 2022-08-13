import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:proj_ver1/LoginPage/login_page_screen.dart';
import 'package:proj_ver1/SignupPage/signup_page_screen.dart';

class LoginSignUpBtn extends StatelessWidget {
  const LoginSignUpBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              PageTransition(
                child: const LoginPage(),
                type: PageTransitionType.fade,
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
            elevation: 6,
            fixedSize: const Size(250, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
          child: Text(
            "INGRESAR",
            style: GoogleFonts.lato(color: Colors.white),
          ),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              PageTransition(
                child: const SignUpPage(),
                type: PageTransitionType.fade,
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
            elevation: 6,
            fixedSize: const Size(250, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
          child: Text(
            "REGISTRARSE",
            style: GoogleFonts.lato(color: Colors.white),
          ),
        ),
      ],
    );
  }
}