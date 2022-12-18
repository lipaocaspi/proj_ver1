import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:proj_ver1/ImboxPage/imbox_page_screen.dart';
import 'package:proj_ver1/MainPage/components/new_ride.dart';
import 'package:proj_ver1/MainPage/components/ride_page.dart';
import 'package:proj_ver1/RidesPage/components/bloc/ride_bloc.dart';
import 'package:proj_ver1/SettingsPage/settings_page_screen.dart';
import 'package:proj_ver1/UserPage/user_page_screen.dart';
import 'package:proj_ver1/UserRidesPage/user_rides_page_screen.dart';
import 'package:proj_ver1/constants.dart';
import 'package:proj_ver1/data/repository/models/ride_model.dart';
import 'package:proj_ver1/data/repository/models/user_model.dart';

class MainPage extends StatelessWidget {
  MainPage(this.users, {Key? key, required this.id}) : super(key: key);
  final Users users;
  final int id;
  final List<Ride> _rides = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RideBloc, RideState>(builder: (context, state) {
      if (state is InitialRidesState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is LoadingRidesState) {
        _rides.addAll(state.rides.where(
            (element) => element.state == false && id != element.userId));
        return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Scaffold(
              drawer: Drawer(
                width: MediaQuery.of(context).size.width * 0.8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: ListView(
                    children: [
                      DrawerHeader(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                          ),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 32,
                                backgroundColor: Colors.black,
                                child: CircleAvatar(
                                  radius: 31,
                                  backgroundImage: NetworkImage(
                                      'https://images.unsplash.com/photo-1661544641467-d1811f77c71e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=650&q=80'),
                                ),
                              ),
                              space,
                              Text(users.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              Text(users.email, style: TextStyle(fontSize: 15)),
                            ],
                          )),
                      space,
                      ListTile(
                        leading: Icon(Icons.person, color: Colors.green),
                        title: Text("Mi Perfil",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17)),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.of(context).push(
                            PageTransition(
                              child: UserPage(users),
                              type: PageTransitionType.rightToLeft,
                            ),
                          );
                        },
                      ),
                      Divider(),
                      ListTile(
                          leading: Icon(Icons.drive_eta, color: Colors.green),
                          title: Text("Mis Viajes",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17)),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(
                              PageTransition(
                                child: UserRidesPage(users.id),
                                type: PageTransitionType.rightToLeft,
                              ),
                            );
                          }),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.message, color: Colors.green),
                        title: Text("Mensajes",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17)),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.of(context).push(
                            PageTransition(
                              child: ImboxPage(),
                              type: PageTransitionType.rightToLeft,
                            ),
                          );
                        },
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.settings, color: Colors.green),
                        title: Text("Configuración",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17)),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.of(context).push(
                            PageTransition(
                              child: SettingsPage(users),
                              type: PageTransitionType.rightToLeft,
                            ),
                          );
                        },
                      )
                    ]),
              ),
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
              appBar: AppBar(
                title: Text("Viajes"),
              ),
              body: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: ListView.builder(
                            physics: const ScrollPhysics(),
                            itemCount: _rides.length,
                            itemBuilder: (context, index) {
                              return Card(
                                color: Colors.grey.shade100,
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: GestureDetector(
                                    onTap: (() {
                                      Navigator.of(context).push(
                                        PageTransition(
                                          child: RidePage(
                                              ride: _rides[index],
                                              id: users.id),
                                          type: PageTransitionType.rightToLeft,
                                        ),
                                      );
                                    }),
                                    child: SizedBox(
                                      height: 100,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(_rides[index].vehicle ==
                                                  'Motocicleta'
                                              ? Icons.motorcycle
                                              : Icons.drive_eta),
                                          space,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text("Origen: ",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text(_rides[index].start)
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text("Destino: ",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text(_rides[index].end)
                                            ],
                                          ),
                                          space,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(_rides[index].dateAndTime)
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ));
      }
      return Text("");
    });
  }
}
