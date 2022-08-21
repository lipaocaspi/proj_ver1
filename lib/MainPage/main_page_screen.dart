import 'package:flutter/material.dart';
import 'package:proj_ver1/MainPage/components/background.dart';
import 'package:proj_ver1/MainPage/components/menu.dart';
import 'package:proj_ver1/responsive.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Responsive(
            desktop: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [],
            ),
            mobile: const MobileMainPage(),
          ),
        ),
      ),
    );
  }
}

class MobileMainPage extends StatelessWidget {
  const MobileMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        Menu()
      ],
    );
  }
}
