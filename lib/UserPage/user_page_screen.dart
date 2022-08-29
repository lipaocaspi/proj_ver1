import 'package:flutter/material.dart';
import 'package:proj_ver1/LoginPage/login_page_screen.dart';
import 'package:proj_ver1/constants.dart';
import 'package:proj_ver1/responsive.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

class MobileUserPage extends StatefulWidget {
  const MobileUserPage({Key? key}) : super(key: key);

  @override
  MobileUserPageState createState() => MobileUserPageState();
}

class MobileUserPageState extends State<MobileUserPage> {
  DateTime date = DateTime.now();
  final toast = FToast();

  @override
  void initState() {
    super.initState();
    toast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    Widget saveToast() => Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color.fromARGB(255, 197, 197, 197),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.person, color: Colors.black87),
              SizedBox(width: 10.0),
              Text(
                'Se ha guardado exitosamente',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ],
          ),
        );

    Widget deleteToast() => Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color.fromARGB(255, 197, 197, 197),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.person, color: Colors.black87),
              SizedBox(width: 10.0),
              Text(
                'Se ha borrado exitosamente',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ],
          ),
        );

    void showCToast() => toast.showToast(
          child: saveToast(),
          gravity: ToastGravity.BOTTOM,
        );

    void showDToast() => toast.showToast(
          child: deleteToast(),
          gravity: ToastGravity.BOTTOM,
        );

    Future<String?> openDialogDelete() => showDialog<String>(
          context: context,
          builder: (context) => AlertDialog(
            title:
                const Text('Eliminar mi cuenta', textAlign: TextAlign.center),
            content: const Text(
              "¿Está seguro que desea eliminar su cuenta? Esta acción no se puede deshacer.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            actions: [
              TextButton(
                  child: const Text('CANCELAR'),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage()));
                    showDToast();
                  },
                  child: const Text('CONFIRMAR')
              ),
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
              TextButton(
                  onPressed: () {
                    showCToast();
                    Navigator.pop(context);
                  },
                  child: const Text('CONFIRMAR')),
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
                                  onPressed: () async {
                                    DateTime? newDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2100));
                                    if (newDate == null) return;
                                    setState(() => date = newDate);
                                  },
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
                                    controller: TextEditingController(text: '${date.day}/${date.month}/${date.year}'),
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
                        onPressed: () {
                          showCToast();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: kButtonPrimaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          fixedSize: const Size(100, 45),
                        ),
                        child: const Icon(Icons.save),
                      ),
                    ],
                  ))),
        ],
      ),
    );
  }
}
