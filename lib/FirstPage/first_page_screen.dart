import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proj_ver1/constants.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: kPrimaryColor,
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.11),
            Text(
              "UIS Wheels",
              style: GoogleFonts.pressStart2p(fontSize: 18),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.06),
            Image.asset(
              "assets/images/llanta.png",
              height: 200,
              scale: 0.1,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                elevation: 6,
                fixedSize: const Size(250, 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              child: Text(
                "INGRESAR",
                style: GoogleFonts.lato(color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                elevation: 6,
                fixedSize: const Size(250, 45),
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
        ),
      )),
    );
  }
}