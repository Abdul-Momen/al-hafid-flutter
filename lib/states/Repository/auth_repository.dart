

import 'package:alhafidh/states/Query/query_mutation.dart';
import 'package:alhafidh/states/models/customer_model.dart';
import 'package:alhafidh/states/models/reset_response.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../GraphqlConfig/graphql_provider.dart';
import '../HelperUtils/global_constant.dart';
import '../models/login_response.dart';


abstract class IAuthRepository {
  Future<LoginData> login(String email,String password);
  Future<CustomerModel> customer(String customerToken);
  Future<ResetResponse> resetPassword(String email);
  Future<CustomerModel> customerUpdate(String customerToken);
}

class AuthRepository implements IAuthRepository {

  //for user profile
  @override
  Future<CustomerModel> customer(String customerToken) async {
    var responsedata;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery();
    final MutationOptions options =
    MutationOptions(document: AuthQuery.customer,  // call the query
        variables: {
          "customerAccessToken": customerToken
        }
    );
    final QueryResult result = await client.mutate(options);

    //print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
     // print('graph json=>');
     // print(responseDetails);
      responsedata =CustomerModel.fromRawJson(responseDetails);
    }

    return responsedata;
  }

  //for reset password
  @override
  Future<ResetResponse> resetPassword(String email) async {
    var responsedata;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery();
    final MutationOptions options =
    MutationOptions(document: AuthQuery.resetPassword,  // call the query
        variables: {
          "email": email
        }
    );
    final QueryResult result = await client.mutate(options);

   // print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
     // print('graph json=>');
     // print(responseDetails);
      responsedata =ResetResponse.fromRawJson(responseDetails);
    }

    return responsedata;
  }

  //for user update profile
  ///for cutomer update
  @override
  Future<CustomerModel> customerUpdate(String customerToken) async {
    var responsedata;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery();
    final MutationOptions options =
    MutationOptions(document: AuthQuery.updateCustomerInfo,  // call the query
        variables: {
          "address": {
            "address1": "address_test",
            "address2": "address2",
            "city": "Dubai",
            "company": "Royex ",
            "country": "AE",
            "firstName": "Ali",
            "lastName": "Russel",
            "phone": "123456789",
            "province": "Dubai",
            "zip": "123456"
          },
          "customerAccessToken": customerToken,
          "id": "gid://shopify/MailingAddress/7584553074732?model_name=CustomerAddress&customer_access_token=rRcwtwHexlNw1U_oPzcJx8sZh4HX8vDSd6QsEqnTFzL6-FLEJUS3-D7yrgwIUx5YGDFxbvB8XXC1pffHLkCoGJmv1sb_RpUQQMSwC1bhv42N8NW1M6LpbTx8O4G7ObAeWbI4KszffPP86AUQ48lIdCCPrrfLyMFp7f27GX8DZaKSV2kdIqVTiSEBa9zUpdSXlz_KA-4lKiJ2ya7YK8BRF007zWZrr2sDzG8y6curj-ajwrGMVhkopZ2B3F53yqqg"
        }
    );
    final QueryResult result = await client.mutate(options);

   // print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
     // print('graph json=>');
      //print(responseDetails);
      responsedata =CustomerModel.fromRawJson(responseDetails);
    }

    return responsedata;
  }

  //for login
  @override
  Future<LoginData> login(String email,String password) async {
    var responsedata;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery();
    final MutationOptions options =
        MutationOptions(document: AuthQuery.login,  // call the query
            variables:   {
              "input": {
                "email": email,
                "password": password
              }
            }
        );
    final QueryResult result = await client.mutate(options);

   // print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
     // print(responseDetails);
      responsedata = LoginData.fromJson(responseDetails);
    }

    return responsedata;
  }


}
