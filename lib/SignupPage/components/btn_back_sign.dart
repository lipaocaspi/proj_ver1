import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:proj_ver1/LoginPage/login_page_screen.dart';
import 'package:proj_ver1/constants.dart';

class BtnBackSign extends StatelessWidget {
  final Widget child;
  const BtnBackSign({
    Key? key,
    required this.child,
    this.topButton = const Icon(Icons.login),
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
                        child: const LoginPage(),
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