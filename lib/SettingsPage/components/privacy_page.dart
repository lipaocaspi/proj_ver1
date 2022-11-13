import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:form_validator/form_validator.dart';
import 'package:proj_ver1/LoginPage/login_page_screen.dart';
import 'package:proj_ver1/constants.dart';
import 'package:proj_ver1/responsive.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:permission_handler/permission_handler.dart';

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
  Future<bool> requestLocationPermission() async {
    PermissionStatus resultLoc;
    if (isSwitchOnLoc == true) {
      resultLoc = await Permission.location.request();
      if (resultLoc.isGranted) {
        setState(() {
          isSwitchOnLoc = true;
        });
      } else if (resultLoc.isDenied) {
        setState(() {
          isSwitchOnLoc = false;
        });
      }
    }
    return true;
  }

  Future<bool> requestCameraPermission() async {
    var statusCam = await Permission.camera.status;
    PermissionStatus resultCam;
    if (isSwitchOnCam == true && statusCam.isDenied) {
      resultCam = await Permission.camera.request();
      if (resultCam.isGranted) {
        setState(() {
          isSwitchOnCam = true;
        });
      } else if (resultCam.isDenied) {
        setState(() {
          isSwitchOnCam = false;
        });
      }
    }
    return true;
  }

  Future<bool> deactivateCameraPermission() async {
    var statusCam = await Permission.camera.status;
    if (statusCam.isDenied) {
      setState(() {
        isSwitchOnCam = false;
      });
    }
    return false;
  }

  Future<bool> requestStoragePermission() async {
    var statusSto = await Permission.storage.status;
    PermissionStatus resultSto;
    if (isSwitchOnSto == true && statusSto.isDenied) {
      resultSto = await Permission.storage.request();
      if (resultSto.isGranted) {
      } else if (resultSto.isDenied) {
        setState(() {
          isSwitchOnSto = false;
        });
      }
    }
    return true;
  }

  Future<bool> deactivateStoragePermission() async {
    var statusSto = await Permission.storage.status;
    if (statusSto.isDenied) {
      setState(() {
        isSwitchOnSto = false;
      });
    }
    return false;
  }

  bool isSwitchOnLoc = false;
  bool isSwitchOnCam = false;
  bool isSwitchOnSto = false;
  bool isSwitchOnTex = false;
  bool isSwitchOnEma = false;
  bool isSwitchOnDev = true;
  static final bdecoration = BoxDecoration(
    color: Colors.grey.withOpacity(0.1),
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
      body: Column(
        children: [
          Flexible(
              // flex: 4,
              child: ListView(
            children: [
              Container(
                decoration: bdecoration,
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: const <Widget>[
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Icon(Icons.perm_device_info),
                        )),
                        Expanded(
                            flex: 5,
                            child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text("Permisos del sistema"))),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Icon(Icons.place),
                        )),
                        Expanded(
                            flex: 3,
                            child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text("Ubicación"))),
                        Expanded(
                            child: FlutterSwitch(
                          value: isSwitchOnLoc,
                          activeColor: Colors.green,
                          onToggle: (value) {
                            setState(() {
                              isSwitchOnLoc = true;
                            });
                            if (isSwitchOnLoc == true) {
                              requestLocationPermission();
                            }
                            ;
                          },
                        ))
                      ],
                    ),
                    space,
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Icon(Icons.camera_alt),
                        )),
                        Expanded(
                            flex: 3,
                            child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text("Cámara"))),
                        Expanded(
                            child: FlutterSwitch(
                          value: isSwitchOnCam,
                          activeColor: Colors.green,
                          onToggle: (value) {
                            setState(() {
                              isSwitchOnCam = true;
                            });
                            if (isSwitchOnCam == true) {
                              requestCameraPermission();
                            }
                            ;
                          },
                        ))
                      ],
                    ),
                    space,
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Icon(Icons.folder),
                        )),
                        Expanded(
                            flex: 3,
                            child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text("Almacenamiento"))),
                        Expanded(
                            child: FlutterSwitch(
                          value: isSwitchOnSto,
                          activeColor: Colors.green,
                          onToggle: (value) {
                            setState(() {
                              isSwitchOnSto = true;
                            });
                            if (isSwitchOnSto == true) {
                              requestStoragePermission();
                            }
                            ;
                          },
                        ))
                      ],
                    ),
                  ],
                ),
              ),
              // Container(
              //   decoration: bdecoration,
              //   alignment: Alignment.topLeft,
              //   padding: const EdgeInsets.all(10),
              //   child: Column(
              //     children: [
              //       Row(
              //         children: const <Widget>[
              //           Expanded(
              //               child: Padding(
              //             padding: EdgeInsets.all(5),
              //             child: Icon(Icons.notification_important),
              //           )),
              //           Expanded(
              //               flex: 5,
              //               child: Padding(
              //                   padding: EdgeInsets.all(10),
              //                   child: Text("Notificaciones"))),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              // Container(
              //   alignment: Alignment.topLeft,
              //   padding: const EdgeInsets.all(15),
              //   child: Column(
              //     children: [
              //       Row(
              //         children: <Widget>[
              //           Expanded(
              //               child: Padding(
              //             padding: EdgeInsets.all(5),
              //             child: Icon(Icons.chat),
              //           )),
              //           Expanded(
              //               flex: 3,
              //               child: Padding(
              //                   padding: EdgeInsets.all(10),
              //                   child: Text("Mensajes de texto"))),
              //           Expanded(
              //               child: FlutterSwitch(
              //             value: isSwitchOnTex,
              //             activeColor: Colors.green,
              //             onToggle: (value) {
              //               setState(() {
              //                 isSwitchOnTex = value;
              //               });
              //             },
              //           ))
              //         ],
              //       ),
              //       space,
              //       Row(
              //         children: <Widget>[
              //           Expanded(
              //               child: Padding(
              //             padding: EdgeInsets.all(5),
              //             child: Icon(Icons.email),
              //           )),
              //           Expanded(
              //               flex: 3,
              //               child: Padding(
              //                   padding: EdgeInsets.all(10),
              //                   child: Text("Correo electrónico"))),
              //           Expanded(
              //               child: FlutterSwitch(
              //             value: isSwitchOnEma,
              //             activeColor: Colors.green,
              //             onToggle: (value) {
              //               setState(() {
              //                 isSwitchOnEma = value;
              //               });
              //             },
              //           ))
              //         ],
              //       ),
              //       space,
              //       Row(
              //         children: <Widget>[
              //           Expanded(
              //               child: Padding(
              //             padding: EdgeInsets.all(5),
              //             child: Icon(Icons.phone_android),
              //           )),
              //           Expanded(
              //               flex: 3,
              //               child: Padding(
              //                   padding: EdgeInsets.all(10),
              //                   child: Text("Dispositivo"))),
              //           Expanded(
              //               child: FlutterSwitch(
              //             value: isSwitchOnDev,
              //             activeColor: Colors.green,
              //             onToggle: (value) {
              //               setState(() {
              //                 isSwitchOnDev = value;
              //               });
              //             },
              //           ))
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
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
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.grey),
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
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.green),
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
                                child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Icon(Icons.password),
                            )),
                            Expanded(
                                flex: 5,
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text("Cambiar contraseña"))),
                            Expanded(
                                child: Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.grey,
                            ))
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
                      showBarModalBottomSheet(
                          context: context,
                          // shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.only(
                          //         topLeft: Radius.circular(15),
                          //         topRight: Radius.circular(15))),
                          builder: (context) {
                            return Padding(
                                padding: EdgeInsets.all(40),
                                child: Column(
                                  // mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "¿Está seguro que desea eliminar su cuenta? Esta acción no se puede deshacer.",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    doublespace,
                                    Text(
                                      "Ingrese la contraseña para confirmar.",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                    doublespace,
                                    TextFormField(
                                      obscureText: true,
                                      textInputAction: TextInputAction.next,
                                      cursorColor: Colors.black,
                                      decoration: const InputDecoration(
                                          hintText: "Contraseña",
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          primary: Colors.grey),
                                                  child: Text("CANCELAR"))),
                                        ),
                                        Expanded(
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10, right: 10),
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const LoginPage()));
                                                  showDToast();
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.red),
                                                child: Text("CONFIRMAR"),
                                              )),
                                        )
                                      ],
                                    ),
                                  ],
                                ));
                          });
                    },
                    child: Column(
                      children: [
                        Row(
                          children: const <Widget>[
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Icon(Icons.delete_forever),
                            )),
                            Expanded(
                                flex: 5,
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text("Eliminar cuenta"))),
                            Expanded(
                                child: Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.grey,
                            ))
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
