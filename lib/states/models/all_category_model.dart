// To parse this JSON data, do
//
//     final allCategoryModel = allCategoryModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class AllCategoryModel {
  AllCategoryModel({
    required this.menu,
  });

  Menu menu;

  factory AllCategoryModel.fromRawJson(String str) =>
      AllCategoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AllCategoryModel.fromJson(Map<String, dynamic> json) =>
      AllCategoryModel(
        menu: Menu.fromJson(json["menu"]),
      );

  Map<String, dynamic> toJson() => {
        "menu": menu.toJson(),
      };
}

class Menu {
  Menu({
    required this.id,
    required this.title,
    required this.itemsCount,
    required this.handle,
    required this.mitems,
  });

  String id;
  String title;
  int itemsCount;
  String handle;
  List<MItem> mitems;

  factory Menu.fromRawJson(String str) => Menu.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        id: json["id"],
        title: json["title"],
        itemsCount: json["itemsCount"],
        handle: json["handle"],
        mitems:
            List<MItem>.from(json["items"].map((x) => MItem.fromJson(x)) ?? []),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "itemsCount": itemsCount,
        "handle": handle,
        "items": List<dynamic>.from(mitems.map((x) => x.toJson())),
      };
}

class MItem {
  MItem({
    required this.id,
    required this.resourceId,
    required this.title,
    required this.tags,
    required this.type,
    required this.url,
    required this.items,
  });

  String id;
  String resourceId;
  String title;
  List<dynamic> tags;
  String type;
  String url;
  List<SItem> items;

  factory MItem.fromRawJson(String str) => MItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MItem.fromJson(Map<String, dynamic> json) => MItem(
        id: json["id"],
        resourceId: json["resourceId"],
        title: json["title"],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        type: json["type"],
        url: json["url"],
        items:
            List<SItem>.from(json["items"].map((x) => SItem.fromJson(x)) ?? []),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "resourceId": resourceId,
        "title": title,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "type": typeValues.reverse[type],
        "url": url,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class SItem {
  SItem({
    required this.id,
    required this.resourceId,
    required this.title,
    required this.tags,
    required this.type,
    required this.url,
    required this.items,
     this.isVisible=false,
  });

  String id;
  bool isVisible;
  String resourceId;
  String title;
  List<dynamic> tags;
  String type;
  String url;
  List<SSItem> items;

  factory SItem.fromRawJson(String str) => SItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SItem.fromJson(Map<String, dynamic> json) => SItem(
        id: json["id"],
        resourceId: json["resourceId"],
        title: json["title"],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        type: json["type"],
        url: json["url"],
        items: List<SSItem>.from(json["items"].map((x) => SSItem.fromJson(x))??[]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "resourceId": resourceId,
        "title": title,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "type": typeValues.reverse[type],
        "url": url,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class SSItem {
  SSItem({
    required this.id,
    required this.resourceId,
    required this.title,
    required this.tags,
    required this.type,
    required this.url,
    // required this.items,
  });

  String id;
  String resourceId;
  String title;
  List<dynamic> tags;
  String type;
  String url;

  // List<SItem> items;

  factory SSItem.fromRawJson(String str) => SSItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SSItem.fromJson(Map<String, dynamic> json) => SSItem(
        id: json["id"],
        resourceId: json["resourceId"],
        title: json["title"],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        type: json["type"],
        url: json["url"],
        // items: List<SItem>.from(json["items"].map((x) => SItem.fromJson(x))??[]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "resourceId": resourceId,
        "title": title,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "type": typeValues.reverse[type],
        "url": url,
        //  "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

enum Type { COLLECTION, PAGE }

final typeValues =
    EnumValues({"COLLECTION": Type.COLLECTION, "PAGE": Type.PAGE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
