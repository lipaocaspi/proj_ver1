import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:proj_ver1/LoginPage/login_page_screen.dart';
import 'package:proj_ver1/constants.dart';

class BtnBackSign extends StatelessWidget {
  final Widget child;
  const BtnBackSign({
    Key? key,
    required this.child,
    this.topButton = const Icon(Icons.login, color: kButtonPrimaryLightColor),
    this.bottomImage = "assets/images/logo_UIS.png",
  }) : super(key: key);

  final Icon topButton;
  final String bottomImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        color: const Color.fromARGB(255, 150, 255, 141),
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
                    primary: kButtonPrimaryColor,
                    shape: const CircleBorder(),
                  ),
                  child: topButton,
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: Image.asset(
                bottomImage,
                width: 90,
              ),
            ),
            const Positioned(bottom: 20, left: 20, child: Text("© Derechos")),
            SafeArea(child: child),
          ],
        ),
      ),
    );
  }
}