import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proj_ver1/constants.dart';
import 'package:form_validator/form_validator.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  void _validate() {
    _formKey.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: Colors.black,
            validator: ValidationBuilder().email().maxLength(50).build(),
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
              validator: ValidationBuilder().maxLength(30).build(),
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
              onPressed: _validate,
              style: ElevatedButton.styleFrom(
                primary: kButtonPrimaryColor,
                elevation: 6,
                fixedSize: const Size(225, 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              child: Text(
                "Ingresar".toUpperCase(),
                style: GoogleFonts.lato(color: kButtonPrimaryLightColor, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}