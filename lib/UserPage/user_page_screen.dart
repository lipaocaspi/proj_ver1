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
    Future<String?> openDialogDelete() => showDialog<String>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Eliminar mi cuenta',
                textAlign: TextAlign.center),
            content: const Text(
              "¿Está seguro que desea eliminar su cuenta? Esta acción no se puede deshacer.",
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                  child: const Text('CANCELAR'),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              TextButton(child: const Text('CONFIRMAR'), onPressed: () {}),
            ],
          ),
        );

    Future<String?> openDialogPassword() => showDialog<String>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Cambiar mi contraseña',
                textAlign: TextAlign.center),
            content: SizedBox(
              height: MediaQuery.of(context).size.height * 0.30,
              child: ListView(
                padding: const EdgeInsets.all(5),
                children: const [
                  Text(
                    "Ingrese la contraseña actual, seguida de la nueva.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  space,
                  space,
                  TextField(
                      obscureText: true,
                      decoration:
                          InputDecoration(hintText: "Contraseña actual")),
                  space,
                  TextField(
                      obscureText: true,
                      decoration:
                          InputDecoration(hintText: "Contraseña nueva")),
                ],
              ),
            ),
            actions: [
              TextButton(
                  child: const Text('CANCELAR'),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              TextButton(child: const Text('CONFIRMAR'), onPressed: () {}),
            ],
          ),
        );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mi perfil"),
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
                      Icon(Icons.drive_eta, color: Colors.black54),
                      space,
                      Icon(Icons.face, color: Colors.black54),
                      space,
                      Icon(Icons.star, color: Colors.black54),
                    ],
                  ))),
          Flexible(
              flex: 4,
              child: Container(
                  padding: const EdgeInsets.all(15),
                  color: Colors.white,
                  // child: Form(
                  child: ListView(
                    children: <Widget>[
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80'),
                      ),
                      space,
                      space,
                      TextField(
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: kButtonPrimaryColor))),
                        controller: TextEditingController(text: "Usuario"),
                      ),
                      space,
                      Row(
                        children: <Widget>[
                          Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: kButtonPrimaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    fixedSize: const Size(45, 45),
                                  ),
                                  child: const Icon(Icons.calendar_month),
                                ),
                              )),
                          Expanded(
                              flex: 3,
                              child: Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: TextField(
                                    textInputAction: TextInputAction.next,
                                    decoration: const InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: kButtonPrimaryColor))),
                                    controller: TextEditingController(
                                        text: "00/00/0000"),
                                  )))
                        ],
                      ),
                      space,
                      TextField(
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: kButtonPrimaryColor))),
                        controller: TextEditingController(text: "Correo"),
                      ),
                      space,
                      Row(
                        children: <Widget>[
                          Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    await openDialogPassword();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.grey,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    fixedSize: const Size(45, 45),
                                  ),
                                  child: const Text(
                                    "Cambiar mi contraseña",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    await openDialogDelete();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary:
                                        const Color.fromARGB(255, 255, 70, 57),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    fixedSize: const Size(45, 45),
                                  ),
                                  child: const Text("Eliminar mi cuenta",
                                      textAlign: TextAlign.center),
                                ),
                              ))
                        ],
                      ),
                      space,
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: kButtonPrimaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          fixedSize: const Size(100, 45),
                        ),
                        child: const Icon(Icons.save),
                      ),
                    ],
                  )
                  // )
                  )),
        ],
      ),
    );
  }
}
