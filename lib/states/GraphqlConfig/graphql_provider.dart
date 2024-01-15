import 'dart:developer';

//import 'package:alhafidh/states/GraphqlConfig/link_provider.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphqlClass {
  //you check this website for graphql test
  //https://graphqlzero.almansi.me/#example-top

  static prinstLnConde() {
    print(" t t " + Preference.getIsArabicFlag().toString());
  }

 // static Link linkr = LinkProvider().httpLink;

  static Link getLink() {
    //  print("token calling");

    final AuthLink authLink = AuthLink(
        headerKey: 'X-Shopify-Storefront-Access-Token',
        getToken: () {
          // final token = await HelperUtils.getToken(); // token get via shared preference
          // print(token.toString());
          return 'bb54c2f93d8acc6dc5c043e3730f5c85';
        });

    // print("token calling${authLink.requestTransformer.toString()}");
    HttpLink httpLink = HttpLink(
      "https://alhafidh.myshopify.com/api/2023-01/graphql.json",
      defaultHeaders: {
        'Accept-Language': Preference.getIsArabicFlag() ? 'ar' : 'en',
        // 'X-Shopify-Storefront-Access-Token': 'bb54c2f93d8acc6dc5c043e3730f5c85',
      },
    );
    return authLink.concat(httpLink);
  }

  ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
    GraphQLClient(
      cache: GraphQLCache(store: InMemoryStore()),
      link:
          getLink(), // here if you have bearer token token then use this function 'getLink()' otherwise linkr
    ),
  );

  GraphQLClient clientToQuery() {
    // here if you have bearer token token then use this function 'getLink()' otherwise linkr
    return GraphQLClient(
      link: getLink(),
      cache: GraphQLCache(store: InMemoryStore()),
    );
  }
}
