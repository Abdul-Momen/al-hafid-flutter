// To parse this JSON data, do
//
//     final setShippingRateResponse = setShippingRateResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class SetShippingRateResponse {
  SetShippingRateResponse({
    required this.checkoutShippingLineUpdate,
  });

  CheckoutShippingLineUpdate checkoutShippingLineUpdate;

  factory SetShippingRateResponse.fromRawJson(String str) => SetShippingRateResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SetShippingRateResponse.fromJson(Map<String, dynamic> json) => SetShippingRateResponse(
    checkoutShippingLineUpdate: CheckoutShippingLineUpdate.fromJson(json["checkoutShippingLineUpdate"]),
  );

  Map<String, dynamic> toJson() => {
    "checkoutShippingLineUpdate": checkoutShippingLineUpdate.toJson(),
  };
}

class CheckoutShippingLineUpdate {
  CheckoutShippingLineUpdate({
    required this.checkout,
    required this.checkoutUserErrors,
  });

  Checkout checkout;
  List<dynamic> checkoutUserErrors;

  factory CheckoutShippingLineUpdate.fromRawJson(String str) => CheckoutShippingLineUpdate.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CheckoutShippingLineUpdate.fromJson(Map<String, dynamic> json) => CheckoutShippingLineUpdate(
    checkout: Checkout.fromJson(json["checkout"]),
    checkoutUserErrors: List<dynamic>.from(json["checkoutUserErrors"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "checkout": checkout.toJson(),
    "checkoutUserErrors": List<dynamic>.from(checkoutUserErrors.map((x) => x)),
  };
}

class Checkout {
  Checkout({
    required this.id,
    required this.subtotalPrice,
    required this.totalPrice,
  });

  String id;
  TotalPrice subtotalPrice;
  TotalPrice totalPrice;

  factory Checkout.fromRawJson(String str) => Checkout.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Checkout.fromJson(Map<String, dynamic> json) => Checkout(
    id: json["id"],
    subtotalPrice: TotalPrice.fromJson(json["subtotalPrice"]),
    totalPrice: TotalPrice.fromJson(json["totalPrice"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "subtotalPrice": subtotalPrice.toJson(),
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
