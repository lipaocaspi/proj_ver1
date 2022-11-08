import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:proj_ver1/RidesPage/components/add_ride.dart';
import 'package:proj_ver1/UserRidesPage/components/selected_ride.dart';
import 'package:proj_ver1/constants.dart';
import 'package:proj_ver1/responsive.dart';

class RidesPage extends StatelessWidget {
  const RidesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: MobileRidesPage(),
    );
  }
}

class MobileRidesPage extends StatefulWidget {
  const MobileRidesPage({Key? key}) : super(key: key);

  @override
  State<MobileRidesPage> createState() => MobileRidesPageState();
}

class MobileRidesPageState extends State<MobileRidesPage> {
  final choice = ["Tipo de Vehículo", "Lugar", "Fecha"];

  String? value1;
  
  DropdownMenuItem<String> buildMenuChoice(String choice) => DropdownMenuItem(
        value: choice,
        child: Text(
          choice,
          style: const TextStyle(fontSize: 15),
        ),
      );

  static final bdecoration = BoxDecoration(
    // boxShadow: [
      // BoxShadow(
          // color: Colors.green.withOpacity(0.1),
          // spreadRadius: 1,
          // blurRadius: 8,
          // blurStyle: BlurStyle.inner,
          // offset: const Offset(0, 3))
    // ],
    color: Colors.grey.withOpacity(0.2),
    borderRadius: BorderRadius.circular(2),
    border: Border.all(color: Colors.black.withOpacity(0.3))
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            PageTransition(
              child: const NewRidePage(),
              type: PageTransitionType.bottomToTop,
            ),
          );
        },
        backgroundColor: kPrimaryColor,
        child: const Icon(Icons.add),
      ),
      body: Row(
        children: [
          Flexible(
            flex: 4,
            child: Container(
                padding: const EdgeInsets.all(10),
                child: ListView(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: TextField(
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                hintText: "Buscar",
                                prefixIcon: Icon(Icons.search, color: Colors.black),
                                contentPadding: EdgeInsets.all(7),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Colors.black
                                  )
                                )
                              )
                            ),
                          )
                        ),
                        // Expanded(
                          // child: Padding(
                            // padding: EdgeInsets.all(5),
                              // child: DropdownButtonFormField<String>(
                                // value: value1,
                                // iconSize: 20,
                                // icon: const Icon(Icons.arrow_drop_down),
                                // borderRadius: BorderRadius.circular(10),
                                  // focusColor: Colors.green,
                                // items: choice.map(buildMenuChoice).toList(),
                                // onChanged: (value) =>
                                    // setState(() => value1 = value),
                              // )
                          // )
                        // )
                      ],
                    ),
                    Container(
                        decoration: bdecoration,
                        padding: const EdgeInsets.all(15),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              PageTransition(
                                child: const RidePage(),
                                type: PageTransitionType.rightToLeft,
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.drive_eta),
                              space,
                              Row(
                                children: [
                                  Expanded(
                                    child: Text("Origen:", style: TextStyle(fontWeight: FontWeight.bold),)
                                    ),
                                  Expanded(
                                    flex: 5,
                                    child: Text("Cra 15 # 67-74"))
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text("Destino:", style: TextStyle(fontWeight: FontWeight.bold),)
                                    ),
                                  Expanded(
                                    flex: 4,
                                    child: Text("UIS"))
                                ],
                              ),
                              Text("25/10/2022, 10:30",
                                  style: TextStyle(color: kTextColor)),
                            ],
                          ),
                        )),
                    space,
                    Container(
                        decoration: bdecoration,
                        padding: const EdgeInsets.all(15),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              PageTransition(
                                child: const RidePage(),
                                type: PageTransitionType.rightToLeft,
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.motorcycle),
                              space,
                              Row(
                                children: [
                                  Expanded(
                                    child: Text("Origen:", style: TextStyle(fontWeight: FontWeight.bold),)
                                    ),
                                  Expanded(
                                    flex: 5,
                                    child: Text("Cra 15 # 67-74"))
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text("Destino:", style: TextStyle(fontWeight: FontWeight.bold),)
                                    ),
                                  Expanded(
                                    flex: 4,
                                    child: Text("UIS"))
                                ],
                              ),
                              Text("25/10/2022, 10:30",
                                  style: TextStyle(color: kTextColor)),
                            ],
                          ),
                        )),
                    space,
                    Container(
                        decoration: bdecoration,
                        padding: const EdgeInsets.all(15),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              PageTransition(
                                child: const RidePage(),
                                type: PageTransitionType.rightToLeft,
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.drive_eta),
                              space,
                              Row(
                                children: [
                                  Expanded(
                                    child: Text("Origen:", style: TextStyle(fontWeight: FontWeight.bold),)
                                    ),
                                  Expanded(
                                    flex: 5,
                                    child: Text("Cra 15 # 67-74"))
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text("Destino:", style: TextStyle(fontWeight: FontWeight.bold),)
                                    ),
                                  Expanded(
                                    flex: 4,
                                    child: Text("UIS"))
                                ],
                              ),
                              Text("25/10/2022, 10:30",
                                  style: TextStyle(color: kTextColor)),
                            ],
                          ),
                        )),
                    space,
                    Container(
                        decoration: bdecoration,
                        padding: const EdgeInsets.all(15),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              PageTransition(
                                child: const RidePage(),
                                type: PageTransitionType.rightToLeft,
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.motorcycle),
                              space,
                              Row(
                                children: [
                                  Expanded(
                                    child: Text("Origen:", style: TextStyle(fontWeight: FontWeight.bold),)
                                    ),
                                  Expanded(
                                    flex: 5,
                                    child: Text("Cra 15 # 67-74"))
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text("Destino:", style: TextStyle(fontWeight: FontWeight.bold),)
                                    ),
                                  Expanded(
                                    flex: 4,
                                    child: Text("UIS"))
                                ],
                              ),
                              Text("25/10/2022, 10:30",
                                  style: TextStyle(color: kTextColor)),
                            ],
                          ),
                        )),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
