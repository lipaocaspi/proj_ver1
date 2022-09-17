import 'package:flutter/material.dart';
import 'package:proj_ver1/responsive.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: MobileTermsPage(),
    );
  }
}

class MobileTermsPage extends StatelessWidget {
  const MobileTermsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Términos y Condiciones"),
      ),
      body: Column(
        children: const [
          Text("...")
        ]
      ),
    );
  }
}