// To parse this JSON data, do
//
//     final addressModel = addressModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class AddressModel {
    AddressModel({
        required this.addresses,
    });

    List<Address> addresses;

    factory AddressModel.fromRawJson(String str) => AddressModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        addresses: List<Address>.from(json["addresses"].map((x) => Address.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "addresses": List<dynamic>.from(addresses.map((x) => x.toJson())),
    };
}

class Address {
    Address({
        required this.id,
        required this.customerId,
        required this.firstName,
        required this.lastName,
        required this.company,
        required this.address1,
        required this.address2,
        required this.city,
        required this.province,
        required this.country,
        required this.zip,
        required this.phone,
        required this.name,
        required this.provinceCode,
        required this.countryCode,
        required this.countryName,
        required this.addressDefault,
    });

    int id;
    int customerId;
    String firstName;
    String lastName;
    String company;
    String address1;
    String address2;
    String city;
    dynamic province;
    String country;
    String zip;
    String phone;
    String name;
    dynamic provinceCode;
    String countryCode;
    String countryName;
    bool addressDefault;

    factory Address.fromRawJson(String str) => Address.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"]??0,
        customerId: json["customer_id"]??0,
        firstName: json["first_name"]??'',
        lastName: json["last_name"]??'',
        company: json["company"]??'',
        address1: json["address1"]??'',
        address2: json["address2"]??'',
        city: json["city"]??'',
        province: json["province"],
        country: json["country"]??'',
        zip: json["zip"]??'',
        phone: json["phone"]??'',
        name: json["name"]??'',
        provinceCode: json["province_code"]??0,
        countryCode: json["country_code"]??'',
        countryName: json["country_name"]??'',
        addressDefault: json["default"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "first_name": firstName,
        "last_name": lastName,
        "company": company,
        "address1": address1,
        "address2": address2,
        "city": city,
        "province": province,
        "country": country,
        "zip": zip,
        "phone": phone,
        "name": name,
        "province_code": provinceCode,
        "country_code": countryCode,
        "country_name": countryName,
        "default": addressDefault,
    };
}
