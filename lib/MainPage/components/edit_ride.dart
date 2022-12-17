import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proj_ver1/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proj_ver1/data/repository/models/ride_model.dart';

class EditRidePage extends StatefulWidget {
  EditRidePage(this.ride, {Key? key}) : super(key: key);
  final Ride ride;
  @override
  EditRidePageState createState() => EditRidePageState();
}

class EditRidePageState extends State<EditRidePage> {

  final vehicle = ["Automóvil", "Motocicleta"];

  String? value1;

  DropdownMenuItem<String> buildMenuVehicle(String vehicle) => DropdownMenuItem(
        value: vehicle,
        child: Text(
          vehicle,
          style: const TextStyle(fontSize: 15),
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
          title: const Text("Editar Viaje"),
          leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  builder: (context) {
                    return Padding(
                        padding: EdgeInsets.all(25),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "¿Está seguro que desea salir? No se guardarán los cambios.",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            doublespace,
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.grey),
                                          child: Text("CANCELAR"))),
                                ),
                                Expanded(
                                  child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // Navigator.of(context).push(MaterialPageRoute(
                                          //   builder: (context) => MainPage()));
                                        },
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.green),
                                        child: Text("SALIR"),
                                      )),
                                )
                              ],
                            ),
                          ],
                        ));
                  });
            },
          ),
          actions: [
            IconButton(
                onPressed: () {
                  updateRide(widget.ride.id);
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
            padding: const EdgeInsets.all(25),
            child: ListView(
              children: [
                Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: TextFormField(
                            initialValue: widget.ride.start,
                            textInputAction: TextInputAction.next,
                            // validator: ValidationBuilder().build(),
                            onChanged: (value) {
                              setState(() {
                                widget.ride.start = value;
                              });
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
                            initialValue: widget.ride.end,
                            textInputAction: TextInputAction.next,
                            // validator: ValidationBuilder().build(),
                            onChanged: (value) {
                              setState(() {
                                widget.ride.end = value;
                              });
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
                            initialValue: widget.ride.dateAndTime,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              setState(() {
                                widget.ride.dateAndTime = value;
                              });
                            },
                            decoration: const InputDecoration(
                                hintText: "Origen",
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Icon(Icons.calendar_month),
                            )),
                            // validator: ValidationBuilder()
                            // .regExp(
                            // RegExp(
                            // r"^(([0-9])|[1-2][0-9]|(3)[0-1])(\/)(([0-9])|((1)[0-2]))(\/)\d{4} (00|[0-9]|1[0-9]|2[0-3]):([0-5][0-9])"),
                            // "Ingrese una fecha válida")
                            // .build(),
                          ),
                        )),
                  ],
                ),
                space,
                Text("Vehículo", style: TextStyle(fontWeight: FontWeight.bold)),
                space,
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: DropdownButtonFormField<String>(
                        value: widget.ride.vehicle,
                        iconSize: 20,
                        icon: const Icon(Icons.arrow_drop_down),
                        borderRadius: BorderRadius.circular(10),
                        items: vehicle.map(buildMenuVehicle).toList(),
                        onChanged: (value) {
                          setState(() {
                            widget.ride.vehicle = value!;
                          });
                        },
                        // validator: (value) =>
                        // value == null ? 'Elija una opción' : null,
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.all(3),
                      child: TextFormField(
                        initialValue: widget.ride.room,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        // validator: ValidationBuilder()
                        // .regExp(RegExp(r"^([1-4]$)"),
                        // "Número no válido")
                        // .build(),
                        onChanged: (value) {
                          setState(() {
                            widget.ride.room = value;
                          });
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
                        initialValue: widget.ride.color,
                        textInputAction: TextInputAction.next,
                        onChanged: (value) {
                          setState(() {
                            widget.ride.color = value;
                          });
                        },
                        // validator: ValidationBuilder().build(),
                        decoration: InputDecoration(hintText: "Color"),
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.all(3),
                      child: TextFormField(
                        initialValue: widget.ride.plate,
                        textInputAction: TextInputAction.next,
                        // validator: ValidationBuilder()
                        // .regExp(
                        // RegExp(
                        // r"^([A-Z]{3}\d{3}$)|([A-Z]{3}\d{2}[A-Z]$)|([A-Z]{3}\d{2})$"),
                        // "Placa no válida")
                        // .build(),
                        onChanged: (value) {
                          setState(() {
                            widget.ride.plate = value;
                          });
                        },
                        decoration: InputDecoration(hintText: "Placa"),
                      ),
                    ))
                  ],
                ),
                space,
                TextFormField(
                    initialValue: widget.ride.price,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    // validator: ValidationBuilder()
                    // .regExp(RegExp(r"^(\d{4})$"), "Valor no válido")
                    // .build(),
                    onChanged: (value) {
                      setState(() {
                        widget.ride.price = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Valor",
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.money),
                      ),
                    )),
              ],
            )));
  }

  updateRide(id) async {
    final response = await http.put(
        Uri.parse("https://mockend.com/lipaocaspi/demo_server_json/rides/$id"),
        body: jsonEncode(<String, String>{
          "start": widget.ride.start,
          "end": widget.ride.end,
          "dateAndTime": widget.ride.dateAndTime,
          "vehicle": widget.ride.vehicle,
          "room": widget.ride.room,
          "color": widget.ride.color,
          "plate": widget.ride.plate,
          "price": widget.ride.price
        }));
    print(response.statusCode);
    print(response.body);
  }
}
