import 'package:flutter/material.dart';
import 'package:proj_ver1/responsive.dart';

class ImboxPage extends StatelessWidget {
  const ImboxPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: MobileImboxPage(),
    );
  }
}

class MobileImboxPage extends StatelessWidget {
  const MobileImboxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mensajes"),
      ),
    );
  }
}