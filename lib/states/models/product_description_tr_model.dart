// To parse this JSON data, do
//
//     final productDescriptionTrModel = productDescriptionTrModelFromJson(jsonString);

import 'dart:convert';

class ProductDescriptionTrModel {
  Product product;

  ProductDescriptionTrModel({
    required this.product,
  });

  factory ProductDescriptionTrModel.fromRawJson(String str) => ProductDescriptionTrModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductDescriptionTrModel.fromJson(Map<String, dynamic> json) => ProductDescriptionTrModel(
    product: Product.fromJson(json["product"]??{}),
  );

  Map<String, dynamic> toJson() => {
    "product": product.toJson(),
  };
}

class Product {
  Metafield metafield;

  Product({
    required this.metafield,
  });

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    metafield: Metafield.fromJson(json["metafield"]??{}),
  );

  Map<String, dynamic> toJson() => {
    "metafield": metafield.toJson(),
  };
}

class Metafield {
  String value;
  String type;

  Metafield({
    required this.value,
    required this.type,
  });

  factory Metafield.fromRawJson(String str) => Metafield.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Metafield.fromJson(Map<String, dynamic> json) => Metafield(
    value: json["value"]??'',
    type: json["type"]??'',
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "type": type,
  };
}
