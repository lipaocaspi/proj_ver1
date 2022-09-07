import 'package:flutter/material.dart';
import 'package:proj_ver1/ImboxPage/components/selected_message.dart';
import 'package:proj_ver1/responsive.dart';

class ImboxPage extends StatelessWidget {
  const ImboxPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: MobileImboxPage(),
    );
  }
}

class MobileImboxPage extends StatelessWidget {
  const MobileImboxPage({Key? key}) : super(key: key);
  static final bdecoration = BoxDecoration(
    color: Colors.grey.withOpacity(0.3),
  );

  static final greyBox = SizedBox(height: 1, child: Container(color: Colors.grey));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mensajes"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
      ),
      body: Row(
        children: [
          Flexible(
              flex: 4,
              child: Container(
                  color: Colors.white,
                  child: ListView(
                    children: [
                      Container(
                          decoration: bdecoration,
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.all(10),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const MessagePage()));
                            },
                            child: Column(
                              children: [
                                Row(
                                  children: const <Widget>[
                                    Expanded(
                                        // flex: 1,
                                        child: Padding(
                                          padding: EdgeInsets.all(3),
                                          child: CircleAvatar(
                                            radius: 25,
                                            backgroundImage: NetworkImage(
                                                'https://images.unsplash.com/photo-1661544641467-d1811f77c71e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=650&q=80'),
                                          ),
                                        )),
                                    Expanded(
                                        flex: 3,
                                        child: Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Text("NOMBRE"))),
                                    Expanded(child: Icon(Icons.arrow_right))
                                  ],
                                ),
                              ],
                            ),
                          )),
                      greyBox,
                      Container(
                          decoration: bdecoration,
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.all(10),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const MessagePage()));
                            },
                            child: Column(
                              children: [
                                Row(
                                  children: const <Widget>[
                                    Expanded(
                                        // flex: 1,
                                        child: Padding(
                                          padding: EdgeInsets.all(3),
                                          child: CircleAvatar(
                                            radius: 25,
                                            backgroundImage: NetworkImage(
                                                'https://images.unsplash.com/photo-1661544641467-d1811f77c71e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=650&q=80'),
                                          ),
                                        )),
                                    Expanded(
                                        flex: 3,
                                        child: Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Text("NOMBRE"))),
                                    Expanded(child: Icon(Icons.arrow_right))
                                  ],
                                ),
                              ],
                            ),
                          ))
                    ],
                  )),

                  ),
        ],
      ),
    );
  }
}
