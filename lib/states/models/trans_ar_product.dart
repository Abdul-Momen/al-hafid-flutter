// To parse this JSON data, do
//
//     final translateArProduct = translateArProductFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class TranslateArProduct {
  TranslateArProduct({
    required this.translatableResource,
  });

  TranslatableResource translatableResource;

  factory TranslateArProduct.fromRawJson(String str) => TranslateArProduct.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TranslateArProduct.fromJson(Map<String, dynamic> json) => TranslateArProduct(
    translatableResource: TranslatableResource.fromJson(json["translatableResource"]??{}),
  );

  Map<String, dynamic> toJson() => {
    "translatableResource": translatableResource.toJson(),
  };
}

class TranslatableResource {
  TranslatableResource({
    required this.resourceId,
    required this.translations,
  });

  String resourceId;
  List<Translation> translations;

  factory TranslatableResource.fromRawJson(String str) => TranslatableResource.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TranslatableResource.fromJson(Map<String, dynamic> json) => TranslatableResource(
    resourceId: json["resourceId"]??'',
    translations:json["translations"]!=null? List<Translation>.from(json["translations"].map((x) => Translation.fromJson(x))):[],
  );

  Map<String, dynamic> toJson() => {
    "resourceId": resourceId,
    "translations": List<dynamic>.from(translations.map((x) => x.toJson())),
  };
}

class Translation {
  Translation({
    required this.key,
    required this.value,
    required this.locale,
  });

  String key;
  String value;
  String locale;

  factory Translation.fromRawJson(String str) => Translation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
    key: json["key"],
    value: json["value"],
    locale: json["locale"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "value": value,
    "locale": locale,
  };
}
