import 'package:flutter/material.dart';
import 'package:proj_ver1/FirstPage/first_page_screen.dart';
import 'package:proj_ver1/LoginPage/login_page_screen.dart';
import 'package:proj_ver1/constants.dart';
import 'package:proj_ver1/responsive.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: MobileMainPage(),
    );
  }
}

class MobileMainPage extends StatelessWidget {
  const MobileMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: NavigationDrawer(),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildItems(context),
            ],
          ),
        ),
      );

  Widget buildHeader(BuildContext context) {
    return Material(
      color: kPrimaryLightColor,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const FirstPage()));
        },
        child: Container(
          padding: EdgeInsets.only(
              top: 24 + MediaQuery.of(context).padding.top, bottom: 24),
          child: Column(
            children: const [
              CircleAvatar(
                radius: 52,
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80'),
              ),
              SizedBox(height: 12),
              Text("Lili", style: TextStyle(fontSize: 28))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildItems(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 16,
        children: [
          ListTile(
            leading: const Icon(Icons.home_filled),
            title: const Text("Home"),
            onTap: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const LoginPage()
              )
            )
          ),
        ],
      ),
    );
  }
}
