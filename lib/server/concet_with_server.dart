class ApiParameters {
  static Map<String, dynamic> registerParams({
    required String userName,
    required String email,
    required String phoneNumber,
    required String password,
    required String passwordConfirmation,
  }) =>
      {
        'user_name': userName,
        'email': email,
        'phone_number': phoneNumber,
        'password': password,
        'password_confirmation': passwordConfirmation
      };

  static Map<String , dynamic> verifyCodeParams({
    required String email ,
    required String verificationCode ,
}) => {
    'email': email,
    'verification_code': verificationCode,
  } ;

}

