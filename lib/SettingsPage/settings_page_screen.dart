import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configuración"),
        backgroundColor: kButtonPrimaryColor,
      ),
    );
  }
}