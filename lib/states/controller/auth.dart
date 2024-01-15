import 'dart:convert';

import 'package:alhafidh/states/HelperUtils/global_constant.dart';
import 'package:alhafidh/states/Repository/auth_repository.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/states/models/customer_model.dart';
import 'package:alhafidh/states/models/edit_ustomer_model.dart';
import 'package:alhafidh/states/models/reset_response.dart';
import 'package:alhafidh/states/services/auth.dart';
import 'package:alhafidh/states/utils/methods.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class AuthController extends GetxController {
  var authRepository = Get.put(AuthRepository());
  RxBool isRegistering = true.obs;
  RxBool isLoggingIn = true.obs;
  RxBool isRegistered = false.obs;
  RxBool isLoggedIn = false.obs;
  RxBool isSentEmail = false.obs;
  RxBool forgetPassLoading = true.obs;

  CustomerModel? user;
  ResetResponse? resetResponse;
  String resMgs = "Something went wrong!";

  //for login
  void loginUser({
    required String email,
    required String password,
  }) async {
    final result = await authRepository.login(
      email,
      password,
    );

    if (result.customerAccessTokenCreate!.customerAccessToken != null) {
      customer(
          customerToken: result
              .customerAccessTokenCreate!.customerAccessToken!.accessToken
              .toString());
      HelperUtils.setToken(result
          .customerAccessTokenCreate!.customerAccessToken!.accessToken
          .toString());
      Preference.setCToken(result
          .customerAccessTokenCreate!.customerAccessToken!.accessToken
          .toString());

      print('get customer token =>' +
          result.customerAccessTokenCreate!.customerAccessToken!.accessToken
              .toString());
      print('save customer token =>' + Preference.getCToken().toString());
    } else {
      isLoggedIn(false);
      isLoggingIn(false);
      Get.snackbar("UNIDENTIFIED_CUSTOMER", "Email & Password incorrect",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
  }

  //get customer data
  void customer({required String customerToken}) async {
    final result = await authRepository.customer(customerToken);
    Methods.showLoading();

    if (result.customer != null) {
      isLoggedIn(true);
      isLoggingIn(false);

      //store user data in preference
      Preference.setUserDetails(result);
      Preference.setLoggedInFlag(true);

      print('save user details =>');
      print(Preference.getUserDetails().customer.id);
      Methods.hideLoading();
    } else {
      Get.snackbar("customer data null", "get customer data",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  //set reset password
  void resetPassword({required String email}) async {
    forgetPassLoading(true);
    final result = await authRepository.resetPassword(email);
    //Methods.showLoading();
    if (result != null) {
      resetResponse = result;
      if (result.customerRecover.customerUserErrors.isEmpty) {
        isSentEmail(true);
        forgetPassLoading(false);
        //store user data in preference
        //  Methods.hideLoading();
      } else {
        Get.snackbar("Can't find User", "Please Enter Registered Email",
            snackPosition: SnackPosition.TOP);
      }
    } else {}
  }

  //for registration
  Future<bool> register({
    required String fName,
    required String lName,
    required String phoneNum,
    required String email,
    required String password,
    required String cPassword,
  }) async {
    Methods.showLoading();
    isRegistering(true);
    try {
      var response = await AuthService.register(
        fName: fName,
        lName: lName,
        phoneNum: phoneNum,
        email: email,
        password: password,
        cPassword: cPassword,
      );

      print(jsonEncode(response).toString());
      String s = jsonEncode(response).toString();

      //cheek json success response if customer
      bool _isSuccessed = s.toLowerCase().contains("customer".toLowerCase());

      if (_isSuccessed) {
        resMgs = 'Registration Successfully';
        return true;
      } else {
        resMgs = 'User already exists. Please login';
        return false;
      }
    } finally {
      isRegistering(false);
      Methods.hideLoading();
    }
  }

  Future<bool> updateCustomer({
    required String fName,
    required String lName,
    required String phoneNum,
    required String email,
  }) async {
    Methods.showLoading();
    isRegistering(true);
    try {
      var response = await AuthService.customerUpdate(
        fName: fName,
        lName: lName,
        phoneNum: phoneNum,
        email: email,
      );

      print(jsonEncode(response).toString());
      String s = jsonEncode(response).toString();
      CustomerModel cm = CustomerModel(
          customer: Customer(
        firstName: fName,
        lastName: lName,
        email: email,
        phone: phoneNum,
        id: Preference.getUserDetails().customer.id,
      ));
      print(cm);
      //cheek json success response if customer
      bool _isSuccessed = s.toLowerCase().contains("customer".toLowerCase());

      if (_isSuccessed) {
        resMgs = 'Successfully';
        CustomerEditModel customer = CustomerEditModel.fromJson(response);

        CustomerModel cm = CustomerModel(
            customer: Customer(
          firstName: fName,
          lastName: lName,
          email: customer.customer.email,
          phone: customer.customer.phone,
          id: Preference.getUserDetails().customer.id,
        ));
        print(cm);
        //store user data in preference
        return true;
      } else {
        resMgs = 'Email already been taken';
        return false;
      }
    } finally {
      isRegistering(false);
      Methods.hideLoading();
    }
  }

/* Future<bool> forgetPassword({
    required String email,
    int? otp,
    String? password,
  }) async {
    Methods.showLoading();
    forgetPassLoading(true);
    try {
      var response = await AuthService.forgetPass(
        email: email,
        otp: otp,
        pass: password,
      );
      resMgs = response["message"];
      return response["isSuccess"];
    } finally {
      forgetPassLoading(false);
      Methods.hideLoading();
    }
  }*/
}
