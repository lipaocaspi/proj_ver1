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
        title: const Text("Mis Viajes"),
        backgroundColor: kButtonPrimaryColor,
      ),
      // body: Text("Viajes Usuario"),
    );
  }
}