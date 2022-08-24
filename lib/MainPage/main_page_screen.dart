import 'package:flutter/material.dart';
import 'package:proj_ver1/MainPage/components/menu.dart';
import 'package:proj_ver1/responsive.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      // height: MediaQuery.of(context).size.height,
      // desktop: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        // children: const [
          // Menu(),
        // ],
      // ),
      mobile: MobileMainPage(),
    );
  }
}

class MobileMainPage extends StatelessWidget {
  const MobileMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Menu(),
      // mainAxisAlignment: MainAxisAlignment.start,
    );
  }
}
