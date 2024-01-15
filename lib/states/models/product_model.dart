// To parse this JSON data, do
//
//     final productListModel = productListModelFromJson(jsonString);

import 'dart:convert';

class ProductListModel {
  ProductListModel({
    required this.products,
  });

  List<Products> products;

  factory ProductListModel.fromRawJson(String str) =>
      ProductListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductListModel.fromJson(Map<String, dynamic> json) =>
      ProductListModel(
        products: List<Products>.from(
            json["products"].map((x) => Products.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Products {
  Products({
    required this.id,
    required this.title,
    required this.bodyHtml,
    required this.description,
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
    required this.options,
    required this.images,
    required this.image,
  });

  int id;
  String title;
  String bodyHtml;
  String description;
  String vendor;
  String productType;
  String createdAt;
  String handle;
  String updatedAt;
  String publishedAt;
  String templateSuffix;
  String status;
  String publishedScope;
  dynamic tags;
  String adminGraphqlApiId;
  List<Variant> variants;
  List<Option> options;
  List<PImage> images;
  PImage image;

  factory Products.fromRawJson(String str) =>
      Products.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"] ?? 0,
        title: json["title"],
        bodyHtml: json["body_html"] ?? '',
        description: json["description"] ?? '',
        vendor: json["vendor"] ?? "",
        productType: json["product_type"] ?? '',
        createdAt: json["created_at"] ?? "",
        handle: json["handle"] ?? '',
        updatedAt: json["updated_at"] ?? '',
        publishedAt: json["published_at"] ?? "",
        templateSuffix: json["template_suffix"] ?? '',
        status: json["status"] ?? '',
        publishedScope: json["published_scope"] ?? '',
        tags: json["tags"] ?? '',
        adminGraphqlApiId: json["admin_graphql_api_id"] ?? '',
        variants: List<Variant>.from(
            json["variants"].map((x) => Variant.fromJson(x)) ?? []),
        options: List<Option>.from(
            json["options"].map((x) => Option.fromJson(x)) ?? []),
        images: List<PImage>.from(
            json["images"].map((x) => PImage.fromJson(x)) ?? []),
        image: PImage.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body_html": bodyHtml,
        "description": description,
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
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "image": image.toJson(),
      };
}

class PImage {
  PImage({
    required this.id,
    required this.productId,
    required this.position,
    required this.createdAt,
    required this.updatedAt,
    required this.alt,
    required this.width,
    required this.height,
    required this.src,
    required this.variantIds,
    required this.adminGraphqlApiId,
  });

  int id;
  int productId;
  int position;
  String createdAt;
  String updatedAt;
  String alt;
  int width;
  int height;
  String src;
  List<dynamic> variantIds;
  String adminGraphqlApiId;

  factory PImage.fromRawJson(String str) => PImage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PImage.fromJson(Map<String, dynamic> json) => PImage(
        id: json["id"] ?? 0,
        productId: json["product_id"] ?? 0,
        position: json["position"] ?? 0,
        createdAt: json["created_at"] ?? '',
        updatedAt: json["updated_at"] ?? '',
        alt: json["alt"] ?? '',
        width: json["width"] ?? '',
        height: json["height"] ?? '',
        src: json["src"] ?? "",
        variantIds: List<dynamic>.from(json["variant_ids"].map((x) => x)),
        adminGraphqlApiId: json["admin_graphql_api_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "position": position,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "alt": alt,
        "width": width,
        "height": height,
        "src": src,
        "variant_ids": List<dynamic>.from(variantIds.map((x) => x)),
        "admin_graphql_api_id": adminGraphqlApiId,
      };
}

class Option {
  Option({
    required this.id,
    required this.productId,
    required this.name,
    required this.position,
    required this.values,
  });

  int id;
  int productId;
  Name name;
  int position;
  List<Option1> values;

  factory Option.fromRawJson(String str) => Option.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json["id"] ?? 0,
        productId: json["product_id"] ?? 0,
        name: nameValues.map[json["name"]]!,
        position: json["position"],
        values: List<Option1>.from(
            json["values"].map((x) => option1Values.map[x]!)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "name": nameValues.reverse[name],
        "position": position,
        "values":
            List<dynamic>.from(values.map((x) => option1Values.reverse[x])),
      };
}

enum Name { TITLE }

final nameValues = EnumValues({"Title": Name.TITLE});

enum Option1 { DEFAULT_TITLE }

final option1Values = EnumValues({"Default Title": Option1.DEFAULT_TITLE});

enum ProductType { WATER_DISPENSER }

final productTypeValues =
    EnumValues({"Water Dispenser": ProductType.WATER_DISPENSER});

enum PublishedScope { WEB }

final publishedScopeValues = EnumValues({"web": PublishedScope.WEB});

enum Status { ACTIVE }

final statusValues = EnumValues({"active": Status.ACTIVE});

class Variant {
  Variant({
    required this.id,
    required this.productId,
    required this.title,
    required this.price,
    required this.sku,
    required this.position,
    required this.inventoryPolicy,
    required this.compareAtPrice,
    required this.fulfillmentService,
    required this.inventoryManagement,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.createdAt,
    required this.updatedAt,
    required this.taxable,
    required this.barcode,
    required this.grams,
    required this.imageId,
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
  dynamic price;
  String sku;
  int position;
  String inventoryPolicy;
  dynamic compareAtPrice;
  String fulfillmentService;
  String inventoryManagement;
  String option1;
  String option2;
  String option3;
  String createdAt;
  String updatedAt;
  bool taxable;
  String barcode;
  dynamic grams;
  dynamic imageId;
  dynamic weight;
  String weightUnit;
  int inventoryItemId;
  int inventoryQuantity;
  int oldInventoryQuantity;
  bool requiresShipping;
  String adminGraphqlApiId;

  factory Variant.fromRawJson(String str) => Variant.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        id: json["id"] ?? 0,
        productId: json["product_id"] ?? 0,
        title: json["title"] ?? '',
        price: json["price"] ?? 0,
        sku: json["sku"] ?? '',
        position: json["position"] ?? 0,
        inventoryPolicy: json["inventory_policy"] ?? '',
        compareAtPrice: json["compare_at_price"] ?? '',
        fulfillmentService: json["fulfillment_service"] ?? '',
        inventoryManagement: json["inventory_management"] ?? '',
        option1: json["option1"] ?? '',
        option2: json["option2"] ?? '',
        option3: json["option3"] ?? '',
        createdAt: json["created_at"] ?? '',
        updatedAt: json["updated_at"] ?? '',
        taxable: json["taxable"],
        barcode: json["barcode"] ?? '',
        grams: json["grams"] ?? '',
        imageId: json["image_id"],
        weight: json["weight"] ?? 0.0,
        weightUnit: json["weight_unit"] ?? '',
        inventoryItemId: json["inventory_item_id"] ?? 0,
        inventoryQuantity: json["inventory_quantity"] ?? 0,
        oldInventoryQuantity: json["old_inventory_quantity"] ?? 0,
        requiresShipping: json["requires_shipping"],
        adminGraphqlApiId: json["admin_graphql_api_id"] ?? '',
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
        "created_at": createdAt,
        "updated_at": updatedAt,
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

enum FulfillmentService { MANUAL }

final fulfillmentServiceValues =
    EnumValues({"manual": FulfillmentService.MANUAL});

enum InventoryManagement { SHOPIFY }

final inventoryManagementValues =
    EnumValues({"shopify": InventoryManagement.SHOPIFY});

enum InventoryPolicy { DENY }

final inventoryPolicyValues = EnumValues({"deny": InventoryPolicy.DENY});

enum WeightUnit { KG }

final weightUnitValues = EnumValues({"kg": WeightUnit.KG});

enum Vendor { ALHAFIDH }

final vendorValues = EnumValues({"ALHAFIDH": Vendor.ALHAFIDH});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
