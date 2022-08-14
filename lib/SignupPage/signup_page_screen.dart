import 'package:flutter/material.dart';
import 'package:proj_ver1/SignupPage/components/signup_form.dart';
import 'package:proj_ver1/SignupPage/components/signup_screen_image.dart';
import 'package:proj_ver1/components/background.dart';
import 'package:proj_ver1/responsive.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

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
            mobile: const MobileSignUpPage(),
          ),
        ),
      ),
    );
  }
}

class MobileSignUpPage extends StatelessWidget {
  const MobileSignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // const ImagLog(),
        Row(
          children: const[
            Spacer(),
            Expanded(
              flex: 6,
              child: SignUpForm(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}