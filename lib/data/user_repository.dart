import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proj_ver1/data/repository/models/user_model.dart';

abstract class UsersRepository {
  Future<List<Users>> getUsers();
}

class UsersRepositoryImpl implements UsersRepository {
  @override
  Future<List<Users>> getUsers() async {
    final response =
        await http.get(Uri.parse("https://mockend.com/lipaocaspi/demo_server_json/users"));


    if (response.statusCode == 200) {
      List<dynamic> myUsers = json.decode(response.body);
      List<Users> users = myUsers.map((e) => Users.fromJson(e)).toList();

      return users;
    } else {
      throw Exception('No se pudo recuperar el repositorio');
    }
  }
}
