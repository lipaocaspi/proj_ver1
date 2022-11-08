import 'package:flutter/material.dart';
import 'package:proj_ver1/MainPage/main_page_screen.dart';
import 'package:proj_ver1/RidesPage/rides_page_screen.dart';
// import 'package:form_validator/form_validator.dart';
import 'package:proj_ver1/constants.dart';
import 'package:proj_ver1/responsive.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proj_ver1/variables.dart';

class NewRidePage extends StatelessWidget {
  const NewRidePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: MobileNewRidePage(),
    );
  }
}

class MobileNewRidePage extends StatefulWidget {
  const MobileNewRidePage({Key? key}) : super(key: key);
  @override
  MobileNewRidePageState createState() => MobileNewRidePageState();
}

class MobileNewRidePageState extends State<MobileNewRidePage> {
  DateTime dateTime = DateTime.now();
  // final formKey = GlobalKey<FormState>();

  Future pickDateTime() async {
    DateTime? date = await pickDate();
    if (date == null) return;

    TimeOfDay? time = await pickTime();
    if (time == null) return;

    final dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    setState(() => this.dateTime = dateTime);
  }

  Future<DateTime?> pickDate() => showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
      );

  Future<TimeOfDay?> pickTime() => showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
      );

  final vehicle = ["Automóvil", "Motocicleta"];

  String? value1;

  DropdownMenuItem<String> buildMenuVehicle(String vehicle) => DropdownMenuItem(
        value: vehicle,
        child: Text(
          vehicle,
          style: const TextStyle(fontSize: 15),
        ),
      );

  Future<String?> openDialogExit() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Salir', textAlign: TextAlign.center),
          content: const Text(
            "¿Está seguro que desea salir? No se guardarán los cambios.",
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
                      builder: (context) => const MainPage()));
                },
                child: const Text('SALIR')),
          ],
        ),
      );

  final toast = FToast();

  @override
  void initState() {
    super.initState();
    toast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');
    Widget saveToast() => Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color.fromARGB(255, 197, 197, 197),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.drive_eta, color: Colors.black87),
              SizedBox(width: 10.0),
              Text(
                'Se ha guardado exitosamente',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ],
          ),
        );

    void showSToast() => toast.showToast(
          child: saveToast(),
          gravity: ToastGravity.BOTTOM,
        );

    return Scaffold(
        appBar: AppBar(
          title: const Text("Nuevo Viaje"),
          leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () async {
              await openDialogExit();
            },
          ),
          actions: [
            IconButton(
                onPressed: () {
                  // final isValidForm =
                  // formKey.currentState!.validate();
                  // if (isValidForm) {
                  showSToast();
                  Navigator.of(context).pop();
                },
                // },
                icon: Icon(Icons.check))
          ],
        ),
        body: Container(
            padding: const EdgeInsets.all(15),
            child: Form(
                // key: formKey,
                child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: ListView(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: TextFormField(
                                    textInputAction: TextInputAction.next,
                                    // validator: ValidationBuilder().build(),
                                    onChanged: (value) {
                                      start = value;
                                    },
                                    decoration: const InputDecoration(
                                        hintText: "Origen",
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Icon(Icons.room),
                                        )),
                                  ),
                                )),
                            Expanded(
                                flex: 1,
                                child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Icon(Icons.map),
                                    )))
                          ],
                        ),
                        space,
                        Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: TextFormField(
                                    textInputAction: TextInputAction.next,
                                    // validator: ValidationBuilder().build(),
                                    onChanged: (value) {
                                      end = value;
                                    },
                                    decoration: const InputDecoration(
                                        hintText: "Destino",
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Icon(Icons.room),
                                        )),
                                  ),
                                )),
                            Expanded(
                                flex: 1,
                                child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Icon(Icons.map),
                                    )))
                          ],
                        ),
                        space,
                        Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: TextFormField(
                                    textInputAction: TextInputAction.next,
                                    // validator: ValidationBuilder()
                                    // .regExp(
                                    // RegExp(
                                    // r"^(([0-9])|[1-2][0-9]|(3)[0-1])(\/)(([0-9])|((1)[0-2]))(\/)\d{4} (00|[0-9]|1[0-9]|2[0-3]):([0-5][0-9])"),
                                    // "Ingrese una fecha válida")
                                    // .build(),
                                    controller: TextEditingController(
                                        text:
                                            '${dateTime.day}/${dateTime.month}/${dateTime.year} $hours:$minutes'),
                                  ),
                                )),
                            Expanded(
                                flex: 1,
                                child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        pickDateTime();
                                      },
                                      child: Icon(Icons.calendar_month),
                                    )))
                          ],
                        ),
                        space,
                        Text("Vehículo",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        space,
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(3),
                              child: DropdownButtonFormField<String>(
                                value: value1,
                                iconSize: 20,
                                icon: const Icon(Icons.arrow_drop_down),
                                borderRadius: BorderRadius.circular(10),
                                items: vehicle.map(buildMenuVehicle).toList(),
                                onChanged: (value) =>
                                    setState(() => value1 = value),
                                // validator: (value) =>
                                // value == null ? 'Elija una opción' : null,
                              ),
                            )),
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.all(3),
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                // validator: ValidationBuilder()
                                // .regExp(RegExp(r"^([1-4]$)"),
                                // "Número no válido")
                                // .build(),
                                onChanged: (value) {
                                  room = value as int;
                                },
                                decoration: InputDecoration(hintText: "Cupos"),
                              ),
                            ))
                          ],
                        ),
                        space,
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.all(3),
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                // validator: ValidationBuilder().build(),
                                decoration: InputDecoration(hintText: "Color"),
                              ),
                            )),
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.all(3),
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                // validator: ValidationBuilder()
                                // .regExp(
                                // RegExp(
                                // r"^([A-Z]{3}\d{3}$)|([A-Z]{3}\d{2}[A-Z]$)|([A-Z]{3}\d{2})$"),
                                // "Placa no válida")
                                // .build(),
                                onChanged: (value) {
                                  plate = value;
                                },
                                decoration: InputDecoration(hintText: "Placa"),
                              ),
                            ))
                          ],
                        ),
                        space,
                        TextFormField(
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.number,
                            // validator: ValidationBuilder()
                            // .regExp(RegExp(r"^(\d{4})$"), "Valor no válido")
                            // .build(),
                            onChanged: (value) {
                              price = value as int;
                            },
                            decoration: InputDecoration(
                              hintText: "Valor",
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(10),
                                child: Icon(Icons.money),
                              ),
                            )),
                      ],
                    )))));
  }
}
