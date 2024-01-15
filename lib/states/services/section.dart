import 'dart:convert';

import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/states/models/product_model.dart';
import 'package:alhafidh/states/services/base_client.dart';



class SectionService {

  static Future<dynamic> getMediaCenter() async {
    var response = await BaseClient.getData(
        dBaseUrl: 'https://alhafidh.myshopify.com/',
        apiVersion: 'admin/api/2023-01/',
        api: 'pages/89027444795.json',
        token:ConstantStrings.kATkn,
       /* parameter: {
          "asset[key]": 'assets/splash1.png',
        },*/
    );
    return response;
  }

  static Future<dynamic> getAboutUs() async {
    var response = await BaseClient.getData(
        dBaseUrl: 'https://alhafidh.myshopify.com/',
        apiVersion: 'admin/api/2023-01/',
        api: 'pages/89095012411.json',
        token:ConstantStrings.kATkn,
       /* parameter: {
          "asset[key]": 'assets/splash1.png',
        },*/
    );
    return response;
  }

  static Future<dynamic> getWarranty({required String id}) async {
    var response = await BaseClient.getData(
        dBaseUrl: 'https://alhafidh.myshopify.com/',
        apiVersion: 'admin/api/2023-01/',
        api: 'pages/$id.json',
        token:ConstantStrings.kATkn,
       /* parameter: {
          "asset[key]": 'assets/splash1.png',
        },*/
    );
    return response;
  }


  static Future<dynamic> getFaq({required String id}) async {
    var response = await BaseClient.getData(
        dBaseUrl: 'https://alhafidh.myshopify.com/',
        apiVersion: 'admin/api/2023-01/',
      api: 'pages/$id.json',
        token:ConstantStrings.kATkn,
       /* parameter: {
          "asset[key]": 'assets/splash1.png',
        },*/
    );
    return response;
  }


}
