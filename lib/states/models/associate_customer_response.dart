// To parse this JSON data, do
//
//     final associateCustomerResponse = associateCustomerResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class AssociateCustomerResponse {
  AssociateCustomerResponse({
    required this.checkoutCustomerAssociateV2,
  });

  CheckoutCustomerAssociateV2 checkoutCustomerAssociateV2;

  factory AssociateCustomerResponse.fromRawJson(String str) => AssociateCustomerResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AssociateCustomerResponse.fromJson(Map<String, dynamic> json) => AssociateCustomerResponse(
    checkoutCustomerAssociateV2: CheckoutCustomerAssociateV2.fromJson(json["checkoutCustomerAssociateV2"]),
  );

  Map<String, dynamic> toJson() => {
    "checkoutCustomerAssociateV2": checkoutCustomerAssociateV2.toJson(),
  };
}

class CheckoutCustomerAssociateV2 {
  CheckoutCustomerAssociateV2({
    required this.checkout,
    required this.checkoutUserErrors,
    required this.customer,
  });

  Checkout checkout;
  List<dynamic> checkoutUserErrors;
  Customer customer;

  factory CheckoutCustomerAssociateV2.fromRawJson(String str) => CheckoutCustomerAssociateV2.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CheckoutCustomerAssociateV2.fromJson(Map<String, dynamic> json) => CheckoutCustomerAssociateV2(
    checkout: Checkout.fromJson(json["checkout"]??{}),
    checkoutUserErrors: List<dynamic>.from(json["checkoutUserErrors"].map((x) => x)),
    customer: Customer.fromJson(json["customer"]??{}),
  );

  Map<String, dynamic> toJson() => {
    "checkout": checkout.toJson(),
    "checkoutUserErrors": List<dynamic>.from(checkoutUserErrors.map((x) => x)),
    "customer": customer.toJson(),
  };
}

class Checkout {
  Checkout({
    required this.id,
    required this.totalPrice,
  });

  String id;
  TotalPrice totalPrice;

  factory Checkout.fromRawJson(String str) => Checkout.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Checkout.fromJson(Map<String, dynamic> json) => Checkout(
    id: json["id"]??'',
    totalPrice: TotalPrice.fromJson(json["totalPrice"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "totalPrice": totalPrice.toJson(),
  };
}

class TotalPrice {
  TotalPrice({
    required this.amount,
  });

  String amount;

  factory TotalPrice.fromRawJson(String str) => TotalPrice.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TotalPrice.fromJson(Map<String, dynamic> json) => TotalPrice(
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
  };
}

class Customer {
  Customer({
    required this.id,
    required this.email,
    required this.phone,
  });

  dynamic id;
  String email;
  String phone;

  factory Customer.fromRawJson(String str) => Customer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    id: json["id"],
    email: json["email"]??'',
    phone: json["phone"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "phone": phone,
  };
}
