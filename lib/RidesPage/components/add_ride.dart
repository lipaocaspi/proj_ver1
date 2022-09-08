import 'package:flutter/material.dart';
import 'package:proj_ver1/constants.dart';
import 'package:proj_ver1/responsive.dart';

class NewRidePage extends StatelessWidget {
  const NewRidePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: MobileNewRidePage(),
    );
  }
}

class MobileNewRidePage extends StatelessWidget {
  const MobileNewRidePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Nuevo Viaje")
      ),
    );
  }
}