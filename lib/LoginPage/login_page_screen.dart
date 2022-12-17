import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:proj_ver1/FirstPage/components/bloc/user_bloc.dart';
import 'package:proj_ver1/MainPage/main_page_screen.dart';
import 'package:proj_ver1/SignupPage/signup_page_screen.dart';
import 'package:proj_ver1/components/background.dart';
import 'package:proj_ver1/constants.dart';
import 'package:proj_ver1/data/repository/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final List<Users> _users = [];
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      if (state is InitialUsersState) {
        return const Background(
            child: CircularProgressIndicator(color: Colors.green));
      }
      if (state is LoadingUsersState) {
        _users.addAll(state.users);
        return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Scaffold(
              body: Container(
                width: double.infinity,
                color: kBackgroundColor,
                height: MediaQuery.of(context).size.height,
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
                                "Ingreso",
                                style: GoogleFonts.pressStart2p(fontSize: 15),
                                textAlign: TextAlign.center),
                              SizedBox(height: 25),
                              Row(
                                children: [
                                  const Spacer(),
                                  Expanded(
                                    flex: 2,
                                    child: Image.asset(
                                      "assets/images/llanta.png",
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                              SizedBox(height: 25),
                              Padding(
                                padding: EdgeInsets.only(left: 35, right: 35),
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  cursorColor: Colors.black,
                                  controller: _controllerEmail,
                                  onTap: () {
                                    for (var i = 1; i <= 99; i++) {
                                      print(_users[i].email);
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    hintText: "Correo",
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Icon(Icons.email),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 15),
                              Padding(
                                padding: EdgeInsets.only(left: 35, right: 35),
                                child: TextFormField(
                                  textInputAction: TextInputAction.done,
                                  obscureText: true,
                                  cursorColor: Colors.black,
                                  controller: _controllerPassword,
                                  onTap: () {
                                    for (var i = 1; i <= 99; i++) {
                                      print(_users[i].password);
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    hintText: "Contraseña",
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Icon(Icons.lock),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 25),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                        padding: EdgeInsets.only(left: 50, right: 5),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                              PageTransition(
                                                child: const SignUpPage(),
                                                type: PageTransitionType.fade,
                                              ),
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: const Color.fromARGB(
                                                255, 242, 255, 239),
                                          ),
                                          child: Icon(Icons.person_add,
                                              color: kButtonPrimaryColor),
                                        ))),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 5, right: 50),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          for (var i = 1; i <= 99; i++) {
                                            String em = _users[i].email;
                                            if (em ==
                                                _controllerEmail.text
                                                  .toString()) {
                                              print(em);
                                              String pass = _users[i].password;
                                              if (pass ==
                                                  _controllerPassword.text
                                                    .toString()) {
                                                print("done");
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                      MainPage(_users[i], id: i),
                                                  ),
                                                );
                                                break;
                                              } else {
                                                final PasswordSnack = SnackBar(
                                                  content: Text(
                                                    "La contraseña es incorrecta"),
                                                  action: SnackBarAction(
                                                    label: 'Cerrar',
                                                    onPressed: () {
                                                      Navigator.of(context);
                                                    },
                                                  )
                                                );
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(PasswordSnack);
                                                break;
                                              }
                                            } else {
                                              if (i == 99) {
                                                final UserSnack = SnackBar(
                                                  content: Text(
                                                    "El usuario no existe"),
                                                  action: SnackBarAction(
                                                    label: 'Cerrar',
                                                    onPressed: () {
                                                      Navigator.of(context);
                                                    },
                                                  ));
                                                ScaffoldMessenger.of(context)
                                                  .showSnackBar(UserSnack);
                                                }
                                              }
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          fixedSize: const Size(100, 45),
                                        ),
                                        child: Text(
                                          "Ingresar".toUpperCase(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ))
                      ],
                    ),
                ),
            ));
      }
      return const Center(child: Text(""));
    });
  }
}
