import 'package:flutter/material.dart';
import 'package:proj_ver1/responsive.dart';

class RidePage extends StatelessWidget {
  const RidePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: MobileRidePage(),
    );
  }
}

class MobileRidePage extends StatelessWidget {
  const MobileRidePage({Key? key}) : super(key: key);
  static final bdecoration = BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.green.withOpacity(0.2),
        spreadRadius: 1,
        blurRadius: 8,
        blurStyle: BlurStyle.inner,
        offset: const Offset(0, 3))
    ],
    color: Colors.grey.withOpacity(0.7),
    borderRadius: BorderRadius.circular(15),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Row(

      ),
    );
  }
}