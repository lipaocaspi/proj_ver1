import 'dart:convert';

List<Ride> rideFromJson(String str) =>
    List<Ride>.from(json.decode(str).map((x) => Ride.fromJson(x)));

String rideToJson(List<Ride> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Ride {
  Ride({
    required this.userId,
    required this.id,
    required this.start,
    required this.end,
    required this.dateAndTime,
    required this.vehicle,
    required this.room,
    required this.color,
    required this.plate,
    required this.price,
    required this.state,
  });

  final int userId;
  final int id;
  final String start;
  final String end;
  final String dateAndTime;
  final String vehicle;
  final String room;
  final String color;
  final String plate;
  final String price;
  final bool state;

  factory Ride.fromJson(Map<String, dynamic> json) => Ride(
        userId: json["userId"],
        id: json["id"],
        start: json["start"],
        end: json["end"],
        dateAndTime: json["dateAndTime"],
        vehicle: json["vehicle"],
        room: json["room"],
        color: json["color"],
        plate: json["plate"],
        price: json["price"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "start": start,
        "end": end,
        "dateAndTime": dateAndTime,
        "vehicle": vehicle,
        "room": room,
        "color": color,
        "plate": plate,
        "price": price,
        "state": state,
      };
}