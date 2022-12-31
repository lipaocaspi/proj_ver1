import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:proj_ver1/LoginPage/login_page_screen.dart';
import 'package:proj_ver1/MainPage/main_page_screen.dart';
import 'package:proj_ver1/constants.dart';
import 'package:proj_ver1/data/repository/models/user_model.dart';
import 'package:proj_ver1/variables.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerBirth = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerPasswordConf = TextEditingController();
  final _keyForm = GlobalKey<FormState>();
  late Users newUser;

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
              key: _keyForm,
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
                            validator: ValidationBuilder().build(),
                            controller: _controllerName,
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
                        Padding(
                          padding: EdgeInsets.only(left: 35, right: 35),
                          child: TextFormField(
                            keyboardType: TextInputType.datetime,
                            textInputAction: TextInputAction.next,
                            validator: ValidationBuilder().build(),
                            controller: _controllerBirth,
                            decoration: const InputDecoration(
                              hintText: "DD/MM/AAAA",
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(10),
                                child: Icon(Icons.calendar_month),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Padding(
                          padding: EdgeInsets.only(left: 35, right: 35),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            validator: ValidationBuilder().build(),
                            controller: _controllerEmail,
                            onChanged: (value) {
                              setState(() {
                                email = _controllerEmail.text;
                              });
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
                            validator: ValidationBuilder().build(),
                            controller: _controllerPassword,
                            obscureText: true,
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
                            validator: ValidationBuilder().build(),
                            controller: _controllerPasswordConf,
                            obscureText: true,
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
                                        backgroundColor: const Color.fromARGB(
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
                                  onPressed: () async {
                                    if (_keyForm.currentState!.validate()) {
                                      final response = await http.get(Uri.parse(
                                        "http://192.168.1.39:3000/users?email=$email"));
                                    if (response.statusCode == 200) {
                                      List<dynamic> myUser =
                                          json.decode(response.body);
                                      List<Users> user = myUser
                                          .map((e) => Users.fromJson(e))
                                          .toList();
                                      if (user.isEmpty) {
                                        if (_controllerPassword.text ==
                                            _controllerPasswordConf.text) {
                                          postUser();
                                        } else {
                                          final passSnack = SnackBar(
                                            content: Text(
                                                "Las contraseñas no coinciden"),
                                            action: SnackBarAction(
                                              label: "Cerrar",
                                              onPressed: () {
                                                Navigator.of(context);
                                              },
                                            ),
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(passSnack);
                                        }
                                      } else {
                                        final emailSnack = SnackBar(
                                          content: Text(
                                              "Este correo ya se encuentra registrado"),
                                          action: SnackBarAction(
                                            label: "Cerrar",
                                            onPressed: () {
                                              Navigator.of(context);
                                            },
                                          ),
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(emailSnack);
                                      }
                                      return;
                                    }
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

  postUser() async {
    newUser = Users(
        id: 8,
        name: _controllerName.text,
        dateOfBirth: _controllerBirth.text,
        email: _controllerEmail.text,
        password: _controllerPassword.text);
    final response =
        await http.post(Uri.parse("http://192.168.1.39:3000/users"),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(<String, dynamic>{
              "id": newUser.id,
              "name": newUser.name,
              "dateOfBirth": newUser.dateOfBirth,
              "email": newUser.email,
              "password": newUser.password,
            }));
    if (response.statusCode == 201) {
      Navigator.of(context).push(
        PageTransition(
          child: MainPage(id: newUser.id, users: newUser),
          type: PageTransitionType.fade,
        ),
      );
      final successSnack = SnackBar(
        content: Text("Usuario creado con éxito"),
        action: SnackBarAction(
          label: "Cerrar",
          onPressed: () {
            Navigator.of(context);
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(successSnack);
    }
  }
}
