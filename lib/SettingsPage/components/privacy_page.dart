import 'package:flutter/material.dart';
import 'package:proj_ver1/LoginPage/login_page_screen.dart';
// import 'package:proj_ver1/TutorialPage/tutorial_page_screen.dart';
import 'package:proj_ver1/constants.dart';
import 'package:proj_ver1/responsive.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: MobilePrivacyPage(),
    );
  }
}

class MobilePrivacyPage extends StatelessWidget {
  const MobilePrivacyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacidad"),
      ),
      body: Column(
        children: const [
          Text("...")
        ]
      ),
    );
  }
}
