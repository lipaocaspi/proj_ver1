import 'package:flutter/material.dart';
import 'package:proj_ver1/constants.dart';
import 'package:page_transition/page_transition.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
    this.topButtonRight = const Icon(Icons.person, color: kButtonPrimaryLightColor),
    this.topButtonLeft = const Icon(Icons.list, color: kButtonPrimaryLightColor),
  }) : super(key: key);

  final Icon topButtonRight, topButtonLeft;

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
                    
                  },
                  style: ElevatedButton.styleFrom(
                    primary: kButtonPrimaryColor,
                    shape: const CircleBorder(),
                  ),
                  child: topButtonRight,
                ),
              ),
            ),
            Positioned(
              top: 25,
              left: 10,
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    
                  },
                  style: ElevatedButton.styleFrom(
                    primary: kButtonPrimaryColor,
                    shape: const CircleBorder(),
                  ),
                  child: topButtonLeft,
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