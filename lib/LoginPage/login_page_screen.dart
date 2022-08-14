import 'package:flutter/material.dart';
import 'package:proj_ver1/LoginPage/components/login_form.dart';
import 'package:proj_ver1/LoginPage/components/login_screen_image.dart';
import 'package:proj_ver1/components/background.dart';
import 'package:proj_ver1/responsive.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
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
              children: const [
                Expanded(
                  flex: 4,
                  child: ImagLog(),
                ),
              ],
            ),
            mobile: const MobileLoginPage(),
          ),
        ),
      ),
    );
  }
}

class MobileLoginPage extends StatelessWidget {
  const MobileLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const ImagLog(),
        Row(
          children: const[
            Spacer(),
            Expanded(
              flex: 6,
              child: LoginForm(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}