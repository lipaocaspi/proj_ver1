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

class MobileUserRidesPage extends StatelessWidget {
  const MobileUserRidesPage({Key? key}) : super(key: key);
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
