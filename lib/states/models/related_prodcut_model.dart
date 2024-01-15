// To parse this JSON data, do
//
//     final recommendProduct = recommendProductFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class RecommendProduct {
  RecommendProduct({
    required this.productRecommendations,
  });

  List<ProductRecommendation> productRecommendations;

  factory RecommendProduct.fromRawJson(String str) => RecommendProduct.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RecommendProduct.fromJson(Map<String, dynamic> json) => RecommendProduct(
    productRecommendations: List<ProductRecommendation>.from(json["productRecommendations"].map((x) => ProductRecommendation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "productRecommendations": List<dynamic>.from(productRecommendations.map((x) => x.toJson())),
  };
}

class ProductRecommendation {
  ProductRecommendation({
    required this.id,
    required this.title,
    required this.handle,
    required this.vendor,
    required this.tags,
    required this.images,
    required this.productType,
    required this.variants,
  });

  String id;
  String title;
  String vendor;
  dynamic tags;
  String handle;
  Images images;
  String productType;
  Variants variants;

  factory ProductRecommendation.fromRawJson(String str) => ProductRecommendation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductRecommendation.fromJson(Map<String, dynamic> json) => ProductRecommendation(
    id: json["id"],
    title: json["title"],
    vendor: json["vendor"]??'',
    tags: json["tags"]??'',
    handle: json["handle"],
    images: Images.fromJson(json["images"]),
    productType: json["productType"]??'',
    variants: Variants.fromJson(json["variants"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "vendor": vendor,
    "handle": handle,
    "tags": tags,
    "images": images.toJson(),
    "productType": productType,
    "variants": variants.toJson(),
  };
}

class Images {
  Images({
    required this.edges,
  });

  List<ImagesEdge> edges;

  factory Images.fromRawJson(String str) => Images.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    edges: List<ImagesEdge>.from(json["edges"].map((x) => ImagesEdge.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "edges": List<dynamic>.from(edges.map((x) => x.toJson())),
  };
}

class ImagesEdge {
  ImagesEdge({
    required this.node,
  });

  PurpleNode node;

  factory ImagesEdge.fromRawJson(String str) => ImagesEdge.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ImagesEdge.fromJson(Map<String, dynamic> json) => ImagesEdge(
    node: PurpleNode.fromJson(json["node"]),
  );

  Map<String, dynamic> toJson() => {
    "node": node.toJson(),
  };
}

class PurpleNode {
  PurpleNode({
    required this.originalSrc,
    required this.altText,
  });

  String originalSrc;
  dynamic altText;

  factory PurpleNode.fromRawJson(String str) => PurpleNode.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PurpleNode.fromJson(Map<String, dynamic> json) => PurpleNode(
    originalSrc: json["originalSrc"],
    altText: json["altText"],
  );

  Map<String, dynamic> toJson() => {
    "originalSrc": originalSrc,
    "altText": altText,
  };
}

enum ProductType { WALL_MOUNTED_SPLIT_AC }

class Variants {
  Variants({
    required this.edges,
  });

  List<VariantsEdge> edges;

  factory Variants.fromRawJson(String str) => Variants.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Variants.fromJson(Map<String, dynamic> json) => Variants(
    edges: List<VariantsEdge>.from(json["edges"].map((x) => VariantsEdge.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "edges": List<dynamic>.from(edges.map((x) => x.toJson())),
  };
}

class VariantsEdge {
  VariantsEdge({
    required this.node,
  });

  FluffyNode node;

  factory VariantsEdge.fromRawJson(String str) => VariantsEdge.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VariantsEdge.fromJson(Map<String, dynamic> json) => VariantsEdge(
    node: FluffyNode.fromJson(json["node"]),
  );

  Map<String, dynamic> toJson() => {
    "node": node.toJson(),
  };
}

class FluffyNode {
  FluffyNode({
    required this.id,
    required this.sku,
    required this.availableForSale,
    required this.compareAtPriceV2,
    required this.priceV2,
  });

  String id;
  String sku;
  bool availableForSale;
  PriceV2 compareAtPriceV2;
  PriceV2 priceV2;

  factory FluffyNode.fromRawJson(String str) => FluffyNode.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FluffyNode.fromJson(Map<String, dynamic> json) => FluffyNode(
    id: json["id"],
    sku: json["sku"],
    availableForSale: json["availableForSale"],
    compareAtPriceV2: PriceV2.fromJson(json["compareAtPriceV2"]??{}),
    priceV2: PriceV2.fromJson(json["priceV2"]??{}),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sku": sku,
    "availableForSale": availableForSale,
    "compareAtPriceV2": compareAtPriceV2.toJson(),
    "priceV2": priceV2.toJson(),
  };
}

class PriceV2 {
  PriceV2({
    required this.amount,
    required this.currencyCode,
  });

  String amount;
  String currencyCode;

  factory PriceV2.fromRawJson(String str) => PriceV2.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PriceV2.fromJson(Map<String, dynamic> json) => PriceV2(
    amount: json["amount"]??'',
    currencyCode: json["currencyCode"]??'',
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "currencyCode": currencyCode,
  };
}



class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
