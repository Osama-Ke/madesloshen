import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:madesloshen/core/constans/apis.dart';
import 'package:madesloshen/server/concet_with_server.dart';
import '../model/model_register.dart';
import '../server/api_headers/normal-headers.dart';

class RegisterController {
  Future<bool> creatUser(String userName, String email, String phoneNumber,
      String password, String passwordConfirmation) async {
    final user = ModelRegister(
        userName, email, phoneNumber, password, passwordConfirmation);
    try {
      print("here 11");
      final response = await http.post(
        Uri.parse(MyApis.urlApiRegister),
        body: ApiParameters.registerParams(
          userName: user.user_name,
          email: user.email,
          phoneNumber: user.phone_number,
          password: user.password,
          passwordConfirmation: user.password_confirmation,
        ),
        headers: ApiHeaders.normalHeader
      );
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
