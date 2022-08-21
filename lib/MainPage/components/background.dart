import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
    // this.topButtonRight = const Icon(Icons.person, color: kButtonPrimaryLightColor),
    // this.topButtonLeft = const Icon(Icons.list, color: kButtonPrimaryLightColor),
  }) : super(key: key);

  // final Icon topButtonRight;

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
        ),
      ),
    );
  }
}