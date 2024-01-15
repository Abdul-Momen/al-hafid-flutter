import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/states/services/base_client.dart';

class AuthService {
  // registration function
  static Future<dynamic> register({
    required String fName,
    required String lName,
    required String phoneNum,
    required String email,
    required String password,
    required String cPassword,
  }) async {
    var response = await BaseClient.postData(
      api: ConstantStrings.kRegisterAPI,
      token: ConstantStrings.kATkn,
      body: {
        "customer": {
          "first_name": fName,
          "last_name": lName,
          "email": email,
          "verified_email": true,
          "addresses": [],
          "password": password,
          "password_confirmation": cPassword,
          "send_email_welcome": true
        }
      },
    );

    return response;
  }

  // registration function
  static Future<dynamic> customerUpdate({
    required String fName,
    required String lName,
    required String phoneNum,
    required String email,
  //${Preference.getUserDetails().customer.id.replaceAll(new RegExp(r'[^0-9]'), '')}.json"
  }) async {
    var response = await BaseClient.putData(
      api:
          "${ConstantStrings.kCustomerUpdateAPI}${Preference.getUserDetails().customer.id.replaceAll(new RegExp(r'[^0-9]'), '')}.json",
      token:ConstantStrings.kATkn,
      body: {
        "customer": {
          "first_name": fName,
          "last_name": lName,
          "email": email,
          "phone": phoneNum
        }
      },
    );

    return response;
  }
/*
  // forget pass function
  static Future<dynamic> forgetPass({
    required String email,
    int? otp,
    String? pass,
  }) async {
    var response = await BaseClient.postData(
      api: ConstantStrings.kForgetPassword,
      body: {
        "email": email,
        "otp": otp ?? 0,
        "password": pass ?? '',
      },
    );
    return response;
  }*/
}
