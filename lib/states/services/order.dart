import 'dart:convert';

import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/states/models/address_model.dart';
import 'package:alhafidh/states/models/product_model.dart';
import 'package:alhafidh/states/models/transaction_model.dart';
import 'package:alhafidh/states/services/base_client.dart';

import '../models/retrive_cart_model.dart';

class OrderService {
  //Order function
  static Future<dynamic> order({
    // required List<Edge> cartList,
    required List cartList,
    required Transactions transacton,
    required String financialStatus,
    required Address address,
    required double discountPrice,
    required String discountCode,
    required bool isDiscount,
  }) async {
    //var v = jsonEncode(cartList.toString());
   // print('cart list ===>');
   // print(v);
    var response = await BaseClient.postData(
      dBaseUrl: 'https://alhafidh.myshopify.com/',
      apiVersion: 'admin/api/2023-01/',
      api: 'orders.json',
      token: ConstantStrings.kATkn,
      body: {
        "order": {
          "line_items": cartList,
          "financial_status": financialStatus,
          "transactions": [transacton.toJson()],
          if (Preference.getLoggedInFlag())
            "customer": {
              "id": Preference.getUserDetails()
                  .customer
                  .id
                  .replaceAll(new RegExp(r'[^0-9]'), ''),
            },
          if (!Preference.getLoggedInFlag())
            "email": Preference.getGuestEmail().toString(),
          if (Preference.getLoggedInFlag())
            "email": Preference.getLoginEmail().toString(),
          "send_receipt": true,
          "send_fulfillment_receipt": true,
          "total_tax": 0,
          "currency": "USD",
          "source_name": "MOBILE_APP",
          if (financialStatus == "panding")
            "tags": "COD, ORDERED_FROM_APP,city",
          if (financialStatus == "paid")
            "tags": "PayTabs UAE, ORDERED_FROM_APP,city",
          "note": Preference.getCartNote().toString(),
          "shipping_address": {
            "address1": address.address1,
            "address2": address.address2,
            "company": null,
            "country": "Iraq",
            "firstName": address.firstName,
            "lastName": address.lastName,
            "name": "${address.firstName} ${address.lastName}",
            "phone": address.phone,
            "province": address.province,
            "city": address.city,
            "zip": address.zip
          },

          ///need dynamic
          "shipping_lines": [
            {
              "handle": "shopify-ALHAFIDH%20Delivery-0.00",
              "price": "0.0",
              "title": "ALHAFIDH Delivery"
            }
          ],
          if (isDiscount)
            "discount_codes": [
              {
                "code": discountCode,
                "amount": discountPrice,
                "type": "fixed_amount"
              }
            ]
        }
      },
    );

    return response;
  }

  //rest get Order list api
  static Future<dynamic> getMyOrders({
    required String userEmail,
  }) async {
    var response = await BaseClient.getData(
        dBaseUrl: 'https://alhafidh.myshopify.com/',
        apiVersion: 'admin/api/2023-01/',
        api: 'orders.json',
        parameter: {
          "status": 'any',
          "email": userEmail,
        },
        token: ConstantStrings.kATkn);
    return response;
  }
}
