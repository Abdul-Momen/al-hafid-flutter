import 'package:alhafidh/states/GraphqlConfig/graphql_provider.dart';
import 'package:alhafidh/states/HelperUtils/global_constant.dart';
import 'package:alhafidh/states/Query/query_mutation.dart';
import 'package:alhafidh/states/models/add_address_response.dart';
import 'package:alhafidh/states/models/address_model.dart';

import 'package:graphql_flutter/graphql_flutter.dart';


abstract class IAddressRepository {
  Future<AddAddressResponse> addAddress(Address address, String customerToken);
  Future<CustomerAddress> updateAddress(
      Address address, String customerToken, int addressId);
}

class AddressRepository implements IAddressRepository {
  //for add customer address
  @override
  Future<AddAddressResponse> addAddress(
      Address address, String customerToken) async {
    var responsedata;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery();
    final MutationOptions options =
        MutationOptions(document: AuthQuery.addAddress, // call the query
            variables: {
          "address": {
            "address1": address.address1,
            "address2": address.address2,
            "city": address.city,
            //"company": "Royex",
            "country": address.country,
            "firstName": address.firstName,
            "lastName": address.lastName,
            "phone": address.phone,
            //"province": "Dubai",
            "zip": address.zip
          },
          "customerAccessToken": customerToken
        });
    final QueryResult result = await client.mutate(options);
   // print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
     // print('add address response json=>');
     // print(responseDetails);
      responsedata = AddAddressResponse.fromRawJson(responseDetails);
    }
    return responsedata;
  }

  //for add customer address
  @override
  Future<CustomerAddress> updateAddress(
      Address address, String customerToken, int addressId) async {
    var responsedata;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery();
    final MutationOptions options =
        MutationOptions(document: AuthQuery.updateAddress, // call the query
            variables: {
          "address": {
            "address1": address.address1,
            "address2": address.address2,
            "city": address.city,
            //"company": "Royex",
            "country": address.country,
            "firstName": address.firstName,
            "lastName": address.lastName,
            "phone": address.phone,
            // "province": "Dubai",
            "zip": address.zip
          },
          "customerAccessToken": customerToken,
          "id":
              'gid://shopify/MailingAddress/$addressId?model_name=CustomerAddress'
        });
    final QueryResult result = await client.mutate(options);

   // print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
     // print('Update address response json=>');
     // print(responseDetails);
      responsedata = CustomerAddress.fromRawJson(responseDetails);
    }

    return responsedata;
  }

  //for delete customer address
  @override
  Future<bool> deleteAddress(String customerToken, int addressId) async {
    var responsedata;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery();
    final MutationOptions options =
        MutationOptions(document: AuthQuery.deleteAddress, // call the query
            variables: {
          "customerAccessToken": customerToken,
          "id":
              'gid://shopify/MailingAddress/$addressId?model_name=CustomerAddress'
        });
    final QueryResult result = await client.mutate(options);

   // print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
     // print('Update address response json=>');
     // print(responseDetails);
      responsedata = true;
    }

    return responsedata;
  }

  //for set default customer address
  @override
  Future<bool> setDefaultAddress(String customerToken, int addressId) async {
    var responsedata;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery();
    final MutationOptions options =
        MutationOptions(document: AuthQuery.defaultAddress, // call the query
            variables: {
          "customerAccessToken": customerToken,
          "addressId":
              'gid://shopify/MailingAddress/$addressId?model_name=CustomerAddress'
        }

        );
    final QueryResult result = await client.mutate(options);

   // print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
    //  print('set default address response json=>');
      print(responseDetails);
      responsedata = true;
    }

    return responsedata;
  }
}
