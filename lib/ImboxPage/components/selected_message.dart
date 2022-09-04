import 'package:flutter/material.dart';
import 'package:proj_ver1/responsive.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: MobileMessagePage(),
    );
  }
}

class MobileMessagePage extends StatelessWidget {
  const MobileMessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NOMBRE"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
        ],
      ),
      body: Column(
        children: const [
          Text("Aqui va el chat...")
        ]
      ),
    );
  }
}