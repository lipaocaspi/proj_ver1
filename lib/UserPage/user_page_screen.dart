import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:proj_ver1/LoginPage/login_page_screen.dart';
import 'package:proj_ver1/constants.dart';
import 'package:proj_ver1/responsive.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proj_ver1/variables.dart';

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
  static final indecoration = InputDecoration(
    filled: false,
  );
  String newpassword = '';
  String confnewpassword = '';
  final _formKey = GlobalKey<FormState>();
  final formKey = GlobalKey<FormState>();
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginPage()));
                    showDToast();
                  },
                  child: const Text('CONFIRMAR')),
            ],
          ),
        );

    Future<String?> openDialogPassword() => showDialog<String>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Cambiar mi contraseña',
                textAlign: TextAlign.center),
            content: SizedBox(
                height: MediaQuery.of(context).size.height * 0.40,
                child: Form(
                  key: formKey,
                  child: ListView(
                    padding: const EdgeInsets.all(5),
                    children: [
                      Text(
                        "Ingrese la contraseña actual, seguida de la nueva.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      space,
                      space,
                      TextFormField(
                          textInputAction: TextInputAction.next,
                          obscureText: true,
                          cursorColor: Colors.black,
                          validator: ValidationBuilder()
                              .regExp(
                                  RegExp(
                                      r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}"),
                                  "Ingrese una contraseña válida")
                              .build(),
                          decoration: InputDecoration(
                              hintText: "Contraseña actual",
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.grey)))),
                      space,
                      TextFormField(
                          textInputAction: TextInputAction.next,
                          obscureText: true,
                          cursorColor: Colors.black,
                          onChanged: (value) {
                            newpassword = value;
                          },
                          validator: ValidationBuilder()
                              .regExp(
                                  RegExp(
                                      r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}"),
                                  "Ingrese una contraseña válida")
                              .build(),
                          decoration: InputDecoration(
                              hintText: "Contraseña nueva",
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.grey)))),
                      space,
                      TextFormField(
                          textInputAction: TextInputAction.done,
                          obscureText: true,
                          cursorColor: Colors.black,
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return 'This field is required';
                            }
                            if (value != newpassword) {
                              return "Las contraseñas no coinciden.";
                            }
                          },
                          decoration: InputDecoration(
                              hintText: "Confirmar contraseña",
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.grey)))),
                    ],
                  ),
                )),
            actions: [
              TextButton(
                  child: const Text('CANCELAR'),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              TextButton(
                  onPressed: () {
                    final isValidForm = formKey.currentState!.validate();
                    if (isValidForm) {
                      showCToast();
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('CONFIRMAR')),
            ],
          ),
        );

    return Scaffold(
      body: Column(
        children: [
          // Flexible(
          // flex: 1,
          // child: Container(
          // padding: const EdgeInsets.all(20),
          // color: kButtonPrimaryLightColor,
          // child: ListView(
          // children: [
          // const Icon(Icons.drive_eta, color: Colors.black54),
          // const Icon(Icons.face, color: Colors.black54),
          // const Icon(Icons.star, color: Colors.black54),
          // ],
          // ))),
          Flexible(
              flex: 4,
              child: Container(
                  padding: EdgeInsets.all(10),
                  child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Form(
                          key: _formKey,
                          child: ListView(
                            children: <Widget>[
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(right: 5, bottom: 5),
                                      child: CircleAvatar(
                                        radius: 45,
                                        backgroundImage: NetworkImage(
                                            'https://images.unsplash.com/photo-1661544641467-d1811f77c71e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=650&q=80'),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextFormField(
                                              textInputAction:
                                                  TextInputAction.next,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                              cursorColor: Colors.black,
                                              validator: ValidationBuilder()
                                                  .maxLength(50,
                                                      'Número máximo de carácteres: 50')
                                                  .build(),
                                              decoration: indecoration,
                                              controller: TextEditingController(
                                                text: '${name}'),
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10),
                                                    child:
                                                        Icon(Icons.drive_eta)),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 5),
                                                    child:
                                                        Icon(Icons.motorcycle)),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 5),
                                                    child: Icon(Icons.star,
                                                        color: Colors.yellow))
                                              ],
                                            ),
                                          ],
                                        ),
                                      ))
                                ],
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.05),
                              Text(
                                "Fecha de Nacimiento",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            DateTime? newDate =
                                                await showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(1900),
                                                    lastDate: DateTime(2100));
                                            if (newDate == null) return;
                                            setState(() => date = newDate);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            fixedSize: const Size(45, 45),
                                          ),
                                          child:
                                              const Icon(Icons.calendar_month),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 2,
                                      child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: TextFormField(
                                            textInputAction:
                                                TextInputAction.next,
                                            cursorColor: Colors.black,
                                            validator: ValidationBuilder()
                                                .regExp(
                                                    RegExp(
                                                        r"^([0-9]|[1-2][0-9]|(3)[0-1])(\/)(([0-9])|((1)[0-2]))(\/)\d{4}"),
                                                    "Ingrese una fecha válida")
                                                .build(),
                                            decoration: indecoration,
                                            controller: TextEditingController(
                                                text:
                                                    '${date.day}/${date.month}/${date.year}'),
                                          )))
                                ],
                              ),
                              space,
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                cursorColor: Colors.black,
                                validator: (email) => email != null &&
                                        !EmailValidator.validate(email)
                                    ? 'Ingrese un correo válido'
                                    : null,
                                decoration: indecoration,
                                controller: TextEditingController(
                                  text: '${email}'),
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
                                            primary: const Color.fromARGB(
                                                255, 255, 70, 57),
                                            fixedSize: const Size(45, 45),
                                          ),
                                          child: const Text(
                                              "Eliminar mi cuenta",
                                              textAlign: TextAlign.center),
                                        ),
                                      ))
                                ],
                              ),
                              space,
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 50, right: 50, top: 10),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(250, 45)),
                                  onPressed: () {
                                    final isValidForm =
                                        _formKey.currentState!.validate();
                                    if (isValidForm) {
                                      showCToast();
                                    }
                                  },
                                  child: const Icon(Icons.save),
                                ),
                              ),
                            ],
                          ))))),
        ],
      ),
    );
  }
}
