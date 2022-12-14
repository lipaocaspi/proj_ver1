import 'package:flutter/material.dart';
import 'package:proj_ver1/FirstPage/components/image.dart';
import 'package:proj_ver1/FirstPage/components/signup_login_btn.dart';
import 'package:proj_ver1/components/background.dart';
import 'package:proj_ver1/data/repository/models/user_model.dart';
import 'package:proj_ver1/responsive.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Responsive(
            mobile: MobileFirstPage(),
          ),
        ),
      ),
    );
  }
}

class MobileFirstPage extends StatelessWidget {
  MobileFirstPage({Key? key}) : super(key: key);
  final List<Users> _users = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Imag(),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 6,
              child: LoginSignUpBtn(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
