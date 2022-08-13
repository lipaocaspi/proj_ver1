import 'package:flutter/material.dart';
import 'package:proj_ver1/constants.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            decoration: const InputDecoration(
              hintText: "Correo",
              prefixIcon: Padding(
                padding: EdgeInsets.all(14),
                child: Icon(Icons.person),
              ),
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            decoration: const InputDecoration(
              hintText: "Correo",
              prefixIcon: Padding(
                padding: EdgeInsets.all(14),
                child: Icon(Icons.person),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
