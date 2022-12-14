import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proj_ver1/data/repository/models/ride_model.dart';

abstract class RideRepository {
  Future<List<Ride>> getRide();
}

class RideRepositoryImpl implements RideRepository {
  @override
  Future<List<Ride>> getRide() async {
    final response =
        await http.get(Uri.parse("https://mockend.com/lipaocaspi/demo_server_json/rides"));


    if (response.statusCode == 200) {
      List<dynamic> myRides = json.decode(response.body);
      List<Ride> rides = myRides.map((e) => Ride.fromJson(e)).toList();

      return rides;
    } else {
      throw Exception('No se pudo recuperar el repositorio');
    }
  }
}