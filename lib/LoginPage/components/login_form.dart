import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proj_ver1/constants.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: Colors.black,
            onSaved: (email) {},
            decoration: const InputDecoration(
              fillColor: Colors.white,
              hintText: "Correo",
              prefixIcon: Padding(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.person, color: kPrimaryLightColor),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                hintText: "Contraseña",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.lock, color: kPrimaryLightColor),
                ),
              ),
            ),
          ),
          const SizedBox(height: 7),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                elevation: 6,
                fixedSize: const Size(250, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              child: Text(
                "Ingresar".toUpperCase(),
                style: GoogleFonts.lato(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(height: 10),
          // AccountCheck(
            // press: () {
              // Navigator.push(
                // context,
                // MaterialPageRoute(
                  // builder: (context) {
                    // return SignUpScreen();
                  // },
                // ),
              // );
            // },
          // ),
        ],
      ),
    );
  }
}