import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:proj_ver1/MainPage/main_page_screen.dart';
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
            validator: ValidationBuilder()
                .maxLength(50)
                .regExp(RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+"),
                    'Ingrese un correo válido')
                .build(),
            decoration: const InputDecoration(
              hintText: "Correo",
              prefixIcon: Padding(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: Colors.black,
              validator: ValidationBuilder()
                  .maxLength(30, 'Número máximo de caracteres: 30')
                  .build(),
              decoration: const InputDecoration(
                hintText: "Contraseña",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: 7),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  PageTransition(
                    child: const MainPage(),
                    type: PageTransitionType.fade,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(225, 45),
              ),
              child: Text(
                "Ingresar".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
