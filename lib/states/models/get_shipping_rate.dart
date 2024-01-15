// To parse this JSON data, do
//
//     final getShippingRateResponse = getShippingRateResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class GetShippingRateResponse {
  GetShippingRateResponse({
    required this.node,
  });

  Node node;

  factory GetShippingRateResponse.fromRawJson(String str) => GetShippingRateResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetShippingRateResponse.fromJson(Map<String, dynamic> json) => GetShippingRateResponse(
    node: Node.fromJson(json["node"]),
  );

  Map<String, dynamic> toJson() => {
    "node": node.toJson(),
  };
}

class Node {
  Node({
    required this.id,
    required this.webUrl,
    required this.totalPrice,
    required this.availableShippingRates,
  });

  String id;
  String webUrl;
  Price totalPrice;
  AvailableShippingRates availableShippingRates;

  factory Node.fromRawJson(String str) => Node.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Node.fromJson(Map<String, dynamic> json) => Node(
    id: json["id"],
    webUrl: json["webUrl"],
    totalPrice: Price.fromJson(json["totalPrice"]),
    availableShippingRates: AvailableShippingRates.fromJson(json["availableShippingRates"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "webUrl": webUrl,
    "totalPrice": totalPrice.toJson(),
    "availableShippingRates": availableShippingRates.toJson(),
  };
}

class AvailableShippingRates {
  AvailableShippingRates({
    required this.ready,
    required this.shippingRates,
  });

  bool ready;
  List<ShippingRate> shippingRates;

  factory AvailableShippingRates.fromRawJson(String str) => AvailableShippingRates.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AvailableShippingRates.fromJson(Map<String, dynamic> json) => AvailableShippingRates(
    ready: json["ready"],
    shippingRates: List<ShippingRate>.from(json["shippingRates"].map((x) => ShippingRate.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ready": ready,
    "shippingRates": List<dynamic>.from(shippingRates.map((x) => x.toJson())),
  };
}

class ShippingRate {
  ShippingRate({
    required this.handle,
    required this.price,
    required this.title,
  });

  String handle;
  Price price;
  String title;

  factory ShippingRate.fromRawJson(String str) => ShippingRate.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ShippingRate.fromJson(Map<String, dynamic> json) => ShippingRate(
    handle: json["handle"],
    price: Price.fromJson(json["price"]),
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "handle": handle,
    "price": price.toJson(),
    "title": title,
  };
}

class Price {
  Price({
    required this.amount,
  });

  String amount;

  factory Price.fromRawJson(String str) => Price.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
  };
}
