import 'package:flutter/material.dart';
import 'package:proj_ver1/constants.dart';
import 'package:proj_ver1/responsive.dart';

class UserPage extends StatelessWidget {
  const UserPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: MobileUserPage(),
    );
  }
}

class MobileUserPage extends StatelessWidget {
  const MobileUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Usuario"),
        backgroundColor: kButtonPrimaryColor,
        foregroundColor: Colors.black,
        // iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
        ],
      ),
      // body: const Text("Usuario"),
    );
  }
}
