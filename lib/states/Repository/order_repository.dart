import 'dart:io';

import 'package:alhafidh/states/GraphqlConfig/graphql_provider.dart';
import 'package:alhafidh/states/GraphqlConfig/test_graphql_provider.dart';
import 'package:alhafidh/states/HelperUtils/global_constant.dart';
import 'package:alhafidh/states/Query/query_mutation.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/states/models/add_note_response.dart';
import 'package:alhafidh/states/models/associate_customer_response.dart';
import 'package:alhafidh/states/models/create_cart_checkout.dart';
import 'package:alhafidh/states/models/get_shipping_rate.dart';
import 'package:alhafidh/states/models/remove_discount_model.dart';
import 'package:alhafidh/states/models/set_shipping_address_response.dart';
import 'package:alhafidh/states/models/set_shipping_rate.dart';
import 'package:alhafidh/ui/screens/checkout/model/applyDiscountCodeModel.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../models/retrive_cart_model.dart' as edge;

abstract class IOrderRepository {
  Future<CreateCheckoutCartResponse> createCartCheckoutProduct(
      List<edge.Edge> lines);

  Future<CreateCheckoutCartResponse> createBuyNowCheckout(String pId);

  Future<AssociateCustomerResponse> associateCustomerCheckout(
      String checkoutId, String customerTkn);

  Future<SetShippingAddressResponse> setShippingAddress({
    required String email,
    required String lastName,
    required String firstName,
    required String address1,
    required String province,
    required String country,
    required String zip,
    required String city,
    required String checkoutId,
  });

  Future<AddNoteResponse> addCartNote({required String note});
  Future<ApplyDiscountCode> applyDiscountCode({required String checkoutId,required String code});
  Future<RemoveDiscountModel> removeDiscountCode({required String checkoutId});

  Future<SetShippingAddressResponse> guestShippingAddress({
    required String email,
    required String lastName,
    required String firstName,
    required String address1,
    required String province,
    required String country,
    required String zip,
    required String city,
    required String checkoutId,
  });

  Future<GetShippingRateResponse> getShippingRate(var setyourvarible);

  Future<SetShippingRateResponse> setShippingRate({required String handle});
}

class OrderRepository implements IOrderRepository {
  //for createCart CheckOUt in my cart
  @override
  Future<CreateCheckoutCartResponse> createBuyNowCheckout(String pId) async {
    var responsedata;

    print('product id =>'+pId);
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery();
    final MutationOptions options = MutationOptions(
        document: AuthQuery.createBuyNowCheckout, // call the query
        variables: const {
          "merchandiseId": "gid://shopify/ProductVariant/44874779296033",
          "quantity": 1,
        });
    final QueryResult result = await client.mutate(options);

    //print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
      // print('crete Buy now checkout json=>');
      // print(responseDetails);
      responsedata = CreateCheckoutCartResponse.fromRawJson(responseDetails);
    }

    return responsedata;
  }

  //for createCart CheckOUt in my cart
  @override
  Future<CreateCheckoutCartResponse> createCartCheckoutProduct(
      List<dynamic> lines) async {
    var responsedata;
    GraphqlClass graphqlClass = GraphqlClass();
    print("cart item list " + lines.length.toString());

    for (var cartItem in lines) {
      print("print id => " + cartItem.node.merchandise.id);
    }
    GraphQLClient client = graphqlClass.clientToQuery();

    final MutationOptions options = MutationOptions(
        document: AuthQuery.createCartCheckout, // call the query
        variables: {
          "lineItems": [
            for (var cartItem in lines)
              {
                "quantity": cartItem.node.quantity,
                "variantId": cartItem.node.merchandise.id
              }
            /* {
              "quantity": 1,
              "variantId": "gid://shopify/ProductVariant/39966720000059"
            }*/
          ]
        });
    final QueryResult result = await client.mutate(options);

    // print(result.toString());

    if (result.hasException) {
      try {
        // Code that may throw an exception or error
         String msg = result.exception!.graphqlErrors[0].message.toString();
         HelperUtils.showToast(msg);
      } catch (e, stackTrace) {
        // Handle the exception or error here
        print('An error occurred: $e');
        print('Stack trace: $stackTrace');
      }
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
      // print('crete cart checkout json=>');
      // print(responseDetails);
      responsedata = CreateCheckoutCartResponse.fromRawJson(responseDetails);
    }

    return responsedata;
  }

  //for associate with customer in checkout
  @override
  Future<AssociateCustomerResponse> associateCustomerCheckout(
      String checkoutId, String customerTkn) async {
    var responsedata;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery();
    final MutationOptions options = MutationOptions(
        document: AuthQuery.associateCustomerCheckout, // call the query
        variables: {
          "checkoutId": Preference.getCartCheckOutId(),
          "customerAccessToken": Preference.getCToken()
        });
    final QueryResult result = await client.mutate(options);

    // print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
      // print('associate customer json=>');
      // print(responseDetails);
      responsedata = AssociateCustomerResponse.fromRawJson(responseDetails);
    }

    return responsedata;
  }

  //for set shipping Address
  @override
  Future<SetShippingAddressResponse> setShippingAddress({
    required String email,
    required String lastName,
    required String firstName,
    required String address1,
    required String province,
    required String country,
    required String zip,
    required String city,
    required String checkoutId,
  }) async {
    var responsedata;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery();
    final MutationOptions options = MutationOptions(
        document: AuthQuery.setShippingAddress, // call the query
        variables: {
          "shippingAddress": {
            "lastName": lastName,
            "firstName": firstName,
            "address1": address1,
            "province": province,
            "country": "Iraq",
            "zip": zip,
            "city": city
          },
          "checkoutId": Preference.getCartCheckOutId()
        });
    final QueryResult result = await client.mutate(options);

    //print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
      //print('set shipping address json=>');
      //print(responseDetails);
      responsedata = SetShippingAddressResponse.fromRawJson(responseDetails);
    }

    return responsedata;
  }

  //for set shipping Address
  @override
  Future<SetShippingAddressResponse> guestShippingAddress({
    required String email,
    required String lastName,
    required String firstName,
    required String address1,
    required String province,
    required String country,
    required String zip,
    required String city,
    required String checkoutId,
  }) async {
    var responsedata;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery();
    final MutationOptions options = MutationOptions(
        document: AuthQuery.setShippingAddress, // call the query
        variables: {
          "email": email,
          "shippingAddress": {
            "lastName": lastName,
            "firstName": firstName,
            "address1": address1,
            "province": city,
            "country": "Iraq",
            "zip": zip,
            "city": city
          },
          "checkoutId": Preference.getCartCheckOutId()
        });
    final QueryResult result = await client.mutate(options);

    // print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
      // print('Set Shipping Address json=>');
      //print(responseDetails);
      responsedata = SetShippingAddressResponse.fromRawJson(responseDetails);
    }

    return responsedata;
  }

  //for get shipping rate
  @override
  Future<GetShippingRateResponse> getShippingRate(var lines) async {
    var responsedata;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery();
    final MutationOptions options = MutationOptions(
        document: AuthQuery.getShippingRate, // call the query
        variables: {
          "checkoutId": Preference.getCartCheckOutId(),
        });
    final QueryResult result = await client.mutate(options);

    //print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
      //print('get shipping rate json=>');
      //print(responseDetails);
      responsedata = GetShippingRateResponse.fromRawJson(responseDetails);
    }

    return responsedata;
  }

  //for set shipping rate
  @override
  Future<SetShippingRateResponse> setShippingRate(
      {required String handle}) async {
    var responsedata;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery();
    final MutationOptions options = MutationOptions(
        document: AuthQuery.setShippingRate, // call the query
        variables: {
          "checkoutId": Preference.getCartCheckOutId(),
          "shippingRateHandle": "shopify-ALHAFIDH%20Delivery-0.00"
        });
    final QueryResult result = await client.mutate(options);

    // print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
      // print('get shipping rate json=>');
      // print(responseDetails);
      responsedata = SetShippingRateResponse.fromRawJson(responseDetails);
    }

    return responsedata;
  }

  //for set shipping rate
  @override
  Future<AddNoteResponse> addCartNote({
    required String note,
  }) async {
    var responsedata;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery();
    final MutationOptions options = MutationOptions(
        document: AuthQuery.addNote, // call the query
        variables: {
          "cartId": Preference.getCartId(),
          "note": note,
        });
    final QueryResult result = await client.mutate(options);

    // print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
      //print('get shipping rate json=>');
      // print(responseDetails);
      responsedata = AddNoteResponse.fromRawJson(responseDetails);
    }

    return responsedata;
  }


  //for apply discount code
  @override
  Future<ApplyDiscountCode> applyDiscountCode({
    required String checkoutId,
    required String code,
  }) async {
    var responsedata;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery();
    final MutationOptions options = MutationOptions(
        document: AuthQuery.applyCode, // call the query
        variables: {
          "checkoutId": checkoutId,
          "discountCode": code
        });
    final QueryResult result = await client.mutate(options);

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
      print('get apply Code json=>');
      print(responseDetails);
      responsedata = ApplyDiscountCode.fromRawJson(responseDetails);
    }

    return responsedata;
  }


  //for remove discount code
  @override
  Future<RemoveDiscountModel> removeDiscountCode({
    required String checkoutId,
  }) async {
    var responsedata;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery();
    final MutationOptions options = MutationOptions(
        document: AuthQuery.removeCode, // call the query
        variables: {
          "checkoutId": checkoutId,
        });
    final QueryResult result = await client.mutate(options);

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
      print('get remove discount code json=>');
      print(responseDetails);
      responsedata = RemoveDiscountModel.fromRawJson(responseDetails);
    }

    return responsedata;
  }



}
