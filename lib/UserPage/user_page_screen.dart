import 'package:flutter/material.dart';
import 'package:proj_ver1/constants.dart';
import 'package:proj_ver1/responsive.dart';

class UserPage extends StatelessWidget {
  const UserPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: MobileUserPage(),
    );
  }
}

class MobileUserPage extends StatelessWidget {
  const MobileUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Usuario"),
        centerTitle: true,
        backgroundColor: kButtonPrimaryColor,
        foregroundColor: Colors.black,
        // iconTheme: const IconThemeData(color: Colors.white),
        // actions: [
        // IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
        // ],
      ),
      body: Row(
        // padding: const EdgeInsets.all(20),
        children: [
          Flexible(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(20),
              color: kButtonPrimaryLightColor,
              child: Column(
                children: const [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80'
                    ),
                  ),
                  Icon(Icons.drive_eta),
                  Icon(Icons.new_label),
                  Icon(Icons.star_rate),
                ],
              )
            )
          ),
          Flexible(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                children: [
                  TextField(
                    controller: TextEditingController(text: "Usuario"),
                  ),
                  space,
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(150, 45),
                            ),
                            child: const Icon(Icons.calendar_month),
                          ),
                        )
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: TextField(
                            controller: TextEditingController(text: "00/00/0000"),
                          )
                        )
                      )
                    ],
                  ),
                  space,
                  TextField(
                    controller: TextEditingController(text: "Correo"),
                  ),
                ],
              )
            )
          ),
        ],
      ),
    );
  }
}
