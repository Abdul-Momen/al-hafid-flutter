// To parse this JSON data, do
//
//     final registrationModel = registrationModelFromJson(jsonString);

import 'dart:convert';

class RegistrationModel {
  RegistrationModel({
    required this.customer,
  });

  Customer customer;

  factory RegistrationModel.fromRawJson(String str) => RegistrationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegistrationModel.fromJson(Map<String, dynamic> json) => RegistrationModel(
    customer: Customer.fromJson(json["customer"]),
  );

  Map<String, dynamic> toJson() => {
    "customer": customer.toJson(),
  };
}

class Customer {
  Customer({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.verifiedEmail,
    required this.addresses,
    required this.password,
    required this.passwordConfirmation,
    required this.sendEmailWelcome,
  });

  String firstName;
  String lastName;
  String email;
  String phone;
  bool verifiedEmail;
  List<dynamic> addresses;
  String password;
  String passwordConfirmation;
  bool sendEmailWelcome;

  factory Customer.fromRawJson(String str) => Customer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    phone: json["phone"],
    verifiedEmail: json["verified_email"],
    addresses: List<dynamic>.from(json["addresses"].map((x) => x)),
    password: json["password"],
    passwordConfirmation: json["password_confirmation"],
    sendEmailWelcome: json["send_email_welcome"],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "phone": phone,
    "verified_email": verifiedEmail,
    "addresses": List<dynamic>.from(addresses.map((x) => x)),
    "password": password,
    "password_confirmation": passwordConfirmation,
    "send_email_welcome": sendEmailWelcome,
  };
}
