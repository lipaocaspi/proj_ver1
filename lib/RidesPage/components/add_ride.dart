import 'package:flutter/material.dart';
import 'package:proj_ver1/constants.dart';
import 'package:proj_ver1/responsive.dart';

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
  final vehicle = ["Automóvil", "Motocicleta"];
  final room = ["1", "2", "3", "4"];
  String? value1;
  String? value2;
  DropdownMenuItem<String> buildMenuVehicle(String vehicle) => DropdownMenuItem(
        value: vehicle,
        child: Text(
          vehicle,
          style: const TextStyle(fontSize: 15),
        ),
      );
      DropdownMenuItem<String> buildMenuRoom(String room) => DropdownMenuItem(
        value: room,
        child: Text(
          room,
          style: const TextStyle(fontSize: 15),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Nuevo Viaje")),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: ListView(
                  children: [
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                          prefixIcon: Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.start),
                      )),
                    ),
                    space,
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                          prefixIcon: Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.start),
                      )),
                    ),
                    space,
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                            value: value1,
                            iconSize: 20,
                            icon: const Icon(Icons.arrow_drop_down),
                            items: vehicle.map(buildMenuVehicle).toList(),
                            onChanged: (value) =>
                                setState(() => value1 = value),
                          )),
                        )),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                            value: value2,
                            iconSize: 20,
                            icon: const Icon(Icons.arrow_drop_down),
                            items: room.map(buildMenuRoom).toList(),
                            onChanged: (value) =>
                                setState(() => value2 = value),
                          )),
                        )),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                    )
                  ],
                ))));
  }
}
