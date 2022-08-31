import 'package:flutter/material.dart';
import 'package:proj_ver1/constants.dart';
import 'package:proj_ver1/responsive.dart';

class UserRidesPage extends StatelessWidget {
  const UserRidesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: MobileUserRidesPage(),
    );
  }
}

class MobileUserRidesPage extends StatelessWidget {
  const MobileUserRidesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mis viajes"),
        centerTitle: true,
        backgroundColor: kButtonPrimaryColor,
        foregroundColor: Colors.black,
        // iconTheme: const IconThemeData(color: Colors.white),
        // actions: [
        // IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
        // ],
      ),
      body: Row(
        children: [
          Flexible(
              flex: 4,
              child: Container(
                  padding: const EdgeInsets.all(15),
                  color: Colors.white,
                  child: ListView(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        color: Colors.green,
                        child: Column(
                          children: const [
                            Text("Hola")
                          ],
                        ),
                      )
                    ],
                  ))),
        ],
      ),
    );
  }
}