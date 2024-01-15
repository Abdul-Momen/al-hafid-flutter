import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class TGraphqlClass {
  //you check this website for graphql test
  //https://graphqlzero.almansi.me/#example-top

  static HttpLink httpLink = HttpLink(
    "https://alhafidh-app-test.myshopify.com/api/2023-01/graphql.json",
    defaultHeaders: {
     // 'Accept-Language': 'ar',
     // 'X-Shopify-Storefront-Access-Token': '81181c42519cec1c095f51480ebd81e6',
    },
  );

  static Link linkr = httpLink;

  static Link getLink() {
    // print("token calling");

    final AuthLink authLink = AuthLink(
        headerKey: 'X-Shopify-Storefront-Access-Token',
        getToken: () {
          // final token = await HelperUtils.getToken();
          // token get via shared preference
          // print(token.toString());
          return '81181c42519cec1c095f51480ebd81e6';
        });

    // print("token calling${authLink.requestTransformer.toString()}");
    return linkr = authLink.concat(linkr);
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
