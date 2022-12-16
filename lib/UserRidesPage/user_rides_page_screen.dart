import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj_ver1/RidesPage/components/bloc/ride_bloc.dart';
import 'package:proj_ver1/UserRidesPage/components/details_ride.dart';
import 'package:proj_ver1/constants.dart';
import 'package:proj_ver1/data/repository/models/ride_model.dart';

class UserRidesPage extends StatelessWidget {
  int id;
  UserRidesPage(this.id, {Key? key}) : super(key: key);
  final List<Ride> _rides1 = [];

  static final bdecoration = BoxDecoration(
      color: Colors.grey.withOpacity(0.2),
      borderRadius: BorderRadius.circular(2),
      border: Border.all(color: Colors.black.withOpacity(0.3)));

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RideBloc, RideState>(builder: (context, state) {
      if (state is InitialRidesState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is LoadingRidesState) {
          _rides1.addAll(state.rides.where((element) => id == element.userId));
          return Scaffold(
            appBar: AppBar(
              title: Text("Mis Viajes"),
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
                        itemCount: _rides1.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.grey.shade100,
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: GestureDetector(
                                onTap: (() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsRide(
                                          ride: _rides1[index], id: id),
                                    ),
                                  );
                                }),
                                child: SizedBox(
                                  height: 100,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Text(_rides[index].userId.toString()),
                                      Icon(
                                          _rides1[index].vehicle == 'Motocicleta'
                                              ? Icons.motorcycle
                                              : Icons.drive_eta),
                                      space,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text("Origen: ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text(_rides1[index].start)
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text("Destino: ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text(_rides1[index].end)
                                        ],
                                      ),
                                      space,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(_rides1[index].dateAndTime)
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
          ),);
        }
        return const Center(child: Text("error"));
    });
  }
}
