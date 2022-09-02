import 'package:flutter/material.dart';
import 'package:proj_ver1/SignupPage/signup_page_screen.dart';
import 'package:proj_ver1/constants.dart';
import 'package:page_transition/page_transition.dart';

class BtnBackLogin extends StatelessWidget {
  final Widget child;
  const BtnBackLogin({
    Key? key,
    required this.child,
    this.topButton = const Icon(Icons.person_add),
  }) : super(key: key);

  final Icon topButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        color: kBackgroundColor,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 25,
              right: 10,
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      PageTransition(
                        child: const SignUpPage(),
                        type: PageTransitionType.fade,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                  ),
                  child: topButton,
                ),
              ),
            ),
            SafeArea(child: child),
          ],
        ),
      ),
    );
  }
}