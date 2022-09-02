import 'package:flutter/material.dart';
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

class MobileRidesPage extends StatelessWidget {
  const MobileRidesPage({Key? key}) : super(key: key);
  static final bdecoration = BoxDecoration(
    boxShadow: [
      BoxShadow(
          color: Colors.green.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 8,
          blurStyle: BlurStyle.inner,
          offset: const Offset(0, 3))
    ],
    color: Colors.grey.withOpacity(0.3),
    borderRadius: BorderRadius.circular(15),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Viajes Programados"),
      ),
      body: Row(
        children: [
          Flexible(
              flex: 4,
              child: Container(
                  padding: const EdgeInsets.all(15),
                  color: Colors.white,
                  child: ListView(
                    children: [
                      Container(
                          decoration: bdecoration,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(15),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RidePage()));
                            },
                            child: Column(
                              children: const [
                                Text("Cra 15 # 67-74, B. La Victoria"),
                                Text("UIS"),
                                Text("25/10/2022"),
                                Text("10:30 A.M."),
                              ],
                            ),
                          )),
                      space,
                      Container(
                        decoration: bdecoration,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(15),
                        child: InkWell(
                          onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RidePage()));
                            },
                          child: Column(
                            children: const [
                              Text("Cra 15 # 67-74, B. La Victoria"),
                              Text("UIS"),
                              Text("25/10/2022"),
                              Text("10:30 A.M."),
                            ],
                        ),
                        )
                      ),
                      space,
                      Container(
                        decoration: bdecoration,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(15),
                        child: InkWell(
                          onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RidePage()));
                            },
                          child: Column(
                            children: const [
                              Text("Cra 15 # 67-74, B. La Victoria"),
                              Text("UIS"),
                              Text("25/10/2022"),
                              Text("10:30 A.M."),
                            ],
                        ),
                        )
                      ),
                      space,
                      Container(
                        decoration: bdecoration,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(15),
                        child: InkWell(
                          onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RidePage()));
                            },
                          child: Column(
                            children: const [
                              Text("Cra 15 # 67-74, B. La Victoria"),
                              Text("UIS"),
                              Text("25/10/2022"),
                              Text("10:30 A.M."),
                            ],
                        ),
                        )
                      ),
                      space,
                      Container(
                        decoration: bdecoration,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(15),
                        child: InkWell(
                          onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RidePage()));
                            },
                          child: Column(
                            children: const [
                              Text("Cra 15 # 67-74, B. La Victoria"),
                              Text("UIS"),
                              Text("25/10/2022"),
                              Text("10:30 A.M."),
                            ],
                        ),
                        )
                      ),
                      space,
                      Container(
                        decoration: bdecoration,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(15),
                        child: InkWell(
                          onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RidePage()));
                            },
                          child: Column(
                            children: const [
                              Text("Cra 15 # 67-74, B. La Victoria"),
                              Text("UIS"),
                              Text("25/10/2022"),
                              Text("10:30 A.M."),
                            ],
                        ),
                        )
                      ),
                      space,
                      Container(
                        decoration: bdecoration,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(15),
                        child: InkWell(
                          onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RidePage()));
                            },
                          child: Column(
                            children: const [
                              Text("Cra 15 # 67-74, B. La Victoria"),
                              Text("UIS"),
                              Text("25/10/2022"),
                              Text("10:30 A.M."),
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