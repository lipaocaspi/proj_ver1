import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:form_validator/form_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:proj_ver1/LoginPage/login_page_screen.dart';
import 'package:proj_ver1/MainPage/main_page_screen.dart';
import 'package:proj_ver1/constants.dart';
import 'package:proj_ver1/responsive.dart';
import 'package:proj_ver1/variables.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: MobileSignUpPage(),
    );
  }
}

class MobileSignUpPage extends StatefulWidget {
  const MobileSignUpPage({super.key});

  @override
  MobileSignUpPageState createState() {
    return MobileSignUpPageState();
  }
}

class MobileSignUpPageState extends State<MobileSignUpPage> {
  final _formKey = GlobalKey<FormState>();

  // void _validate() {
  // _formKey.currentState?.validate();
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          body: Container(
            width: double.infinity,
            color: kBackgroundColor,
            height: MediaQuery.of(context).size.height,
            child: Form(
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(
                children: [
                  Flexible(
                      child: Container(
                    padding: EdgeInsets.all(15),
                    child: ListView(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.09),
                        Text(
                          "Registro",
                          style: GoogleFonts.pressStart2p(fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 25),
                        Padding(
                          padding: EdgeInsets.only(left: 35, right: 35),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.black,
                            validator: ValidationBuilder()
                                .maxLength(
                                    50, 'Número máximo de caracteres: 50')
                                .build(),
                            onChanged: (value) {
                              name = value;
                            },
                            decoration: const InputDecoration(
                              hintText: "Nombre",
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(10),
                                child: Icon(Icons.person),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text("Fecha de Nacimiento",
                            textAlign: TextAlign.center),
                        const SizedBox(height: 6),
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(left: 35, right: 5),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    DateTime? newDate = await showDatePicker(
                                        context: context,
                                        initialDate: date,
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2100));
                                    if (newDate == null) return;
                                    setState(() => date = newDate);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(50, 50)),
                                  child: const Icon(Icons.calendar_month),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.only(left: 5, right: 35),
                                child: TextFormField(
                                  keyboardType: TextInputType.datetime,
                                  textInputAction: TextInputAction.next,
                                  cursorColor: Colors.black,
                                  validator: ValidationBuilder()
                                      .regExp(
                                          RegExp(
                                              r"^([0-9]|[1-2][0-9]|(3)[0-1])(\/)(([0-9])|((1)[0-2]))(\/)\d{4}"),
                                          "Ingrese una fecha válida")
                                      .build(),
                                  controller: TextEditingController(
                                      text:
                                          '${date.day}/${date.month}/${date.year}'),
                                  // decoration: const InputDecoration(
                                  // fillColor: Colors.white,
                                  // hintText: "Fecha de Nacimiento",
                                  // ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Padding(
                          padding: EdgeInsets.only(left: 35, right: 35),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.black,
                            validator: (email) =>
                                email != null && !EmailValidator.validate(email)
                                    ? 'Ingrese un correo válido'
                                    : null,
                            onChanged: (value) {
                              email = value;
                            },
                            decoration: const InputDecoration(
                              hintText: "Correo",
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(10),
                                child: Icon(Icons.mail),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Padding(
                          padding: EdgeInsets.only(left: 35, right: 35),
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            obscureText: true,
                            cursorColor: Colors.black,
                            onChanged: (value) {
                              password = value;
                            },
                            validator: ValidationBuilder()
                                .regExp(
                                    RegExp(
                                        r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}"),
                                    "Ingrese una contraseña válida")
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
                        const SizedBox(height: 12),
                        Padding(
                          padding: EdgeInsets.only(left: 35, right: 35),
                          child: TextFormField(
                            textInputAction: TextInputAction.done,
                            obscureText: true,
                            cursorColor: Colors.black,
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return 'This field is required';
                              }
                              if (value != password) {
                                return "Las contraseñas no coinciden.";
                              }
                            },
                            decoration: const InputDecoration(
                              hintText: "Confirmar contraseña",
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(10),
                                child: Icon(Icons.lock),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 50, right: 5),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          PageTransition(
                                            child: const LoginPage(),
                                            type: PageTransitionType.fade,
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: const Color.fromARGB(
                                            255, 242, 255, 239),
                                      ),
                                      child: Icon(Icons.login,
                                          color: kButtonPrimaryColor),
                                    ))),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.only(left: 5, right: 50),
                                child: ElevatedButton(
                                  onPressed: () {
                                    final isValidForm =
                                        _formKey.currentState!.validate();
                                    if (isValidForm) {
                                      Navigator.of(context).push(PageTransition(
                                              child: MainPage(),
                                              type: PageTransitionType.fade)
                                          // (Route<dynamic> route) => false
                                          );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(100, 45),
                                  ),
                                  child: Text(
                                    "Registrarse".toUpperCase(),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
        ));
  }
}
