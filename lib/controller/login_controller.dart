import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:madesloshen/model/model_login.dart';


class LoginController {
  final String apiUrl =
      "https://abdulrahman-bashir.trainees-mad-s.com/api/v1/auth/login";

  Future<bool> logIn(
    String identifier,
    String password,
  ) async {
    final user = ModelLogin(identifier, password);
    try {
      print("here 15");
      final response = await http.post(Uri.parse(apiUrl), body: {
        'identifier': user.identifier,
        'password': user.password,
      }, headers: {
        "Accept": "application/json"
      });
      print("response ${json.decode(response.body)}");

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }
}
