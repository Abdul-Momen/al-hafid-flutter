import 'package:alhafidh/states/GraphqlConfig/graphql_provider.dart';
import 'package:alhafidh/states/GraphqlConfig/test_graphql_provider.dart';
import 'package:alhafidh/states/HelperUtils/global_constant.dart';
import 'package:alhafidh/states/Query/query_mutation.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/states/models/add_note_response.dart';
import 'package:alhafidh/states/models/associate_customer_response.dart';
import 'package:alhafidh/states/models/banner_collection_id.dart';
import 'package:alhafidh/states/models/create_cart_checkout.dart';
import 'package:alhafidh/states/models/get_shipping_rate.dart';
import 'package:alhafidh/states/models/set_shipping_address_response.dart';
import 'package:alhafidh/states/models/set_shipping_rate.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../models/retrive_cart_model.dart' as edge;

abstract class IHomeRepository {
  Future<BannerCollectionId> getBannerCollectionId({
    required String handle,
  });
}

class HomeRepository implements IHomeRepository {
  //for set shipping rate
  @override
  Future<BannerCollectionId> getBannerCollectionId(
      {required String handle}) async {
    var responsedata;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery();
    final MutationOptions options = MutationOptions(
        document: AuthQuery.getCollectionId, // call the query
        variables: {
          "handle": handle
        });
    final QueryResult result = await client.mutate(options);

     print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
      // print('get shipping rate json=>');
       print(responseDetails);
      responsedata = BannerCollectionId.fromRawJson(responseDetails);
    }

    return responsedata;
  }
}
