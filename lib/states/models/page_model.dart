// To parse this JSON data, do
//
//     final pageModel = pageModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class PageModel {
  PageModel({
    required this.page,
  });

  Page page;

  factory PageModel.fromRawJson(String str) => PageModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PageModel.fromJson(Map<String, dynamic> json) => PageModel(
    page: Page.fromJson(json["page"]),
  );

  Map<String, dynamic> toJson() => {
    "page": page.toJson(),
  };
}

class Page {
  Page({
    required this.id,
    required this.title,
    required this.shopId,
    required this.handle,
    required this.bodyHtml,
    required this.author,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.templateSuffix,
    required this.adminGraphqlApiId,
  });

  int id;
  String title;
  int shopId;
  String handle;
  String bodyHtml;
  String author;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime publishedAt;
  String templateSuffix;
  String adminGraphqlApiId;

  factory Page.fromRawJson(String str) => Page.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Page.fromJson(Map<String, dynamic> json) => Page(
    id: json["id"]??0,
    title: json["title"]??'',
    shopId: json["shop_id"]??0,
    handle: json["handle"]??'',
    bodyHtml: json["body_html"]??'',
    author: json["author"]??'',
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    publishedAt: DateTime.parse(json["published_at"]),
    templateSuffix: json["template_suffix"]??'',
    adminGraphqlApiId: json["admin_graphql_api_id"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "shop_id": shopId,
    "handle": handle,
    "body_html": bodyHtml,
    "author": author,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "published_at": publishedAt.toIso8601String(),
    "template_suffix": templateSuffix,
    "admin_graphql_api_id": adminGraphqlApiId,
  };
}
