import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proj_ver1/constants.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  SignUpFormState createState() {
    return SignUpFormState();
  }
}

class SignUpFormState extends State<SignUpForm> {
  DateTime date = DateTime.now();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            cursorColor: Colors.black,
            onSaved: (name) {},
            decoration: const InputDecoration(
              fillColor: Colors.white,
              hintText: "Nombre",
              prefixIcon: Padding(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.person, color: kPrimaryLightColor),
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text("Fecha de Nacimiento"),
          const SizedBox(height: 6),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: ElevatedButton(
                    onPressed: () async {
                      DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100));
                      if (newDate == null) return;
                      setState(() => date = newDate);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: kButtonPrimaryColor,
                      elevation: 6,
                      fixedSize: const Size(50, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Icon(Icons.calendar_month,
                      color: kButtonPrimaryLightColor),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: TextFormField(
                    keyboardType: TextInputType.datetime,
                    textInputAction: TextInputAction.next,
                    cursorColor: Colors.black,
                    controller: TextEditingController(text: '${date.day}/${date.month}/${date.year}'),
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      hintText: "Fecha de Nacimiento",
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
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
                child: Icon(Icons.mail, color: kPrimaryLightColor),
              ),
            ),
          ),
          const SizedBox(height: 12),
          TextFormField(
            textInputAction: TextInputAction.next,
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
          const SizedBox(height: 12),
          TextFormField(
            textInputAction: TextInputAction.done,
            obscureText: true,
            cursorColor: Colors.black,
            decoration: const InputDecoration(
              fillColor: Colors.white,
              hintText: "Confirmar contraseña",
              prefixIcon: Padding(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.lock, color: kPrimaryLightColor),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Hero(
            tag: "signup_btn",
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: kButtonPrimaryColor,
                elevation: 6,
                fixedSize: const Size(225, 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              child: Text(
                "Registrarse".toUpperCase(),
                style: GoogleFonts.lato(
                    color: kButtonPrimaryLightColor,
                    fontWeight: FontWeight.bold),
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