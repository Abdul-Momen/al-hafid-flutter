// To parse this JSON data, do
//
//     final retriveCartListModel = retriveCartListModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class RetriveCartListModel {
  RetriveCartListModel({
    required this.cart,
  });

  Cart cart;

  factory RetriveCartListModel.fromRawJson(String str) => RetriveCartListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RetriveCartListModel.fromJson(Map<String, dynamic> json) => RetriveCartListModel(
    cart: Cart.fromJson(json["cart"]??{}),
  );

  Map<String, dynamic> toJson() => {
    "cart": cart.toJson(),
  };
}

class Cart {
  Cart({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.lines,
    required this.attributes,
    required this.cost,
    required this.buyerIdentity,
  });

  String id;
  String createdAt;
  String updatedAt;
  Lines lines;
  List<dynamic> attributes;
  Cost cost;
  BuyerIdentity buyerIdentity;

  factory Cart.fromRawJson(String str) => Cart.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    id: json["id"]??'',
    createdAt:json["createdAt"]??'',
    updatedAt: json["updatedAt"]??'',
    lines: Lines.fromJson(json["lines"]??{}),
    attributes: List<dynamic>.from(json["attributes"].map((x) => x)),
    cost: Cost.fromJson(json["cost"]??{}),
    buyerIdentity: BuyerIdentity.fromJson(json["buyerIdentity"]??{}),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "lines": lines.toJson(),
    "attributes": List<dynamic>.from(attributes.map((x) => x)),
    "cost": cost.toJson(),
    "buyerIdentity": buyerIdentity.toJson(),
  };
}

class BuyerIdentity {
  BuyerIdentity({
    required this.email,
    required this.phone,
    required this.customer,
    required this.countryCode,
  //  required this.deliveryAddressPreferences,
  });

  dynamic email;
  dynamic phone;
  dynamic customer;
  dynamic countryCode;
 // List<dynamic> deliveryAddressPreferences;

  factory BuyerIdentity.fromRawJson(String str) => BuyerIdentity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BuyerIdentity.fromJson(Map<String, dynamic> json) => BuyerIdentity(
    email: json["email"],
    phone: json["phone"],
    customer: json["customer"],
    countryCode: json["countryCode"],
    //deliveryAddressPreferences: List<dynamic>.from(json["deliveryAddressPreferences"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "phone": phone,
    "customer": customer,
    "countryCode": countryCode,
   // "deliveryAddressPreferences": List<dynamic>.from(deliveryAddressPreferences.map((x) => x)),
  };
}

class Cost {
  Cost({
    required this.totalAmount,
    required this.subtotalAmount,
    required this.totalTaxAmount,
    required this.totalDutyAmount,
  });

  SubtotalAmount totalAmount;
  SubtotalAmount subtotalAmount;
  dynamic totalTaxAmount;
  dynamic totalDutyAmount;

  factory Cost.fromRawJson(String str) => Cost.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Cost.fromJson(Map<String, dynamic> json) => Cost(
    totalAmount: SubtotalAmount.fromJson(json["totalAmount"]),
    subtotalAmount: SubtotalAmount.fromJson(json["subtotalAmount"]),
    totalTaxAmount: json["totalTaxAmount"],
    totalDutyAmount: json["totalDutyAmount"],
  );

  Map<String, dynamic> toJson() => {
    "totalAmount": totalAmount.toJson(),
    "subtotalAmount": subtotalAmount.toJson(),
    "totalTaxAmount": totalTaxAmount,
    "totalDutyAmount": totalDutyAmount,
  };
}

class SubtotalAmount {
  SubtotalAmount({
    required this.amount,
    required this.currencyCode,
  });

  String amount;
  String currencyCode;

  factory SubtotalAmount.fromRawJson(String str) => SubtotalAmount.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SubtotalAmount.fromJson(Map<String, dynamic> json) => SubtotalAmount(
    amount: json["amount"]??"",
    currencyCode: json["currencyCode"]??'',
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "currencyCode": currencyCode,
  };
}

class Lines {
  Lines({
    required this.edges,
  });

  List<Edge> edges;

  factory Lines.fromRawJson(String str) => Lines.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Lines.fromJson(Map<String, dynamic> json) => Lines(
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
  Node({
    required this.id,
    required this.quantity,
    required this.merchandise,
    required this.attributes,
  });

  String id;
  int quantity;
  Merchandise merchandise;
  List<dynamic> attributes;

  factory Node.fromRawJson(String str) => Node.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Node.fromJson(Map<String, dynamic> json) => Node(
    id: json["id"],
    quantity: json["quantity"],
    merchandise: Merchandise.fromJson(json["merchandise"]),
    attributes: List<dynamic>.from(json["attributes"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "quantity": quantity,
    "merchandise": merchandise.toJson(),
    "attributes": List<dynamic>.from(attributes.map((x) => x)),
  };
}

class Merchandise {
  Merchandise({
    required this.id,
    required this.product,
    required this.sku,
    required this.availableForSale,
    required this.compareAtPriceV2,
    required this.priceV2,
    required this.image,
  });

  String id;
  CProduct product;
  String sku;
  bool availableForSale;
  dynamic compareAtPriceV2;
  SubtotalAmount priceV2;
  Image image;

  factory Merchandise.fromRawJson(String str) => Merchandise.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Merchandise.fromJson(Map<String, dynamic> json) => Merchandise(
    id: json["id"],
    product: CProduct.fromJson(json["product"]),
    sku: json["sku"],
    availableForSale: json["availableForSale"],
    compareAtPriceV2: json["compareAtPriceV2"],
    priceV2: SubtotalAmount.fromJson(json["priceV2"]),
    image: Image.fromJson(json["image"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product": product.toJson(),
    "sku": sku,
    "availableForSale": availableForSale,
    "compareAtPriceV2": compareAtPriceV2,
    "priceV2": priceV2.toJson(),
    "image": image.toJson(),
  };
}

class Image {
  Image({
    required this.originalSrc,
    required this.altText,
  });

  String originalSrc;
  dynamic altText;

  factory Image.fromRawJson(String str) => Image.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    originalSrc: json["originalSrc"],
    altText: json["altText"],
  );

  Map<String, dynamic> toJson() => {
    "originalSrc": originalSrc,
    "altText": altText,
  };
}

class CProduct {
  CProduct({
    required this.title,
    required this.id,
  });

  String title;
  String id;

  factory CProduct.fromRawJson(String str) => CProduct.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CProduct.fromJson(Map<String, dynamic> json) => CProduct(
    title: json["title"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "id": id,
  };
}
