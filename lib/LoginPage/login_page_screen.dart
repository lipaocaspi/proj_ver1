import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:proj_ver1/MainPage/main_page_screen.dart';
import 'package:proj_ver1/SignupPage/signup_page_screen.dart';
import 'package:proj_ver1/constants.dart';
import 'package:proj_ver1/responsive.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: MobileLoginPage(),
    );
  }
}

class MobileLoginPage extends StatefulWidget {
  const MobileLoginPage({super.key});

  @override
  MobileLoginPageState createState() {
    return MobileLoginPageState();
  }
}

class MobileLoginPageState extends State<MobileLoginPage> {
  final _formKey = GlobalKey<FormState>();

  void _validate() {
    _formKey.currentState?.validate();  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: kBackgroundColor,
        height: MediaQuery.of(context).size.height,
        child: Form(
          key: _formKey,
          // child: Stack(
          // alignment: Alignment.center,
          // children: <Widget>[
            child: Column(
              children: [
                Flexible(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      // child: Center(
                      child: ListView(
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.09),
                          Text(
                            "Ingreso",
                            style: GoogleFonts.pressStart2p(fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
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
                              validator: ValidationBuilder()
                                  .maxLength(50)
                                  .regExp(
                                      RegExp(
                                          r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+"),
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
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: EdgeInsets.only(left: 35, right: 35),
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
                                        primary: const Color.fromARGB(255, 242, 255, 239),
                                      ),
                                      child: Icon(Icons.person_add, color: kButtonPrimaryColor),
                                    )
                                  )
                              ),
                                Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 5, right: 50),
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
                                          fixedSize: const Size(100, 45),
                                        ),
                                        child: Text(
                                          "Ingresar".toUpperCase(),
                                        ),
                                      ),
                                    ),
                                    )
                            ],
                          ), 
                        ],
                      ),
                  )
                )
              ],
            ),
            // SizedBox(height: MediaQuery.of(context).size.height * 0.09),
            // SafeArea(child: child),
          // ],
        // ),
        ),
      ),
    );
  }
}
