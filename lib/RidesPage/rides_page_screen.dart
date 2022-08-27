import 'package:flutter/material.dart';
import 'package:proj_ver1/constants.dart';
import 'package:proj_ver1/responsive.dart';

class RidesPage extends StatelessWidget {
  const RidesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: MobileRidesPage(),
    );
  }
}

class MobileRidesPage extends StatelessWidget {
  const MobileRidesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Viajes Programados"),
        backgroundColor: kButtonPrimaryColor,
        foregroundColor: Colors.black,
      ),
    );
  }
}