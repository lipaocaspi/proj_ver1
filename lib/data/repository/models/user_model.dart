import 'dart:convert';

List<Users> usersFromJson(String str) =>
    List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  Users(
      {required this.id,
      required this.name,
      required this.email,
      required this.dateOfBirth,
      required this.password,
  });

  final int id;
  final String name;
  final String email;
  final String dateOfBirth;
  final String password;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      dateOfBirth: json["dateOfBirth"],
      password: json["password"],);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "dateOfBirth": dateOfBirth,
        "password": password,
      };
}