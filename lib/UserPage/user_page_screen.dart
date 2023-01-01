import 'dart:convert';
import 'package:form_validator/form_validator.dart';
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
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerDate = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final _keyForm = GlobalKey<FormState>();

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
                                widget.users.icon),
                            backgroundColor: Colors.white,
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
                                child: Icon(Icons.motorcycle, size: 30)),
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
                          height: MediaQuery.of(context).size.height * 0.07),
                      Form(
                          key: _keyForm,
                          child: Column(
                            children: [
                              TextFormField(
                                textInputAction: TextInputAction.next,
                                controller: _controllerName
                                  ..text = widget.users.name,
                                validator: ValidationBuilder().build(),
                                onFieldSubmitted: (value) {
                                  setState(() {
                                    widget.users.name = _controllerName.text;
                                    updateUser(widget.users.id);
                                  });
                                },
                                decoration: const InputDecoration(
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Icon(Icons.person),
                                  ),
                                ),
                              ),
                              space,
                              TextFormField(
                                keyboardType: TextInputType.datetime,
                                textInputAction: TextInputAction.next,
                                controller: _controllerDate
                                  ..text = widget.users.dateOfBirth,
                                validator: ValidationBuilder().build(),
                                onFieldSubmitted: (value) {
                                  setState(() {
                                    widget.users.dateOfBirth =
                                        _controllerDate.text;
                                    updateUser(widget.users.id);
                                  });
                                },
                                decoration: const InputDecoration(
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Icon(Icons.calendar_month),
                                  ),
                                ),
                              ),
                              space,
                              TextFormField(
                                textInputAction: TextInputAction.done,
                                controller: _controllerEmail
                                  ..text = widget.users.email,
                                validator: ValidationBuilder().build(),
                                onFieldSubmitted: (value) {
                                  setState(() {
                                    widget.users.email = _controllerEmail.text;
                                    updateUser(widget.users.id);
                                  });
                                },
                                decoration: const InputDecoration(
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Icon(Icons.email),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ))),
        ],
      ),
    );
  }

  updateUser(id) async {
    http.put(Uri.parse("http://192.168.1.39:3000/users/$id"),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(<String, dynamic>{
      "id": widget.users.id,
      "name": widget.users.name,
      "dateOfBirth": widget.users.dateOfBirth,
      "email": widget.users.email,
      "icon": widget.users.icon,
      "password": widget.users.password
    }));
  }
}
