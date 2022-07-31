import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            Text(
              "UIS Wheels",
              style: GoogleFonts.pressStart2p(),
            ),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: Colors.black, elevation: 5),
                child: Text(
                  "INGRESAR",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )),
            ElevatedButton(
              onPressed: () {},
              style:
                  ElevatedButton.styleFrom(primary: Colors.black, elevation: 5),
              child: Text(
                "REGISTRARSE",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
