import 'package:flutter/material.dart';
import 'package:proj_ver1/LoginPage/login_page_screen.dart';
import 'package:proj_ver1/UserPage/user_page_screen.dart';
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
    color: Colors.grey.withOpacity(0.2),
  );

  static final whiteBox = SizedBox(height: 20, child: Container(color: Colors.white));
  static final greyBox = SizedBox(height: 1, child: Container(color: Colors.grey));

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
        // actions: [
        // IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        // ],
      ),
      body: Row(
        children: [
          Flexible(
            flex: 4,
            child: Container(
                color: Colors.white,
                child: ListView(
                  children: [
                    whiteBox,
                    Container(
                        decoration: bdecoration,
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const UserPage()));
                          },
                          child: Column(
                            children: [
                              Row(
                                children: const <Widget>[
                                  Expanded(child: Icon(Icons.person)),
                                  Expanded(
                                      flex: 4,
                                      child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Text("Mi Perfil"))),
                                  Expanded(child: Icon(Icons.arrow_right))
                                ],
                              ),
                            ],
                          ),
                        )),
                    whiteBox,
                    Container(
                        decoration: bdecoration,
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          // onTap: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          // builder: (context) => const MessagePage()));
                          // },
                          child: Column(
                            children: [
                              Row(
                                children: const <Widget>[
                                  Expanded(child: Icon(Icons.privacy_tip)),
                                  Expanded(
                                      flex: 4,
                                      child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Text("Privacidad"))),
                                  Expanded(child: Icon(Icons.arrow_right))
                                ],
                              ),
                            ],
                          ),
                        )),
                    greyBox,
                    Container(
                        decoration: bdecoration,
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          // onTap: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          // builder: (context) => const MessagePage()));
                          // },
                          child: Column(
                            children: [
                              Row(
                                children: const <Widget>[
                                  Expanded(child: Icon(Icons.document_scanner)),
                                  Expanded(
                                      flex: 4,
                                      child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child:
                                              Text("Términos y Condiciones"))),
                                  Expanded(child: Icon(Icons.arrow_right))
                                ],
                              ),
                            ],
                          ),
                        )),
                    greyBox,
                    Container(
                        decoration: bdecoration,
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            openDialogAbout();
                          },
                          child: Column(
                            children: [
                              Row(
                                children: const <Widget>[
                                  Expanded(child: Icon(Icons.info)),
                                  Expanded(
                                      flex: 4,
                                      child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Text("Acerca de UIS Wheels"))),
                                  Expanded(child: Icon(Icons.arrow_right))
                                ],
                              ),
                            ],
                          ),
                        )),
                    whiteBox,
                    Container(
                        decoration: bdecoration,
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                          },
                          child: Column(
                            children: [
                              Row(
                                children: const <Widget>[
                                  Expanded(child: Icon(Icons.logout)),
                                  Expanded(
                                      flex: 4,
                                      child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Text("Cerrar Sesión"))),
                                ],
                              ),
                            ],
                          ),
                        ))
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
