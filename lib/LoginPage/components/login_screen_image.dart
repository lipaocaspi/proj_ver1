import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImagLog extends StatelessWidget {
  const ImagLog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Ingreso",
          style: GoogleFonts.pressStart2p(fontSize: 15),
        ),
        const SizedBox(height: 16 * 2),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 1,
              child: Image.asset(
                "assets/images/llanta.png",
              ),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: 16 * 2),
      ],
    );
  }
}