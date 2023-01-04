import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proj_ver1/MainPage/components/edit_ride.dart';
import 'package:proj_ver1/data/repository/models/ride_model.dart';

class UserRidesPage extends StatefulWidget {
  UserRidesPage(this.id, this._ridesU, {Key? key}) : super(key: key);
  int id;
  List<Ride> _ridesU = [];

  @override
  State<UserRidesPage> createState() => UserRidesPageState();
}

class UserRidesPageState extends State<UserRidesPage> {
  reloadRides() async {
    widget._ridesU.clear();
    final response =
        await http.get(Uri.parse("http://192.168.1.37:3000/rides"));

    if (response.statusCode == 200) {
      List<dynamic> myRides = json.decode(utf8.decode(response.bodyBytes));
      List<Ride> rides = myRides.map((e) => Ride.fromJson(e)).toList();
      setState(() {
        widget._ridesU.addAll(rides.where((element) => widget.id == element.userId));
      });
      final upSnack = SnackBar(
        content: Text("Viajes actualizados"),
        action: SnackBarAction(
          label: "Cerrar",
          onPressed: () {
            Navigator.of(context);
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(upSnack);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mis Viajes"),
        actions: [
          IconButton(
            onPressed: () {
              reloadRides();
            }, 
            icon: Icon(Icons.refresh)
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height *0.8,
                  child: ListView.builder(
                    physics: ScrollPhysics(),
                    itemCount: widget._ridesU.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.grey.shade100,
                        child: Column(
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                              visualDensity: VisualDensity(vertical: -3),
                              leading: Icon(widget._ridesU[index].vehicle == 'Motocicleta' ? Icons.motorcycle : Icons.drive_eta),
                              title: Text(widget._ridesU[index].start + " - " + widget._ridesU[index].end),
                              subtitle: Text(widget._ridesU[index].dateAndTime),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(widget._ridesU[index].color),
                                  Text(widget._ridesU[index].plate),
                                ],
                              )
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: (){
                                    if(widget._ridesU[index].state == true) {
                                      final errorEditSnack = SnackBar(
                                        content: Text("Viaje finalizado. No se puede editar"),
                                        action: SnackBarAction(
                                          label: "Cerrar",
                                          onPressed: () {
                                            Navigator.of(context);
                                          },
                                        ),
                                      );
                                      ScaffoldMessenger.of(context).showSnackBar(errorEditSnack);
                                    }
                                    else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => EditRidePage(widget._ridesU[index]),
                                        ),
                                      );
                                    }
                                  }, 
                                  icon: Icon(Icons.edit)
                                ),
                                IconButton(
                                  onPressed: (){
                                    deleteRide(widget._ridesU[index].id);
                                    setState(() {
                                      widget._ridesU.removeAt(index);
                                    });
                                  }, 
                                  icon: Icon(Icons.delete)
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  deleteRide(id) async {
    http.delete(Uri.parse("http://192.168.1.37:3000/rides/$id"),
      headers: {"Content-Type": "application/json"},
    );
  }
}
