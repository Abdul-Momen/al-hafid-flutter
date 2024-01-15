import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/states/services/base_client.dart';

class ProductsService {
  //rest get store locator list api
  static Future<dynamic> deleteAccount({
    required int customerId,
  }) async {
    var response = await BaseClient.deleteData(
        dBaseUrl: 'https://alhafidh.myshopify.com/',
        apiVersion: 'admin/api/2023-01/',
        api: 'customers/${customerId}.json',
      token:ConstantStrings.kATkn,
    );
    return response;
  }



  //rest get store locator list api
  static Future<dynamic> getStoreLocator(
      {required String qName, required String qAddress}) async {
    var response = await BaseClient.getData(
        dBaseUrl: 'https://www.storemapper.co/',
        apiVersion: 'api/v3/',
        api: 'stores/query',
        parameter: {
          "name": qName,
          // "address": qAddress
        },
        bToken: 'c1864d824a3540a03e8d6fde618b4d14');
    return response;
  }

  //rest get review list api
  static Future<dynamic> getReviewProducts({required int productId}) async {
    var response = await BaseClient.getData(
        dBaseUrl: 'https://productreviews.shopifycdn.com/',
        apiVersion: 'proxy/v4/',
        api: 'reviews.json',
        parameter: {
          "shop": 'alhafidh.myshopify.com',

          ///demo id for test
          "product_id": productId,
        },
        token: ConstantStrings.kATkn);
    return response;
  }

  // get exchange rate api
  static Future<dynamic> getExchangeRate({required int productId}) async {
    var response = await BaseClient.getData(
        dBaseUrl: 'https://alhafidh.myshopify.com/',
        apiVersion: 'admin/themes/126173544507/',
        api: 'assets.json?asset[key]=config/settings_data.json',
        /*parameter: {
          "current": 'flash_screen',
        },*/
      token:ConstantStrings.kATkn,
    );
    return response;
  }

  //rest related api
  static Future<dynamic> getRelatedProducts({required int pId}) async {
    var response = await BaseClient.getData(
        api: ConstantStrings.kProductsAPI,
        apiVersion: ConstantStrings.kRecommendation,
        parameter: {
          "product_id": pId,
          "limit": 8,
          "intent": 'related',
        },
        token: ConstantStrings.kATkn);
    return response;
  }

  //product of collection/category
  static Future<dynamic> getProducts({required int collectionId}) async {
    var response = await BaseClient.getData(
        api: ConstantStrings.kProductsAPI,
        parameter: {
          "collection_id": collectionId,
          // "limit": 100,
        },
        token: ConstantStrings.kATkn);
    return response;
  }

  //product of collection/category
  static Future<dynamic> getFilterAllProducts({
    required int collectionId,
    String? sortBy,
    List<String>? vendorList,
    List<String>? selectedTvType,
    List<String>? selectedDisplaySize,
    List<String>? selectedStock,
    List<String>? selectedProductType,
    List<String>? selectedColor,
    List<String>? selectedCfCapacity,
    int? pageNum,
    List<String>? selectedWashingType,
    List<String>? selectedCoolingCapacity,
    List<String>? selectedDoorStyle,
    List<String>? selectedCompressorType,
    bool? stock,
  }) async {
    var pBody = {
      "shop": 'alhafidh.myshopify.com',
      "sid": '5dc1ef38-d7f3-4c15-af13-b744248bc033',
      "collection_scope": collectionId,
      "sort": sortBy ?? '',
      "page": pageNum ?? 1,
      "limit": 10,
      "locale": Preference.getIsArabicFlag() ? 'ar' : 'en',
      if(stock==true)
      'pf_st_stock_status[]': stock,

    };

    if (vendorList != null) {
      for (var item in vendorList) {
        pBody.addAll({
          'vendor': item,
        });
      }
    }

    print(pBody.entries);

    if (selectedTvType != null) {
      for (var item in selectedTvType) {
        pBody.addAll({
          'pf_t_tv_type[]': item,
        });
      }
    }

    if (selectedDisplaySize != null) {
      for (var item in selectedDisplaySize) {
        pBody.addAll({
          'pf_t_display_sizes[]': item,
        });
      }
    }
    if (selectedProductType != null) {
      for (var item in selectedProductType) {
        pBody.addAll({
          'pf_pt_product_type[]': item,
        });
      }
    }
    if (selectedStock != null) {
      for (var item in selectedStock) {
        pBody.addAll({
          'pf_st_stock_status[]': item == 'in-stock' ? true : false,
        });
      }
    }
    if (selectedCfCapacity != null) {
      for (var item in selectedCfCapacity) {
        pBody.addAll({
          'pf_t_cf_capacity[]': item,
        });
      }
    }
    if (selectedColor != null) {
      for (var item in selectedColor) {
        pBody.addAll({
          'pf_t_color[]': item,
        });
      }
    }
    if (selectedWashingType != null) {
      for (var item in selectedWashingType) {
        pBody.addAll({
          'pf_t_washing_type[]': item,
        });
      }
    }
    if (selectedDoorStyle != null) {
      for (var item in selectedDoorStyle) {
        pBody.addAll({
          'pf_t_door_style[]': item,
        });
      }
    }
    if (selectedCompressorType != null) {
      for (var item in selectedCompressorType) {
        pBody.addAll({
          'pf_t_compressor_type[]': item,
        });
      }
    }
    if (selectedCoolingCapacity != null) {
      for (var item in selectedCoolingCapacity) {
        pBody.addAll({
          'pf_t_cooling_capacity[]': item,
        });
      }
    }

    var response = await BaseClient.getData(
        api: ConstantStrings.kFilterAPI,
        dBaseUrl: 'https://services.mybcapps.com/',
        apiVersion: 'bc-sf-filter/',
        parameter: pBody,
        kAuthKey: 'X-Shopify-Storefront-Access-Token',
      token:ConstantStrings.kStTkn,
    );

    return response;
  }

  //product search
  static Future<dynamic> getSearchAllProducts({
    required String q,
  }) async {
    print("query = $q");
    var pBody = {
      "shop": 'alhafidh.myshopify.com',
      "sid": '5dc1ef38-d7f3-4c15-af13-b744248bc033',
      "page": 1,
      "limit": 50,
      "locale": Preference.getIsArabicFlag() ? 'ar' : 'en',
      "q": q,
    };

    var response = await BaseClient.getData(
        api: ConstantStrings.kSearchAPI,
        dBaseUrl: 'https://services.mybcapps.com/',
        apiVersion: 'bc-sf-filter/',
        parameter: pBody,
        kAuthKey: 'X-Shopify-Storefront-Access-Token',
      token:ConstantStrings.kStTkn,
    );

    return response;
  }

  static Future<dynamic> getProductDetails({required int pID}) async {
    var response = await BaseClient.getData(
        api: '${ConstantStrings.kProductDetailsAPI}$pID.json',
        /*parameter:{"id":pID,"languageId":4},*/
        token: ConstantStrings.kATkn);
    return response;
  }

  static Future<dynamic> getFilterAllOptionData(
      {required int collectionId}) async {
    var response = await BaseClient.getData(
        api: ConstantStrings.kFilterAPI,
        dBaseUrl: 'https://services.mybcapps.com/',
        apiVersion: 'bc-sf-filter/',
        parameter: {
          "shop": 'alhafidh.myshopify.com',
          "build_filter_tree": 'true',
          "sid": '5dc1ef38-d7f3-4c15-af13-b744248bc033',
          "collection_scope": collectionId,
        },
        kAuthKey: 'X-Shopify-Storefront-Access-Token',
      token:ConstantStrings.kStTkn,
    );

    return response;
  }

  static Future<dynamic> getFilterData({required int collectionId}) async {
    var response = await BaseClient.getData(
        api: ConstantStrings.kFilterAPI,
        dBaseUrl: 'https://services.mybcapps.com/',
        apiVersion: 'bc-sf-filter/',
        parameter: {
          "shop": 'alhafidh.myshopify.com',
          "page": '1',
          "limit": '10',
          "sort": 'best-selling',
          "build_filter_tree": 'true',
          "sid": '5dc1ef38-d7f3-4c15-af13-b744248bc033',
          "collection_scope": collectionId,
          "vendor": 'ALHAFIDH',
          "pf_t_tv_type": '4K QLED TVs',
        },
        kAuthKey: 'X-Shopify-Storefront-Access-Token',
      token:ConstantStrings.kStTkn,
    );

    return response;
  }

  //get available rewards point
  static Future<dynamic> getUsersPoints({required String customerEmail}) async {
    var response = await BaseClient.getData(
        api: 'customer-loyalty',
        dBaseUrl: 'http://loyalty-admin.appstle.com/',
        apiVersion: 'api/external/',
        parameter: {
          "api_key": 'suutx6PEhmyi',
          //"customerEmail": Preference.getLoginEmail(),
          "customerEmail": customerEmail,
          'customerId': Preference.getUserDetails()
              .customer
              .id
              .replaceAll(new RegExp(r'[^0-9]'), '')
        },
        kAuthKey: 'X-Shopify-Storefront-Access-Token',
      token:ConstantStrings.kStTkn,
    );

    return response;
  }

  //post redeem rewards point
  static Future<dynamic> postRedeemRewards({
    required int redeemId,
  }) async {
    var response = await BaseClient.postData(
        api: 'redeem-points',
        dBaseUrl: 'http://loyalty-admin.appstle.com/',
        apiVersion: 'api/external/',
        body: {
          "customerEmail": Preference.getLoginEmail(),
          "redeemRuleId": redeemId,
        },
        parameter: {
          "api_key": 'suutx6PEhmyi',
        },
        kAuthKey: 'X-Shopify-Storefront-Access-Token',
      token:ConstantStrings.kStTkn,
    );

    return response;
  }

  //get reward rules
  static Future<dynamic> getRewardsRules() async {
    var response = await BaseClient.getData(
        api: 'point-redeem-rules',
        dBaseUrl: 'http://loyalty-admin.appstle.com/',
        apiVersion: 'api/external/',
        parameter: {
          "api_key": 'suutx6PEhmyi',
        },
        kAuthKey: 'X-Shopify-Storefront-Access-Token',
      token:ConstantStrings.kStTkn,
    );

    return response;
  }

/*
  static Future<dynamic> getCartItems({required int customerId}) async {
    var parameterData = {
      "customerId": customerId,
      "TempId": customerId,
    };
    var response = await BaseClient.getData(
      api: ConstantStrings.kCartItemsAPI,
      parameter: parameterData,
    );
    return response;
  }

  static Future<dynamic> addToCart({required dynamic payload}) async {
    var response = await BaseClient.postData(
      api: ConstantStrings.kAddToCartAPI,
      body: payload,
    );
    return response;
  }

  static Future<dynamic> removeFromCart({required dynamic payload}) async {
    var response = await BaseClient.postData(
      api: ConstantStrings.kRemoveFromCartAPI,
      body: payload,
    );
    return response;
  }

  static Future<dynamic> removeItemFromCart({required int cartId}) async {
    var response = await BaseClient.getData(
      api: '${ConstantStrings.kRemoveItemFromCartAPI}$cartId',
    );
    return response;

  }*/
}
