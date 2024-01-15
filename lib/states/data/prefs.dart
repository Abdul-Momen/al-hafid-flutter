import 'dart:convert';
import 'package:alhafidh/states/models/customer_model.dart';
import 'package:get_storage/get_storage.dart';

class Preference {
  static final prefs = GetStorage();
  static const userDetails = 'userDetails';
  static const loggedInFlag = 'loginFlag';
  static const rememberMeFlag = 'rememberMeFlag';
  static const loginEmail = 'loginEmail';
  static const loginPass = 'loginPass';
  static const cartId = 'cartIc';
  static const customerToken = 'customerToken';
  static const cartNote = 'cartNote';
  static const cartCheckOutId = 'cartCheckOut';
  static const guestCheckOutId = 'guestCheckOut';
  static const guestUserEmail = 'guestEmail';
  static const guestUserFName = 'guestFName';
  static const guestUserLName = 'guestLName';
  static const guestUserAddress = 'guestUserAddress';
  static const guestUserCity = 'guestUserCity';
  static const guestUserPhone = 'guestUserPhone';
  static const isFirsTimeOnboard = 'isFirsTimeOnboard';
  static const isArabicLang = 'isArabic';
  static const exChangeRate = 'exchange';
  static const promoCodes = 'promoCode';
  static const promoImages = 'promoImage';

  // get
  static CustomerModel getUserDetails() {
    var result = prefs.read(userDetails);
    return CustomerModel.fromJson(json.decode(result));
  }

  // set
  static void setUserDetails(CustomerModel value) {
    print('Storing User Details: ${json.encode(value.toJson())}');
    prefs.write(userDetails, json.encode(value.toJson()));
  }

  // get
  static bool getLoggedInFlag() {
    return prefs.read(loggedInFlag) ?? false;
  }

  // set
  static void setLoggedInFlag(bool value) {
    print('Storing Login flag: $value');
    prefs.write(loggedInFlag, value);
  }

// get
  static bool getIsArabicFlag() {
    return prefs.read(isArabicLang) ?? true;
  }

  // set
  static void setIsArabicFlag(bool value) {
    print('Storing Arabic flag: $value');
    prefs.write(isArabicLang, value);
  }

  // get
  static bool getRememberMeFlag() {
    return prefs.read(rememberMeFlag) ?? false;
  }

  // set
  static void setRememberMeFlag(bool value) {
    print('Storing remember me flag: $value');
    prefs.write(rememberMeFlag, value);
  }

// get
  static bool getIsFristOnbordingFlag() {
    return prefs.read(isFirsTimeOnboard) ?? false;
  }

  // set
  static void setIsFristOnbordingFlag(bool value) {
    print('Storing boarding  flag: $value');
    prefs.write(isFirsTimeOnboard, value);
  }

  // get
  static String getLoginEmail() {
    return prefs.read(loginEmail) ?? '';
  }

  // set
  static void setLoginEmail(String value) {
    print('Storing Login Email: $value');
    prefs.write(loginEmail, value);
  }

  // get
  static String getGuestEmail() {
    return prefs.read(guestUserEmail) ?? '';
  }

  // set
  static void setGuestEmail(String value) {
    print('Storing Guest Email: $value');
    prefs.write(guestUserEmail, value);
  }
  // get
  static String getGuestFName() {
    return prefs.read(guestUserFName) ?? '';
  }

  // set
  static void setGuestFName(String value) {
    print('Storing Guest FName: $value');
    prefs.write(guestUserFName, value);
  }
  // get
  static String getGuestLName() {
    return prefs.read(guestUserLName) ?? '';
  }

  // set
  static void setGuestLName(String value) {
    print('Storing Guest LName: $value');
    prefs.write(guestUserLName, value);
  }

  // get
  static String getGuestAddress() {
    return prefs.read(guestUserAddress) ?? '';
  }

  // set
  static void setGuestAddress(String value) {
    print('Storing Guest address: $value');
    prefs.write(guestUserAddress, value);
  }
  // get
  static String getGuestCity() {
    return prefs.read(guestUserCity) ?? '';
  }

  // set
  static void setGuestCity(String value) {
    print('Storing Guest City: $value');
    prefs.write(guestUserCity, value);
  }

  // get
  static String getGuestPhone() {
    return prefs.read(guestUserPhone) ?? '';
  }

  // set
  static void setGuestPhone(String value) {
    print('Storing Guest Phone: $value');
    prefs.write(guestUserPhone, value);
  }

  // get
  static String getCToken() {
    return prefs.read(customerToken) ?? '';
  }

  // set
  static void setCToken(String value) {
    print('Storing Customer Token: $value');
    prefs.write(customerToken, value);
  }

  // get
  static String getCartNote() {
    return prefs.read(cartNote) ?? '';
  }

  // set
  static void setCartNote(String value) {
    print('Storing Cart Note: $value');
    prefs.write(cartNote, value);
  }

  // get cart id
  static String getCartId() {
    return prefs.read(cartId) ?? '';
  }

  // set cart id
  static void setCartId(String value) {
    print('Storing Cart Id : $value');
    prefs.write(cartId, value);
  }

  // get cart id
  static String getCartCheckOutId() {
    return prefs.read(cartCheckOutId) ?? '';
  }

  // set cart id
  static void setCartCheckOutId(String value) {
    print('Storing checkout Id : $value');
    prefs.write(cartCheckOutId, value);
  }

  // get cart id
  static String getGuestCheckOutId() {
    return prefs.read(guestCheckOutId) ?? '';
  }

  // set cart id
  static void setGuestCheckOutId(String value) {
    print('Storing checkout Id : $value');
    prefs.write(guestCheckOutId, value);
  }

  // get cart id
  static double getExchangeRate() {
    return prefs.read(exChangeRate) ?? 1450.0;
  }

  // set cart id
  static void setExchangeRate(double value) {
    print('Storing Exchange Rate : $value');
    prefs.write(exChangeRate, value);
  }

  // get
  static String getLoginPass() {
    return prefs.read(loginPass) ?? '';
  }

  // set
  static void setLoginPass(String value) {
    print('Storing Login Password: $value');
    prefs.write(loginPass, value);
  }

  // get
  static List<String> getPromoCode() {
    return prefs.read(promoCodes) ?? [];
  }

  // set
  static void setPromoCodes(List<String> value) {
    print('Storing Code lIst : $value');
    prefs.write(promoCodes, value);
  }

  // get
  static List<String> getPromoImages() {
    return prefs.read(promoImages) ?? [];
  }

  // set
  static void setPromoImages(List<String> value) {
    print('Storing Promo Images lIst : $value');
    prefs.write(promoImages, value);
  }

  /*// get
  static UserModel getUserDetails() {
    var result = prefs.read(userDetails);
    return UserModel.fromJson(json.decode(result));
  }

  // set
  static void setUserDetails(UserModel value) {
    print('Storing Customer Details: ${json.encode(value.toJson())}');
    prefs.write(userDetails, json.encode(value.toJson()));
  }*/

/*
  // get dp
  static String getUserDP() => prefs.read(userDP) ?? '';

  // set dp
  static void setUserDP(String value) => prefs.write(userDP, value);
*/

  static void logoutFn() {
    print("Removing user details");
    prefs.remove(loggedInFlag);
    prefs.remove(userDetails);
  }

  static void logOut() {
    prefs.remove(loggedInFlag);
    prefs.remove(userDetails);
  }

  static void clearAll() {
    prefs.erase();
    print('All Data has Cleared!');
  }
}
