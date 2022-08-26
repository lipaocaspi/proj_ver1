import 'package:flutter/material.dart';
import 'package:proj_ver1/ImboxPage/imbox_page_screen.dart';
import 'package:proj_ver1/LoginPage/login_page_screen.dart';
import 'package:proj_ver1/RidesPage/rides_page_screen.dart';
import 'package:proj_ver1/SettingsPage/settings_page_screen.dart';
import 'package:proj_ver1/TutorialPage/tutorial_page_screen.dart';
import 'package:proj_ver1/UserPage/user_page_screen.dart';
import 'package:proj_ver1/UserRidesPage/user_rides_page_screen.dart';
import 'package:proj_ver1/constants.dart';
import 'package:proj_ver1/responsive.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: MobileMainPage(),
    );
  }
}

class MobileMainPage extends StatelessWidget {
  const MobileMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DEMO"),
        backgroundColor: kButtonPrimaryColor,
        foregroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const NavigationDrawer(),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildItems(context),
            ],
          ),
        ),
      );

  Widget buildHeader(BuildContext context) {
    return Material(
      color: kPrimaryLightColor,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const UserPage()));
        },
        child: Container(
          padding: EdgeInsets.only(
              top: 15 + MediaQuery.of(context).padding.top, bottom: 15),
          child: Column(
            children: const [
              CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80'),
              ),
              SizedBox(height: 10),
              Text("Usuario", style: TextStyle(fontSize: 18))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildItems(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Wrap(
        runSpacing: 10,
        children: [
          ListTile(
              leading: const Icon(Icons.car_rental),
              title: const Text("Mis Viajes"),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const UserRidesPage()));
              }),
          ListTile(
              leading: const Icon(Icons.alarm),
              title: const Text("Viajes Programados"),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RidesPage()));
              }),
          ListTile(
              leading: const Icon(Icons.email),
              title: const Text("Mensajes"),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ImboxPage()));
              }),
          ListTile(
              leading: const Icon(Icons.camera),
              title: const Text("Tutorial"),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const TutorialPage()));
              }),
          ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Configuración"),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SettingsPage()));
              }),
          ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Cerrar Sesión"),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LoginPage()));
              }),
        ],
      ),
    );
  }
}
