// To parse this JSON data, do
//
//     final productDetailsModel = productDetailsModelFromJson(jsonString);

import 'dart:convert';

class ProductDetailsModel {
  ProductDetailsModel({
    required this.product,
  });

  DProduct product;

  factory ProductDetailsModel.fromRawJson(String str) => ProductDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) => ProductDetailsModel(
    product: DProduct.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "product": product.toJson(),
  };
}

class DProduct {
  DProduct({
    required this.id,
    required this.title,
    required this.bodyHtml,
    required this.vendor,
    required this.productType,
    required this.createdAt,
    required this.handle,
    required this.updatedAt,
    required this.publishedAt,
    required this.templateSuffix,
    required this.status,
    required this.publishedScope,
    required this.tags,
    required this.adminGraphqlApiId,
    required this.variants,
   // required this.options,
    required this.images,
    required this.image,
  });

  int id;
  String title;
  String bodyHtml;
  String vendor;
  String productType;
  String createdAt;
  String handle;
  String updatedAt;
  String publishedAt;
  String templateSuffix;
  String status;
  String publishedScope;
  String tags;
  String adminGraphqlApiId;
  List<Variant> variants;
 // List<Option> options;
  List<Image> images;
  Image image;

  factory DProduct.fromRawJson(String str) => DProduct.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DProduct.fromJson(Map<String, dynamic> json) => DProduct(
    id: json["id"],
    title: json["title"],
    bodyHtml: json["body_html"],
    vendor: json["vendor"],
    productType: json["product_type"],
    createdAt: json["created_at"],
    handle: json["handle"],
    updatedAt:json["updated_at"],
    publishedAt:json["published_at"]??'',
    templateSuffix: json["template_suffix"]??'',
    status: json["status"],
    publishedScope: json["published_scope"],
    tags: json["tags"],
    adminGraphqlApiId: json["admin_graphql_api_id"],
    variants: List<Variant>.from(json["variants"].map((x) => Variant.fromJson(x))),
   // options: List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    image: Image.fromJson(json["image"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "body_html": bodyHtml,
    "vendor": vendor,
    "product_type": productType,
    "created_at": createdAt,
    "handle": handle,
    "updated_at": updatedAt,
    "published_at": publishedAt,
    "template_suffix": templateSuffix,
    "status": status,
    "published_scope": publishedScope,
    "tags": tags,
    "admin_graphql_api_id": adminGraphqlApiId,
    "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
    //"options": List<dynamic>.from(options.map((x) => x.toJson())),
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "image": image.toJson(),
  };
}

class Image {
  Image({
    required this.id,
    required this.productId,
    required this.position,
    required this.createdAt,
    required this.updatedAt,
    this.alt,
    required this.width,
    required this.height,
    required this.src,
    required this.variantIds,
    required this.adminGraphqlApiId,
  });

  int id;
  int productId;
  int position;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic alt;
  int width;
  int height;
  String src;
  List<dynamic> variantIds;
  String adminGraphqlApiId;

  factory Image.fromRawJson(String str) => Image.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json["id"],
    productId: json["product_id"],
    position: json["position"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    alt: json["alt"],
    width: json["width"],
    height: json["height"],
    src: json["src"],
    variantIds: List<dynamic>.from(json["variant_ids"].map((x) => x)),
    adminGraphqlApiId: json["admin_graphql_api_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "position": position,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "alt": alt,
    "width": width,
    "height": height,
    "src": src,
    "variant_ids": List<dynamic>.from(variantIds.map((x) => x)),
    "admin_graphql_api_id": adminGraphqlApiId,
  };
}

/*class Option {
  Option({
    required this.id,
    required this.productId,
    required this.name,
    required this.position,
    required this.values,
  });

  int id;
  int productId;
  String name;
  int position;
  List<String> values;

  factory Option.fromRawJson(String str) => Option.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Option.fromJson(Map<String, dynamic> json) => Option(
    id: json["id"],
    productId: json["product_id"],
    name: json["name"],
    position: json["position"],
    values: List<String>.from(json["values"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "name": name,
    "position": position,
    "values": List<dynamic>.from(values.map((x) => x)),
  };
}*/

class Variant {
  Variant({
    required this.id,
    required this.productId,
    required this.title,
    required this.price,
    required this.sku,
    required this.position,
    required this.inventoryPolicy,
    this.compareAtPrice,
    required this.fulfillmentService,
    required this.inventoryManagement,
    required this.option1,
    this.option2,
    this.option3,
    required this.createdAt,
    required this.updatedAt,
    required this.taxable,
    required this.barcode,
    required this.grams,
    this.imageId,
    required this.weight,
    required this.weightUnit,
    required this.inventoryItemId,
    required this.inventoryQuantity,
    required this.oldInventoryQuantity,
    required this.requiresShipping,
    required this.adminGraphqlApiId,
  });

  int id;
  int productId;
  String title;
  String price;
  String sku;
  int position;
  String inventoryPolicy;
  dynamic compareAtPrice;
  String fulfillmentService;
  String inventoryManagement;
  String option1;
  dynamic option2;
  dynamic option3;
  DateTime createdAt;
  DateTime updatedAt;
  bool taxable;
  String barcode;
  int grams;
  dynamic imageId;
  double weight;
  String weightUnit;
  int inventoryItemId;
  int inventoryQuantity;
  int oldInventoryQuantity;
  bool requiresShipping;
  String adminGraphqlApiId;

  factory Variant.fromRawJson(String str) => Variant.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
    id: json["id"],
    productId: json["product_id"],
    title: json["title"],
    price: json["price"],
    sku: json["sku"],
    position: json["position"],
    inventoryPolicy: json["inventory_policy"],
    compareAtPrice: json["compare_at_price"],
    fulfillmentService: json["fulfillment_service"],
    inventoryManagement: json["inventory_management"],
    option1: json["option1"],
    option2: json["option2"],
    option3: json["option3"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    taxable: json["taxable"],
    barcode: json["barcode"]??'',
    grams: json["grams"]??0,
    imageId: json["image_id"],
    weight: json["weight"]??0,
    weightUnit: json["weight_unit"],
    inventoryItemId: json["inventory_item_id"],
    inventoryQuantity: json["inventory_quantity"],
    oldInventoryQuantity: json["old_inventory_quantity"],
    requiresShipping: json["requires_shipping"],
    adminGraphqlApiId: json["admin_graphql_api_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "title": title,
    "price": price,
    "sku": sku,
    "position": position,
    "inventory_policy": inventoryPolicy,
    "compare_at_price": compareAtPrice,
    "fulfillment_service": fulfillmentService,
    "inventory_management": inventoryManagement,
    "option1": option1,
    "option2": option2,
    "option3": option3,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "taxable": taxable,
    "barcode": barcode,
    "grams": grams,
    "image_id": imageId,
    "weight": weight,
    "weight_unit": weightUnit,
    "inventory_item_id": inventoryItemId,
    "inventory_quantity": inventoryQuantity,
    "old_inventory_quantity": oldInventoryQuantity,
    "requires_shipping": requiresShipping,
    "admin_graphql_api_id": adminGraphqlApiId,
  };
}
