import 'package:flutter/material.dart';
import 'package:proj_ver1/FirstPage/components/image.dart';
import '../../responsive.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/background.dart';
import 'components/signup_login_btn.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Responsive(
            desktop: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Expanded(
                  child: Imag(),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 450,
                        child: LoginSignUpBtn(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            mobile: const MobileFirstPage(),
          ),
        ),
      ),
    ); // backgroundColor: kPrimaryColor;
  }
}

class MobileFirstPage extends StatelessWidget {
  const MobileFirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Imag(),
        Row(
          children: const[
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
