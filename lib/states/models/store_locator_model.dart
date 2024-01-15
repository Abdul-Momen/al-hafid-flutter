// To parse this JSON data, do
//
//     final storeLocatorModel = storeLocatorModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<StoreLocatorModel> storeLocatorModelFromJson(String str) => List<StoreLocatorModel>.from(json.decode(str).map((x) => StoreLocatorModel.fromJson(x)));

String storeLocatorModelToJson(List<StoreLocatorModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StoreLocatorModel {
  StoreLocatorModel({
    required this.id,
    required this.address,
    required this.phone,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.url,
    required this.email,
    required this.description,
    required this.tier,
    required this.imageUrl,
    required this.customMarkerUrl,
    required this.hidden,
    required this.colorMarker,
    required this.tags,
    required this.customFields,
  });

  int id;
  String address;
  String phone;
  String name;
  double latitude;
  double longitude;
  String url;
  String email;
  String description;
  dynamic tier;
  String imageUrl;
  String customMarkerUrl;
  bool hidden;
  dynamic colorMarker;
  Tags tags;
  CustomFields customFields;

  factory StoreLocatorModel.fromJson(Map<String, dynamic> json) => StoreLocatorModel(
    id: json["id"],
    address: json["address"],
    phone: json["phone"],
    name: json["name"],
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
    url: json["url"],
    email: json["email"],
    description: json["description"],
    tier: json["tier"],
    imageUrl: json["image_url"],
    customMarkerUrl: json["custom_marker_url"],
    hidden: json["hidden"],
    colorMarker: json["color_marker"],
    tags: Tags.fromJson(json["tags"]),
    customFields: CustomFields.fromJson(json["custom_fields"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "address": address,
    "phone": phone,
    "name": name,
    "latitude": latitude,
    "longitude": longitude,
    "url": url,
    "email": email,
    "description": description,
    "tier": tier,
    "image_url": imageUrl,
    "custom_marker_url": customMarkerUrl,
    "hidden": hidden,
    "color_marker": colorMarker,
    "tags": tags.toJson(),
    "custom_fields": customFields.toJson(),
  };
}

class CustomFields {
  CustomFields({
    required this.empty,
  });

  Empty empty;

  factory CustomFields.fromJson(Map<String, dynamic> json) => CustomFields(
    empty: Empty.fromJson(json[""]),
  );

  Map<String, dynamic> toJson() => {
    "": empty.toJson(),
  };
}

class Empty {
  Empty({
    required this.value,
    required this.displayText,
  });

  String value;
  dynamic displayText;

  factory Empty.fromJson(Map<String, dynamic> json) => Empty(
    value: json["value"],
    displayText: json["display_text"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "display_text": displayText,
  };
}

class Tags {
  Tags({
    required this.filter,
  });

  List<String> filter;

  factory Tags.fromJson(Map<String, dynamic> json) => Tags(
    filter: List<String>.from(json["Filter"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "Filter": List<dynamic>.from(filter.map((x) => x)),
  };
}
