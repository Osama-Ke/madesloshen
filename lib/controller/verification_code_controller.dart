import 'dart:convert';

import 'package:madesloshen/model/model_verification_model.dart';
import 'package:http/http.dart' as http;
import 'package:madesloshen/server/api_headers/normal-headers.dart';
import 'package:madesloshen/server/concet_with_server.dart';

import '../core/constans/apis.dart';

class VerificationCodeController {
  Future<bool> verificationcode(String email, String verification_code) async {
    final user = ModelVerificationCode(email, verification_code);

    try {
      print("here 11");
      final response = await http.post(
        Uri.parse(MyApis.urlVerifyCode),
        body: ApiParameters.verifyCodeParams(

          email: user.email,
          verificationCode: user.verification_code


        ),
        headers: ApiHeaders.towNormalHeader,
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
