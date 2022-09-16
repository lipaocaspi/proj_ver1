import 'package:flutter/material.dart';
import 'package:proj_ver1/UserRidesPage/components/selected_ride.dart';
import 'package:proj_ver1/constants.dart';
import 'package:proj_ver1/responsive.dart';

class UserRidesPage extends StatelessWidget {
  const UserRidesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: MobileUserRidesPage(),
    );
  }
}

class MobileUserRidesPage extends StatefulWidget {
  const MobileUserRidesPage({Key? key}) : super(key: key);

  @override
  State<MobileUserRidesPage> createState() => MobileUserRidesPageState();
}

class MobileUserRidesPageState extends State<MobileUserRidesPage> {

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
    boxShadow: [
      BoxShadow(
          color: Colors.green.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 8,
          blurStyle: BlurStyle.inner,
          offset: const Offset(0, 3)
      )
    ],
    color: Colors.grey.withOpacity(0.1),
    borderRadius: BorderRadius.circular(5),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                  filled: true,
                                  fillColor: Colors.grey.shade100,
                                  contentPadding: EdgeInsets.all(8),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      style: BorderStyle.none
                                    )
                                  )
                                )
                              ),
                            )
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: value1,
                                  iconSize: 20,
                                  icon: const Icon(Icons.arrow_drop_down),
                                  borderRadius: BorderRadius.circular(10),
                                  items: choice.map(buildMenuChoice).toList(),
                                  onChanged: (value) =>
                                      setState(() => value1 = value),
                                )
                              ),
                            )
                          )
                        ],
                      ),
                      Container(
                          decoration: bdecoration,
                          padding: const EdgeInsets.all(15),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RidePage()));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Icon(Icons.drive_eta),
                                space,
                                Text("Cra 15 # 67-74", style: TextStyle(color: kTextColor)),
                                Text("UIS", style: TextStyle(color: kTextColor)),
                                Text("25/10/2022, 10:30", style: TextStyle(color: kTextColor)),
                              ],
                            ),
                          )),
                      space,
                      Container(
                        decoration: bdecoration,
                        padding: const EdgeInsets.all(15),
                        child: InkWell(
                          onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RidePage()));
                            },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Icon(Icons.motorcycle),
                              space,
                              Text("Cra 15 # 67-74", style: TextStyle(color: kTextColor)),
                              Text("UIS", style: TextStyle(color: kTextColor)),
                              Text("25/10/2022, 10:30", style: TextStyle(color: kTextColor)),
                            ],
                        ),
                        )
                      ),
                      space,
                      Container(
                        decoration: bdecoration,
                        padding: const EdgeInsets.all(15),
                        child: InkWell(
                          onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RidePage()));
                            },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Icon(Icons.motorcycle),
                              space,
                              Text("Cra 15 # 67-74", style: TextStyle(color: kTextColor)),
                              Text("UIS", style: TextStyle(color: kTextColor)),
                              Text("25/10/2022, 10:30", style: TextStyle(color: kTextColor)),
                            ],
                        ),
                        )
                      ),
                      space,
                      Container(
                        decoration: bdecoration,
                        padding: const EdgeInsets.all(15),
                        child: InkWell(
                          onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RidePage()));
                            },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Icon(Icons.drive_eta),
                              space,
                              Text("Cra 15 # 67-74", style: TextStyle(color: kTextColor)),
                              Text("UIS", style: TextStyle(color: kTextColor)),
                              Text("25/10/2022, 10:30", style: TextStyle(color: kTextColor)),
                            ],
                        ),
                        )
                      ),
                      space,
                      Container(
                        decoration: bdecoration,
                        padding: const EdgeInsets.all(15),
                        child: InkWell(
                          onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RidePage()));
                            },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Icon(Icons.motorcycle),
                              space,
                              Text("Cra 15 # 67-74", style: TextStyle(color: kTextColor)),
                              Text("UIS", style: TextStyle(color: kTextColor)),
                              Text("25/10/2022, 10:30", style: TextStyle(color: kTextColor)),
                            ],
                        ),
                        )
                      ),
                      space,
                      Container(
                        decoration: bdecoration,
                        padding: const EdgeInsets.all(15),
                        child: InkWell(
                          onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RidePage()));
                            },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Icon(Icons.drive_eta),
                              space,
                              Text("Cra 15 # 67-74", style: TextStyle(color: kTextColor)),
                              Text("UIS", style: TextStyle(color: kTextColor)),
                              Text("25/10/2022, 10:30", style: TextStyle(color: kTextColor)),
                            ],
                        ),
                        )
                      ),
                      space,
                      Container(
                        decoration: bdecoration,
                        padding: const EdgeInsets.all(15),
                        child: InkWell(
                          onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RidePage()));
                            },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Icon(Icons.drive_eta),
                              space,
                              Text("Cra 15 # 67-74", style: TextStyle(color: kTextColor)),
                              Text("UIS", style: TextStyle(color: kTextColor)),
                              Text("25/10/2022, 10:30", style: TextStyle(color: kTextColor)),
                            ],
                        ),
                        )
                      ),
                    ],
                  ))),
        ],
      ),
    );
  }
}
