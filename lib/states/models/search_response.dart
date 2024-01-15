// To parse this JSON data, do
//
//     final searchResponse = searchResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class SearchResponse {
  SearchResponse({
    required this.products,
  });

  Products products;

  factory SearchResponse.fromRawJson(String str) => SearchResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
    products: Products.fromJson(json["products"]),
  );

  Map<String, dynamic> toJson() => {
    "products": products.toJson(),
  };
}

class Products {
  Products({
    required this.edges,
  });

  List<ProductsEdge> edges;

  factory Products.fromRawJson(String str) => Products.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    edges: List<ProductsEdge>.from(json["edges"].map((x) => ProductsEdge.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "edges": List<dynamic>.from(edges.map((x) => x.toJson())),
  };
}

class ProductsEdge {
  ProductsEdge({
    required this.node,
  });

  PurpleSearchNode node;

  factory ProductsEdge.fromRawJson(String str) => ProductsEdge.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductsEdge.fromJson(Map<String, dynamic> json) => ProductsEdge(
    node: PurpleSearchNode.fromJson(json["node"]),
  );

  Map<String, dynamic> toJson() => {
    "node": node.toJson(),
  };
}

class PurpleSearchNode {
  PurpleSearchNode({
    required this.id,
    required this.title,
    required this.vendor,
    required this.handle,
    required this.productType,
    required this.images,
    required this.variants,
  });

  String id;
  String title;
  String vendor;
  String handle;
  String productType;
  Images images;
  Variants variants;

  factory PurpleSearchNode.fromRawJson(String str) => PurpleSearchNode.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PurpleSearchNode.fromJson(Map<String, dynamic> json) => PurpleSearchNode(
    id: json["id"],
    title: json["title"],
    vendor: json["vendor"],
    handle: json["handle"],
    productType:json["productType"],
    images: Images.fromJson(json["images"]),
    variants: Variants.fromJson(json["variants"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "vendor": vendorValues.reverse[vendor],
    "handle": handle,
    "productType": productTypeValues.reverse[productType],
    "images": images.toJson(),
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

  FluffyNode node;

  factory ImagesEdge.fromRawJson(String str) => ImagesEdge.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ImagesEdge.fromJson(Map<String, dynamic> json) => ImagesEdge(
    node: FluffyNode.fromJson(json["node"]),
  );

  Map<String, dynamic> toJson() => {
    "node": node.toJson(),
  };
}

class FluffyNode {
  FluffyNode({
    required this.originalSrc,
  });

  String originalSrc;

  factory FluffyNode.fromRawJson(String str) => FluffyNode.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FluffyNode.fromJson(Map<String, dynamic> json) => FluffyNode(
    originalSrc: json["originalSrc"],
  );

  Map<String, dynamic> toJson() => {
    "originalSrc": originalSrc,
  };
}

enum ProductType { REFRIGERATOR }

final productTypeValues = EnumValues({
  "Refrigerator": ProductType.REFRIGERATOR
});

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

  TentacledNode node;

  factory VariantsEdge.fromRawJson(String str) => VariantsEdge.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VariantsEdge.fromJson(Map<String, dynamic> json) => VariantsEdge(
    node: TentacledNode.fromJson(json["node"]),
  );

  Map<String, dynamic> toJson() => {
    "node": node.toJson(),
  };
}

class TentacledNode {
  TentacledNode({
    required this.sku,
    required this.barcode,
    required this.availableForSale,
    required this.id,
    required this.compareAtPrice,
    required this.price,
  });

  String sku;
  String barcode;
  bool availableForSale;
  String id;
  dynamic compareAtPrice;
  Price price;

  factory TentacledNode.fromRawJson(String str) => TentacledNode.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TentacledNode.fromJson(Map<String, dynamic> json) => TentacledNode(
    sku: json["sku"],
    barcode: json["barcode"]??'',
    availableForSale: json["availableForSale"],
    id: json["id"],
    compareAtPrice: json["compareAtPrice"],
    price: Price.fromJson(json["price"]),
  );

  Map<String, dynamic> toJson() => {
    "sku": sku,
    "barcode": barcode,
    "availableForSale": availableForSale,
    "id": id,
    "compareAtPrice": compareAtPrice,
    "price": price.toJson(),
  };
}

class Price {
  Price({
    required this.amount,
    required this.currencyCode,
  });

  String amount;
  String currencyCode;

  factory Price.fromRawJson(String str) => Price.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    amount: json["amount"],
    currencyCode:json["currencyCode"]??'',
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "currencyCode": currencyCodeValues.reverse[currencyCode],
  };
}

enum CurrencyCode { USD }

final currencyCodeValues = EnumValues({
  "USD": CurrencyCode.USD
});

enum Vendor { SAMSUNG, PANASONIC }

final vendorValues = EnumValues({
  "Panasonic": Vendor.PANASONIC,
  "Samsung": Vendor.SAMSUNG
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
