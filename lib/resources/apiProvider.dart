import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:bloc_mysql/model/UserResponse.dart';
import 'package:http/http.dart' as http;

class UserApiProvider {
  final _url = 'http://10.10.12.20:9009/user';
  Future<UserResponse> getUsers() async {
    try {
      final response = await http.get(_url);
      Map data = json.decode(response.body);
      print("data masuk");
      return UserResponse.fromJson(data);
    } catch (error) {
      print("error");
      return UserResponse.withError("$error");
    }
  }

  Future addUser(name, email, password) async {
    final response = await http.post('$_url/register',
        body: {'name': name, 'email': email, 'password': password});
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed register');
    }
  }

  Future editUser(id, name, email, password) async {
    final response = await http.patch('$_url/$id',
        body: {"name": name, 'email': email, 'password': password});
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed Update');
    }
  }

  Future deleteUser(id) async {
    final response = await http.delete('$_url/$id');
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed delete');
    }
  }
}
