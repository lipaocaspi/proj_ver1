import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:form_validator/form_validator.dart';
import 'package:proj_ver1/LoginPage/login_page_screen.dart';
import 'package:proj_ver1/constants.dart';
import 'package:proj_ver1/responsive.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: MobilePrivacyPage(),
    );
  }
}

class MobilePrivacyPage extends StatefulWidget {
  const MobilePrivacyPage({Key? key}) : super(key: key);

  @override
  MobilePrivacyPageState createState() => MobilePrivacyPageState();
}

class MobilePrivacyPageState extends State<MobilePrivacyPage> {
  static final bdecoration = BoxDecoration(
    color: Colors.grey.withOpacity(0.3),
  );

  static final whiteBox =
      SizedBox(height: 5, child: Container(color: Colors.white));

  // String newpassword = '';
  // String confnewpassword = '';
  // final _formKey = GlobalKey<FormState>();
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

    void showDToast() => toast.showToast(
          child: deleteToast(),
          gravity: ToastGravity.BOTTOM,
        );

    void showCToast() => toast.showToast(
          child: saveToast(),
          gravity: ToastGravity.BOTTOM,
        );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacidad"),
      ),
      body: Row(
        children: [
          Flexible(
              flex: 4,
              child: ListView(
                children: [
                  Container(
                      decoration: bdecoration,
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          showBarModalBottomSheet(
                              expand: true,
                              context: context,
                              builder: (context) {
                                return Form(
                                    // key: _formkey,
                                    child: Padding(
                                  padding: EdgeInsets.all(40),
                                  child: ListView(
                                    children: <Widget>[
                                      Text("Cambiar contraseña",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 23)),
                                      doublespace,
                                      Text(
                                        "Ingrese la contraseña actual, seguida de la nueva.",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      space,
                                      TextFormField(
                                        obscureText: true,
                                        textInputAction: TextInputAction.next,
                                        cursorColor: Colors.black,
                                        // validator: ValidationBuilder()
                                        //     .regExp(
                                        //         RegExp(
                                        //             r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}"),
                                        //         "Ingrese una contraseña válida")
                                        //     .build(),
                                        decoration: const InputDecoration(
                                            hintText: "Contraseña actual",
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Icon(Icons.lock),
                                            )),
                                      ),
                                      space,
                                      TextFormField(
                                        obscureText: true,
                                        textInputAction: TextInputAction.next,
                                        cursorColor: Colors.black,
                                        // onChanged: (value) {
                                        //   newpassword = value;
                                        // },
                                        // validator: ValidationBuilder()
                                        //     .regExp(
                                        //         RegExp(
                                        //             r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}"),
                                        //         "Ingrese una contraseña válida")
                                        //     .build(),
                                        decoration: const InputDecoration(
                                            hintText: "Contraseña nueva",
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Icon(Icons.lock),
                                            )),
                                      ),
                                      space,
                                      TextFormField(
                                        obscureText: true,
                                        textInputAction: TextInputAction.done,
                                        cursorColor: Colors.black,
                                        // validator: (value) {
                                        //   if (value != null && value.isEmpty) {
                                        //     return 'This field is required';
                                        //   }
                                        //   if (value != newpassword) {
                                        //     return "Las contraseñas no coinciden.";
                                        //   }
                                        // },
                                        decoration: const InputDecoration(
                                            hintText: "Confirme la contraseña",
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Icon(Icons.lock),
                                            )),
                                      ),
                                      doublespace,
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10, right: 10),
                                                child: ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            primary:
                                                                Colors.grey),
                                                    child: Icon(Icons.cancel))),
                                          ),
                                          Expanded(
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10, right: 10),
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    // final isValidForm =
                                                    //     _formKey.currentState!.validate();
                                                    // if (isValidForm) {
                                                    showCToast();
                                                    Navigator.pop(context);
                                                    // }
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          primary:
                                                              Colors.green),
                                                  child: Icon(Icons.save),
                                                )),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ));
                              });
                        },
                        child: Column(
                          children: [
                            Row(
                              children: const <Widget>[
                                Expanded(
                                    flex: 3,
                                    child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text("Cambiar contraseña"))),
                                Expanded(child: Icon(Icons.arrow_right))
                              ],
                            ),
                          ],
                        ),
                      )),
                  whiteBox,
                  Container(
                      decoration: bdecoration,
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15)
                                )
                              ),
                              builder: (context) {
                                return Padding (
                                  padding: EdgeInsets.all(25),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text("¿Está seguro que desea eliminar su cuenta? Esta acción no se puede deshacer.",
                                      style: TextStyle(
                                          fontSize: 20,
                                        ),),
                                      doublespace,
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10, right: 10),
                                                child: ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            primary:
                                                                Colors.grey),
                                                    child: Text("CANCELAR"))),
                                          ),
                                          Expanded(
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10, right: 10),
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context).push(MaterialPageRoute(
                                                      builder: (context) => const LoginPage()));
                                                    showDToast();
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          primary:
                                                              Colors.red),
                                                  child: Text("CONFIRMAR"),
                                                )),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                );
                              });
                        },
                        child: Column(
                          children: [
                            Row(
                              children: const <Widget>[
                                Expanded(
                                    flex: 3,
                                    child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text("Eliminar cuenta"))),
                                Expanded(child: Icon(Icons.arrow_right))
                              ],
                            ),
                          ],
                        ),
                      ))
                ],
              )),
        ],
      ),
    );
  }
}
