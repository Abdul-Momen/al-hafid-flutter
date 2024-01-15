import 'dart:convert';

import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/states/models/product_model.dart';
import 'package:alhafidh/states/services/base_client.dart';



class HomeService {
  /*// Banner Function
  static Future<dynamic> getBanners() async {
    var response = await BaseClient.getData(api: ConstantStrings.kBannerAPI);
    return response;
  }*/

  /*// Category Function
  static Future<dynamic> getCategories({
    String? subCategoryId,
  }) async {
    var response = await BaseClient.getData(
      api: subCategoryId != null
          ? ConstantStrings.kSubCategoryAPI + subCategoryId
          : ConstantStrings.kCategoryAPI,
    );
    return response;
  }*/

  static Future<dynamic> getProducts() async {
    var response = await BaseClient.getData(
      api: ConstantStrings.kProductsAPI,
      token:ConstantStrings.kATkn
    );
    return response;
  }

  static Future<dynamic> getOnboardSecondImage() async {
    var response = await BaseClient.getData(
      dBaseUrl: 'https://alhafidh.myshopify.com/admin/themes/',
      apiVersion: '126173544507/',
      api: 'assets.json',
      token:ConstantStrings.kATkn,
      parameter: {
        "asset[key]": 'assets/splash2.png',
      },
    );
    return response;
  }

  static Future<dynamic> getOnboardFristImage() async {
    var response = await BaseClient.getData(
        dBaseUrl: 'https://alhafidh.myshopify.com/admin/themes/',
        apiVersion: '126173544507/',
        api: 'assets.json',
        token:ConstantStrings.kATkn,
        parameter: {
          "asset[key]": 'assets/splash1.png',
        },

    );
    return response;
  }


  static Future<dynamic> getMainBannerImage() async {
    var response = await BaseClient.getData(
        dBaseUrl: 'https://alhafidh.myshopify.com/',
        apiVersion: '',
        api: '',
        token:'',
        parameter: {
          "sections": '1554699267962',
        },

    );
    return response;
  }
  static Future<dynamic> get2ndBannerImage() async {
    var response = await BaseClient.getData(
        dBaseUrl: 'https://alhafidh.myshopify.com/',
        apiVersion: '',
        api: '',
        token:'',
        parameter: {
          "sections": '1531902587175',
        },

    );
    return response;
  }
  static Future<dynamic> get3rdBannerImage() async {
    var response = await BaseClient.getData(
        dBaseUrl: 'https://alhafidh.myshopify.com/',
        apiVersion: '126173544507/',
        api: 'assets.json',
        token:ConstantStrings.kATkn,
        parameter: {
          "sections": '1558343623878',
        },

    );
    return response;
  }

  static Future<dynamic> get4thBannerImage() async {
    var response = await BaseClient.getData(
        dBaseUrl: 'https://alhafidh.myshopify.com/admin/themes/',
        apiVersion: '126173544507/',
        api: 'assets.json',
        token:ConstantStrings.kATkn,
        parameter: {
          "asset[key]": 'assets/splash1.png',
        },

    );
    return response;
  }


}
