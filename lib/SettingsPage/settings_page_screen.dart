import 'package:flutter/material.dart';
import 'package:proj_ver1/LoginPage/login_page_screen.dart';
import 'package:proj_ver1/SettingsPage/components/help_page.dart';
import 'package:proj_ver1/SettingsPage/components/privacy_page.dart';
import 'package:proj_ver1/SettingsPage/components/security_page.dart';
import 'package:proj_ver1/SettingsPage/components/terms_page.dart';
import 'package:proj_ver1/constants.dart';
import 'package:proj_ver1/responsive.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: MobileSettingsPage(),
    );
  }
}

class MobileSettingsPage extends StatelessWidget {
  const MobileSettingsPage({Key? key}) : super(key: key);

  static final bdecoration = BoxDecoration(
    border: Border.all(color: Colors.black.withAlpha(130), style: BorderStyle.solid, width: 1),
    boxShadow: [
      BoxShadow(
          color: Colors.green.withOpacity(0.1),
          spreadRadius: 2,
          blurRadius: 10,
          blurStyle: BlurStyle.outer,
      )
    ],
    // color: Colors.grey.withOpacity(0.1),
    gradient: LinearGradient(
      colors: [Colors.green.withOpacity(0.3), Colors.grey.withOpacity(0.3)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter
    ),
    borderRadius: BorderRadius.circular(10),
  );

  @override
  Widget build(BuildContext context) {
    Future<String?> openDialogAbout() => showDialog<String>(
          context: context,
          builder: (context) => AlertDialog(
            title:
                const Text('Acerca de UIS Wheels', textAlign: TextAlign.center),
            content: SizedBox(
              height: MediaQuery.of(context).size.height * 0.17,
              child: ListView(
                children: [
                  Image.asset(
                    "assets/images/llanta.png",
                    height: 70,
                  ),
                  space,
                  const Text("UIS Wheels V1",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                      ))
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('CERRAR')),
            ],
          ),
        );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Configuración"),
      ),
      body: Row(
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
                              height: MediaQuery.of(context).size.height*0.21,
                              decoration: bdecoration,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(15),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const PrivacyPage()));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.privacy_tip, size: 30),
                                space,
                                Text("Privacidad", style: TextStyle(fontSize: 20), textAlign: TextAlign.center)
                              ],
                            ),
                          ),
                        )),
                        space1,
                        Expanded(
                            child: Container(
                              height: MediaQuery.of(context).size.height*0.21,
                              decoration: bdecoration,
                          // alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(15),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SecurityPage()));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.security, size: 30),
                                space,
                                Text("Seguridad", style: TextStyle(fontSize: 20), textAlign: TextAlign.center)
                              ],
                            ),
                          ),
                        )),
                      ],
                    ),
                    space,
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                              height: MediaQuery.of(context).size.height*0.21,
                              decoration: bdecoration,
                          // alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(15),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const TermsPage()));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.document_scanner, size: 30),
                                space,
                                Text("Términos y Condiciones", style: TextStyle(fontSize: 20), textAlign: TextAlign.center)
                              ],
                            ),
                          ),
                        )),
                      ],
                    ),
                    space,
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                              height: MediaQuery.of(context).size.height*0.21,
                              decoration: bdecoration,
                          // alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(15),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HelpPage()));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.help, size: 30),
                                space,
                                Text("Ayuda", style: TextStyle(fontSize: 20), textAlign: TextAlign.center)
                              ],
                            ),
                          ),
                        )),
                        space1,
                        Expanded(
                            child: Container(
                              height: MediaQuery.of(context).size.height*0.21,
                              decoration: bdecoration,
                          // alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(15),
                          child: InkWell(
                            onTap: () {
                              openDialogAbout();
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.info, size: 30),
                                space,
                                Text("Acerca de UIS Wheels", style: TextStyle(fontSize: 20), textAlign: TextAlign.center)
                              ],
                            ),
                          ),
                        )),
                      ],
                    ),
                    space,
                    Padding(
                      padding: EdgeInsets.only(left: 60, right: 60),
                      child: Container(
                        // height: 130,
                        // width: 130,
                        decoration: bdecoration,
                        // alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.logout, size: 30),
                              space1,
                              Text("Cerrar Sesión", style: TextStyle(fontSize: 15), textAlign: TextAlign.center)
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
