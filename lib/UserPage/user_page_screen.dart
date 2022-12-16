import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:proj_ver1/constants.dart';
import 'package:proj_ver1/data/repository/models/user_model.dart';

class UserPage extends StatefulWidget {
  UserPage(this.users, {Key? key}) : super(key: key);
  final Users users;

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  static final icondecoration = BoxDecoration(
      border: Border.all(
        width: 1,
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.all(Radius.circular(50)),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          offset: Offset(2, 4),
          color: Colors.black.withOpacity(0.3),
          blurRadius: 3,
        )
      ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mi Perfil"),
      ),
      body: Column(
        children: [
          Flexible(
              flex: 4,
              child: Container(
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, left: 30, right: 30),
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04),
                      Stack(alignment: Alignment.center, children: [
                        CircleAvatar(
                          radius: 57,
                          backgroundColor: Colors.black,
                          child: CircleAvatar(
                            radius: 55,
                            backgroundImage: NetworkImage(
                                'https://images.unsplash.com/photo-1661544641467-d1811f77c71e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=650&q=80'),
                          ),
                        ),
                        Positioned(
                            right: MediaQuery.of(context).size.width * 0.25,
                            bottom: 5,
                            child: InkWell(
                                onTap: () {},
                                child: Container(
                                  child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: Icon(Icons.edit, size: 20)),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 3,
                                        color: Colors.white,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(2, 4),
                                          color: Colors.black.withOpacity(0.3),
                                          blurRadius: 3,
                                        )
                                      ]),
                                )))
                      ]),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: Icon(Icons.drive_eta, size: 30)),
                            decoration: icondecoration,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.06),
                          Container(
                            child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: Icon(Icons.face, size: 30)),
                            decoration: icondecoration,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.06),
                          Container(
                            child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: Icon(Icons.star, size: 30)),
                            decoration: icondecoration,
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04),
                      TextFormField(
                        initialValue: widget.users.name,
                        onChanged: (value) {
                          setState(() {
                            widget.users.name = value;
                          });
                        },
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.person),
                          ),
                        ),
                      ),
                      space,
                      TextFormField(
                        initialValue: widget.users.dateOfBirth,
                        onChanged: (value) {
                          setState(() {
                            widget.users.dateOfBirth = value;
                          });
                        },
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.calendar_month),
                          ),
                        ),
                      ),
                      space,
                      TextFormField(
                        initialValue: widget.users.email,
                        onChanged: (value) {
                          setState(() {
                            widget.users.email = value;
                          });
                        },
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.email),
                          ),
                        ),
                      ),
                      space,
                      Padding(
                        padding: EdgeInsets.only(left: 50, right: 50),
                        child: ElevatedButton(
                          onPressed: () {
                            updateUser(widget.users.id);
                            final SavedSnack = SnackBar(
                              content: Text(
                                "Se ha actualizado la información"),
                              action: SnackBarAction(
                                label: 'Cerrar',
                                onPressed: () {
                                  Navigator.of(context);
                                },
                              )
                            );
                            ScaffoldMessenger.of(context)
                              .showSnackBar(SavedSnack);
                          },
                          child: Icon(Icons.save),
                        ),
                      )
                    ],
                  ))),
        ],
      ),
    );
  }

  updateUser(id) async {
      final response = await http.put(
          Uri.parse(
              "https://mockend.com/lipaocaspi/demo_server_json/users/$id"),
          body: jsonEncode(<String, String>{
            "name": widget.users.name,
            "email": widget.users.email,
            "dateOfBirth": widget.users.dateOfBirth
          }));
      print(response.statusCode);
      print(response.body);
  }
}
