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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Viaje"),
      ),
      body: Column(
        children: const [
          Text("Aqui va un mapa y detalles del viaje...")
        ]
      ),
    );
  }
}