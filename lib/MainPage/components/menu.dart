import 'package:flutter/material.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';

class Menu extends StatefulWidget {
  const Menu({
    Key? key,
  }) : super(key: key);

  @override
  MenuState createState() => MenuState();
}

class MenuState extends State<Menu> {
  PageController page = PageController();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SideMenu(
          style: SideMenuStyle(
            displayMode: SideMenuDisplayMode.auto,
            hoverColor: Colors.blue[100],
            selectedColor: Colors.lightBlue,
            selectedTitleTextStyle: const TextStyle(color: Colors.white),
            selectedIconColor: Colors.white,
          ),
          title: Column(
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 150,
                    maxWidth: 150,
                  ),
                  child: Image.asset(
                    'assets/images/llanta.png',
                  ),
                ),
                const Divider(
                  indent: 8.0,
                  endIndent: 8.0,
                ),
              ],
            ),
            footer: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'mohada',
                style: TextStyle(fontSize: 15),
              ),
            ),
          items: [
            SideMenuItem(
              priority: 0,
              title: 'Dashboard',
              onTap: () {
                page.jumpToPage(0);
              },
              icon: const Icon(Icons.home),
              badgeContent: const Text(
                '3',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SideMenuItem(
              priority: 1,
              title: 'JA',
              onTap: () {
                page.jumpToPage(1);
              },
              icon: const Icon(Icons.home),
            ),
          ],
          controller: page,
        ),
        Expanded(
          child: PageView(
            controller: page,
            children: [
              Container(
                color: Colors.white,
                child: const Center(
                  child: Text(
                    'Buenas',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: const Center(
                  child: Text(
                    'Hola',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
              ),
            ],
          )
        )
      ],
    );
    // return const Text("Holi");
  }
}
