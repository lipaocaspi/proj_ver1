import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'package:google_fonts/google_fonts.dart';

class Imag extends StatelessWidget {
  const Imag({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "UIS Wheels",
          style: GoogleFonts.pressStart2p(fontSize: 19),
        ),
        SizedBox(height: 16 * 2),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 2,
              child: Image.asset(
                "assets/images/llanta.png",
              ),
            ),
            Spacer(),
          ],
        ),
        SizedBox(height: 16 * 1.5),
      ],
    );
  }
}