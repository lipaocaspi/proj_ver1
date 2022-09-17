import 'package:flutter/material.dart';
import 'package:proj_ver1/responsive.dart';

class SecurityPage extends StatelessWidget {
  const SecurityPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: MobileSecurityPage(),
    );
  }
}

class MobileSecurityPage extends StatelessWidget {
  const MobileSecurityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Seguridad"),
      ),
      body: Column(
        children: const [
          Text("...")
        ]
      ),
    );
  }
}