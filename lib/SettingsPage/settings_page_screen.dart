import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:proj_ver1/LoginPage/login_page_screen.dart';
import 'package:proj_ver1/SettingsPage/components/help_page.dart';
import 'package:proj_ver1/SettingsPage/components/privacy_page.dart';
import 'package:proj_ver1/SettingsPage/components/terms_page.dart';
import 'package:proj_ver1/SettingsPage/components/security_page.dart';
import 'package:proj_ver1/constants.dart';
import 'package:proj_ver1/data/repository/models/user_model.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage(this.users, {Key? key}) : super(key: key);
  final Users users;

  static final bdecoration = BoxDecoration(
    border: Border.all(
        color: Colors.black.withAlpha(130), 
        style: BorderStyle.solid, width: 1
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.green.withOpacity(0.1),
        spreadRadius: 2,
        blurRadius: 10,
        blurStyle: BlurStyle.outer,
      )
    ],
    gradient: LinearGradient(
        colors: [Colors.green.withOpacity(0.3), Colors.grey.withOpacity(0.3)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter),
    borderRadius: BorderRadius.circular(10),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configuración"),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 4,
            child: Container(
              padding: EdgeInsets.all(20),
              color: Colors.white,
              child: ListView(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.21,
                          decoration: bdecoration,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(15),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                PageTransition(
                                  child: PrivacyPage(users),
                                  type: PageTransitionType.fade,
                                ),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.privacy_tip, size: 30),
                                space,
                                Text(
                                  "Privacidad",
                                  style: TextStyle(fontSize: 20),
                                  textAlign: TextAlign.center
                                )
                              ],
                            ),
                          ),
                        )
                      ),
                      space1,
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.21,
                          decoration: bdecoration,
                          padding: EdgeInsets.all(15),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                PageTransition(
                                  child: const SecurityPage(),
                                  type: PageTransitionType.fade,
                                ),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.security, size: 30),
                                space,
                                Text(
                                  "Seguridad",
                                  style: TextStyle(fontSize: 20),
                                  textAlign: TextAlign.center
                                )
                              ],
                            ),
                          ),
                        )
                      ),
                    ],
                  ),
                  space,
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.21,
                          decoration: bdecoration,
                          padding: EdgeInsets.all(15),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                PageTransition(
                                  child: const TermsPage(),
                                  type: PageTransitionType.fade,
                                ),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.document_scanner, size: 30),
                                space,
                                Text(
                                  "Términos y Condiciones",
                                  style: TextStyle(fontSize: 20),
                                  textAlign: TextAlign.center
                                )
                              ],
                            ),
                          ),
                        )
                      ),
                    ],
                  ),
                  space,
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.21,
                          decoration: bdecoration,
                          padding: EdgeInsets.all(15),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                PageTransition(
                                  child: const HelpPage(),
                                  type: PageTransitionType.fade,
                                ),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.help, size: 30),
                                space,
                                Text(
                                  "Ayuda",
                                  style: TextStyle(fontSize: 20),
                                  textAlign: TextAlign.center
                                )
                              ],
                            ),
                          ),
                        )
                      ),
                      space1,
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.21,
                          decoration: bdecoration,
                          padding: EdgeInsets.all(15),
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15)
                                    )
                                  ),
                                builder: (context) {
                                  return Padding(
                                    padding: EdgeInsets.all(25),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Acerca de UIS Wheels",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        doublespace,
                                        Image.asset("assets/images/llanta.png", height: 70),
                                        doublespace,
                                        Text(
                                          "UIS Wheels V1",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 15)
                                        )
                                      ]
                                    )
                                  );
                                }
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.info, size: 30),
                                space,
                                Text(
                                  "Acerca de UIS Wheels",
                                  style: TextStyle(fontSize: 20),
                                  textAlign: TextAlign.center
                                )
                              ],
                            ),
                          ),
                        )
                      ),
                    ],
                  ),
                  space,
                  Padding(
                    padding: EdgeInsets.only(left: 60, right: 60),
                    child: Container(
                      decoration: bdecoration,
                      padding: EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15)
                              )
                            ),
                            builder: (context) {
                              return Padding(
                                padding: EdgeInsets.all(25),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "¿Desea cerrar sesión?",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    doublespace,
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 8, right: 8),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                                              child: Text("CANCELAR")
                                            )
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 8, right: 8),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder:(context) => const LoginPage()
                                                  )
                                                );
                                              },
                                              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                                              child: Text("CERRAR SESIÓN"),
                                            )
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              );
                            }
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.logout, size: 30),
                            space1,
                            Text(
                              "Cerrar Sesión",
                              style: TextStyle(fontSize: 15),
                              textAlign: TextAlign.center
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ),
          ),
        ],
      ),
    );
  }
}
