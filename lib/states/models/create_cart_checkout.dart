// To parse this JSON data, do
//
//     final createCheckoutCartResponse = createCheckoutCartResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class CreateCheckoutCartResponse {
  CreateCheckoutCartResponse({
    required this.checkoutCreate,
  });

  CheckoutCreate checkoutCreate;

  factory CreateCheckoutCartResponse.fromRawJson(String str) => CreateCheckoutCartResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreateCheckoutCartResponse.fromJson(Map<String, dynamic> json) => CreateCheckoutCartResponse(
    checkoutCreate: CheckoutCreate.fromJson(json["checkoutCreate"]),
  );

  Map<String, dynamic> toJson() => {
    "checkoutCreate": checkoutCreate.toJson(),
  };
}

class CheckoutCreate {
  CheckoutCreate({
    required this.checkout,
  });

  Checkout checkout;

  factory CheckoutCreate.fromRawJson(String str) => CheckoutCreate.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CheckoutCreate.fromJson(Map<String, dynamic> json) => CheckoutCreate(
    checkout: Checkout.fromJson(json["checkout"]),
  );

  Map<String, dynamic> toJson() => {
    "checkout": checkout.toJson(),
  };
}

class Checkout {
  Checkout({
    required this.id,
    required this.webUrl,
    required this.lineItems,
  });

  String id;
  String webUrl;
  LineItems lineItems;

  factory Checkout.fromRawJson(String str) => Checkout.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Checkout.fromJson(Map<String, dynamic> json) => Checkout(
    id: json["id"],
    webUrl: json["webUrl"],
    lineItems: LineItems.fromJson(json["lineItems"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "webUrl": webUrl,
    "lineItems": lineItems.toJson(),
  };
}

class LineItems {
  LineItems({
    required this.edges,
  });

  List<Edge> edges;

  factory LineItems.fromRawJson(String str) => LineItems.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LineItems.fromJson(Map<String, dynamic> json) => LineItems(
    edges: List<Edge>.from(json["edges"].map((x) => Edge.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "edges": List<dynamic>.from(edges.map((x) => x.toJson())),
  };
}

class Edge {
  Edge({
    required this.node,
  });

  Node node;

  factory Edge.fromRawJson(String str) => Edge.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Edge.fromJson(Map<String, dynamic> json) => Edge(
    node: Node.fromJson(json["node"]),
  );

  Map<String, dynamic> toJson() => {
    "node": node.toJson(),
  };
}

class Node {
  String id;
  String title;
  int quantity;
  Variant variant;

  Node({
    required this.id,
    required this.title,
    required this.quantity,
    required this.variant,
  });

  factory Node.fromRawJson(String str) => Node.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Node.fromJson(Map<String, dynamic> json) => Node(
    id: json["id"],
    title: json["title"],
    quantity: json["quantity"],
    variant: Variant.fromJson(json["variant"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "quantity": quantity,
    "variant": variant.toJson(),
  };
}

class Variant {
  Price price;

  Variant({
    required this.price,
  });

  factory Variant.fromRawJson(String str) => Variant.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
    price: Price.fromJson(json["price"]),
  );

  Map<String, dynamic> toJson() => {
    "price": price.toJson(),
  };
}

class Price {
  String amount;

  Price({
    required this.amount,
  });

  factory Price.fromRawJson(String str) => Price.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
  };
}
