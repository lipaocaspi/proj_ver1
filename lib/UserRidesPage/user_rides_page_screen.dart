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
  static final bdecoration = BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.green.withOpacity(0.2),
        spreadRadius: 1,
        blurRadius: 8,
        blurStyle: BlurStyle.inner,
        offset: const Offset(0, 3))
    ],
    color: Colors.green,
    borderRadius: BorderRadius.circular(15),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mis viajes"),
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
                        decoration: bdecoration,
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: const [
                            Text("..."),
                            Text("..."),
                            Text("..."),
                          ],
                        ),
                      ),
                      space,
                      Container(
                        decoration: bdecoration,
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: const [
                            Text("..."),
                            Text("..."),
                            Text("..."),
                          ],
                        ),
                      ),
                      space,
                      Container(
                        decoration: bdecoration,
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: const [
                            Text("..."),
                            Text("..."),
                            Text("..."),
                          ],
                        ),
                      ),
                      space,
                      Container(
                        decoration: bdecoration,
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: const [
                            Text("..."),
                            Text("..."),
                            Text("..."),
                          ],
                        ),
                      ),
                      space,
                      Container(
                        decoration: bdecoration,
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: const [
                            Text("..."),
                            Text("..."),
                            Text("..."),
                          ],
                        ),
                      ),
                      space,
                      Container(
                        decoration: bdecoration,
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: const [
                            Text("..."),
                            Text("..."),
                            Text("..."),
                          ],
                        ),
                      ),
                      space,
                      Container(
                        decoration: bdecoration,
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: const [
                            Text("..."),
                            Text("..."),
                            Text("..."),
                          ],
                        ),
                      ),
                      space,
                      Container(
                        decoration: bdecoration,
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: const [
                            Text("..."),
                            Text("..."),
                            Text("..."),
                          ],
                        ),
                      ),
                    ],
                  ))),
        ],
      ),
    );
  }
}
