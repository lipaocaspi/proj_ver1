import 'package:flutter/material.dart';
import 'package:proj_ver1/RidesPage/rides_page_screen.dart';
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

class MobileMainPage extends StatefulWidget {
  const MobileMainPage({Key? key}) : super(key: key);

  @override
  State<MobileMainPage> createState() => MobileMainPageState();
}

class MobileMainPageState extends State<MobileMainPage> {
  int indexSelected = 0;
  @override
  Widget build(BuildContext context) {
    final children = [
      const RidesPage(),
      const UserRidesPage(),
      const UserPage()
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(indexSelected == 2 ? "Mi Perfil" : "Viajes"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(indexSelected == 0 ? Icons.search : null))
        ],
      ),
      // drawer: const NavigationDrawer(),
      body: children[indexSelected],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kPrimaryColor,
        fixedColor: Colors.black,
        currentIndex: indexSelected,
        onTap: (index) => setState(() {
          indexSelected = index;
        }),
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined), label: "Viajes"),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.drive_eta),
              icon: Icon(Icons.drive_eta_outlined), label: "Mis Viajes"),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.person),
              icon: Icon(Icons.person_outline), label: "Perfil")
        ],
      ),
    );
  }
}

// class NavigationDrawer extends StatelessWidget {
  // const NavigationDrawer({Key? key}) : super(key: key);
  // @override
  // Widget build(BuildContext context) => Drawer(
        // shape: const RoundedRectangleBorder(
            // borderRadius: BorderRadius.horizontal(right: Radius.circular(30))),
        // backgroundColor: Colors.white,
        // child: SingleChildScrollView(
          // child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            // children: <Widget>[
              // buildHeader(context),
              // buildItems(context),
            // ],
          // ),
        // ),
      // );

  // Widget buildHeader(BuildContext context) {
    // return Material(
      // color: Colors.white,
      // child: InkWell(
        // onTap: () {
          // Navigator.pop(context);
          // Navigator.of(context)
              // .push(MaterialPageRoute(builder: (context) => const UserPage()));
        // },
        // child: Container(
          // decoration: BoxDecoration(
              // gradient: const LinearGradient(
                  // begin: Alignment.topRight,
                  // end: Alignment.bottomCenter,
                  // colors: [
                    // kPrimaryColor,
                    // Color.fromARGB(255, 232, 248, 231)
                  // ]),
              // color: kPrimaryLightColor,
              // border: Border.all(width: 1, color: kPrimaryLightColor),
              // borderRadius:
                  // const BorderRadius.only(bottomRight: Radius.circular(30))),
          // padding: EdgeInsets.only(
              // top: 15 + MediaQuery.of(context).padding.top,
              // bottom: 30,
              // left: 30),
          // child: Row(
            // children: const <Widget>[
              // Expanded(
                // flex: 1,
                // child: Align(
                // alignment: Alignment.center,
                // child: Text("Liliana Paola Castellanos Pinzón",
                    // style:
                        // TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                // ),
              // ),
              // Expanded(
                // child: Align(
                // alignment: Alignment.centerRight,
                // child: CircleAvatar(
                  // radius: 30,
                  // backgroundImage: NetworkImage(
                      // 'https://images.unsplash.com/photo-1661544641467-d1811f77c71e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=650&q=80'),
                // ),
                // )
              // ),
            // ],
          // ),
        // ),
      // ),
    // );
  // }

  // Widget buildItems(BuildContext context) {
    // return Container(
      // padding: const EdgeInsets.only(top: 30, left: 20, right: 15, bottom: 30),
      // child: Wrap(
        // runSpacing: 8,
        // children: [
          // ListTile(
          // leading: const Icon(Icons.drive_eta, color: Colors.black87),
          // title: const Text("Mis Viajes"),
          // onTap: () {
          // Navigator.pop(context);
          // Navigator.of(context).push(MaterialPageRoute(
          // builder: (context) => const UserRidesPage()));
          // }),
          // ListTile(
          // leading: const Icon(Icons.alarm, color: Colors.black87),
          // title: const Text("Viajes Programados"),
          // onTap: () {
          // Navigator.pop(context);
          // Navigator.of(context).push(
          // MaterialPageRoute(builder: (context) => const RidesPage()));
          // }),
          // ListTile(
              // leading: const Icon(Icons.email, color: Colors.black87),
              // title: const Text("Mensajes"),
              // onTap: () {
                // Navigator.pop(context);
                // Navigator.of(context).push(
                    // MaterialPageRoute(builder: (context) => const ImboxPage()));
              // }),
          // ListTile(
              // leading: const Icon(Icons.camera, color: Colors.black87),
              // title: const Text("Tutorial"),
              // onTap: () {
                // Navigator.pop(context);
                // Navigator.of(context).push(MaterialPageRoute(
                // builder: (context) => const TutorialPage()));
              // }),
          // ListTile(
              // leading: const Icon(Icons.settings, color: Colors.black87),
              // title: const Text("Configuración"),
              // onTap: () {
                // Navigator.pop(context);
                // Navigator.of(context).push(MaterialPageRoute(
                    // builder: (context) => const SettingsPage()));
              // }),
        // ],
      // ),
    // );
  // }
// }
