// To parse this JSON data, do
//
//     final relatedProductModel = relatedProductModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class RelatedProductModel {
  RelatedProductModel({
    required this.products,
    required this.intent,
  });

  List<RelatedProduct> products;
  String intent;

  factory RelatedProductModel.fromRawJson(String str) => RelatedProductModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RelatedProductModel.fromJson(Map<String, dynamic> json) => RelatedProductModel(
    products: List<RelatedProduct>.from(json["products"].map((x) => RelatedProduct.fromJson(x))),
    intent: json["intent"],
  );

  Map<String, dynamic> toJson() => {
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "intent": intent,
  };
}

class RelatedProduct {
  RelatedProduct({
    required this.id,
    required this.title,
    required this.handle,
    required this.description,
    required this.publishedAt,
    required this.createdAt,
    required this.vendor,
    required this.type,
    required this.tags,
    required this.price,
    required this.priceMin,
    required this.priceMax,
    required this.available,
    required this.priceVaries,
    required this.compareAtPrice,
    required this.compareAtPriceMin,
    required this.compareAtPriceMax,
    required this.compareAtPriceVaries,
    required this.variants,
    required this.images,
    required this.featuredImage,
    required this.options,
    required this.url,
    required this.media,
  });

  int id;
  String title;
  String handle;
  String description;
  DateTime publishedAt;
  DateTime createdAt;
  String vendor;
  String type;
  List<String> tags;
  dynamic price;
  int priceMin;
  int priceMax;
  bool available;
  bool priceVaries;
  int compareAtPrice;
  int compareAtPriceMin;
  int compareAtPriceMax;
  bool compareAtPriceVaries;
  List<Variant> variants;
  List<String> images;
  String featuredImage;
  List<Option> options;
  String url;
  List<Media> media;

  factory RelatedProduct.fromRawJson(String str) => RelatedProduct.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RelatedProduct.fromJson(Map<String, dynamic> json) => RelatedProduct(
    id: json["id"],
    title: json["title"],
    handle: json["handle"],
    description: json["description"],
    publishedAt: DateTime.parse(json["published_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    vendor: json["vendor"],
    type: json["type"],
    tags: List<String>.from(json["tags"].map((x) => x)),
    price: json["price"],
    priceMin: json["price_min"],
    priceMax: json["price_max"],
    available: json["available"],
    priceVaries: json["price_varies"],
    compareAtPrice: json["compare_at_price"]??0,
    compareAtPriceMin: json["compare_at_price_min"]??0,
    compareAtPriceMax: json["compare_at_price_max"]??0,
    compareAtPriceVaries: json["compare_at_price_varies"],
    variants: List<Variant>.from(json["variants"].map((x) => Variant.fromJson(x))),
    images: List<String>.from(json["images"].map((x) => x)),
    featuredImage: json["featured_image"],
    options: List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
    url: json["url"],
    media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "handle": handle,
    "description": description,
    "published_at": publishedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "vendor": vendor,
    "type": type,
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "price": price,
    "price_min": priceMin,
    "price_max": priceMax,
    "available": available,
    "price_varies": priceVaries,
    "compare_at_price": compareAtPrice,
    "compare_at_price_min": compareAtPriceMin,
    "compare_at_price_max": compareAtPriceMax,
    "compare_at_price_varies": compareAtPriceVaries,
    "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
    "images": List<dynamic>.from(images.map((x) => x)),
    "featured_image": featuredImage,
    "options": List<dynamic>.from(options.map((x) => x.toJson())),
    "url": url,
    "media": List<dynamic>.from(media.map((x) => x.toJson())),
  };
}

class Media {
  Media({
    required this.alt,
    required this.id,
    required this.position,
    required this.previewImage,
    required this.aspectRatio,
    required this.height,
    required this.mediaType,
    required this.src,
    required this.width,
  });

  dynamic alt;
  int id;
  int position;
  PreviewImage previewImage;
  double aspectRatio;
  int height;
  String mediaType;
  String src;
  int width;

  factory Media.fromRawJson(String str) => Media.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    alt: json["alt"],
    id: json["id"],
    position: json["position"],
    previewImage: PreviewImage.fromJson(json["preview_image"]),
    aspectRatio: json["aspect_ratio"].toDouble(),
    height: json["height"],
    mediaType:json["media_type"],
    src: json["src"],
    width: json["width"],
  );

  Map<String, dynamic> toJson() => {
    "alt": alt,
    "id": id,
    "position": position,
    "preview_image": previewImage.toJson(),
    "aspect_ratio": aspectRatio,
    "height": height,
    "media_type": mediaType,
    "src": src,
    "width": width,
  };
}

enum MediaType { IMAGE }

final mediaTypeValues = EnumValues({
  "image": MediaType.IMAGE
});

class PreviewImage {
  PreviewImage({
    required this.aspectRatio,
    required this.height,
    required this.width,
    required this.src,
  });

  double aspectRatio;
  int height;
  int width;
  String src;

  factory PreviewImage.fromRawJson(String str) => PreviewImage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PreviewImage.fromJson(Map<String, dynamic> json) => PreviewImage(
    aspectRatio: json["aspect_ratio"].toDouble(),
    height: json["height"],
    width: json["width"],
    src: json["src"],
  );

  Map<String, dynamic> toJson() => {
    "aspect_ratio": aspectRatio,
    "height": height,
    "width": width,
    "src": src,
  };
}

class Option {
  Option({
    required this.name,
    required this.position,
    required this.values,
  });

  String name;
  int position;
  List<Option1> values;

  factory Option.fromRawJson(String str) => Option.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Option.fromJson(Map<String, dynamic> json) => Option(
    name: json["name"],
    position: json["position"],
    values: List<Option1>.from(json["values"].map((x) => option1Values.map[x])),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "position": position,
    "values": List<dynamic>.from(values.map((x) => option1Values.reverse[x])),
  };
}

enum Name { TITLE }

final nameValues = EnumValues({
  "Title": Name.TITLE
});

enum Option1 { DEFAULT_TITLE }

final option1Values = EnumValues({
  "Default Title": Option1.DEFAULT_TITLE
});

class Variant {
  Variant({
    required this.id,
    required this.title,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.sku,
    required this.requiresShipping,
    required this.taxable,
    required this.featuredImage,
    required this.available,
    required this.name,
    required this.publicTitle,
    required this.options,
    required this.price,
    required this.weight,
    required this.compareAtPrice,
    required this.inventoryManagement,
    required this.barcode,
  });

  int id;
  String title;
  String option1;
  dynamic option2;
  dynamic option3;
  String sku;
  bool requiresShipping;
  bool taxable;
  dynamic featuredImage;
  bool available;
  String name;
  dynamic publicTitle;
  List<Option1> options;
  int price;
  int weight;
  int compareAtPrice;
  String inventoryManagement;
  String barcode;

  factory Variant.fromRawJson(String str) => Variant.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
    id: json["id"],
    title:json["title"],
    option1: json["option1"],
    option2: json["option2"],
    option3: json["option3"],
    sku: json["sku"],
    requiresShipping: json["requires_shipping"],
    taxable: json["taxable"],
    featuredImage: json["featured_image"],
    available: json["available"],
    name: json["name"],
    publicTitle: json["public_title"],
    options: List<Option1>.from(json["options"].map((x) => option1Values.map[x])),
    price: json["price"],
    weight: json["weight"],
    compareAtPrice: json["compare_at_price"]??0,
    inventoryManagement: json["inventory_management"]??'',
    barcode: json["barcode"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title":title,
    "option1": option1,
    "option2": option2,
    "option3": option3,
    "sku": sku,
    "requires_shipping": requiresShipping,
    "taxable": taxable,
    "featured_image": featuredImage,
    "available": available,
    "name": name,
    "public_title": publicTitle,
    "options": List<dynamic>.from(options.map((x) => option1Values.reverse[x])),
    "price": price,
    "weight": weight,
    "compare_at_price": compareAtPrice,
    "inventory_management": inventoryManagement,
    "barcode": barcode,
  };
}

enum InventoryManagement { SHOPIFY }

final inventoryManagementValues = EnumValues({
  "shopify": InventoryManagement.SHOPIFY
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
