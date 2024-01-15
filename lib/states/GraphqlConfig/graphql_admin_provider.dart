import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphqlTrClass {

  //you check this website for graphql test
  //https://graphqlzero.almansi.me/#example-top

static HttpLink httpLink = HttpLink("https://alhafidh.myshopify.com/admin/api/2023-01/graphql.json");

static Link linkr = httpLink;

  static Link getLink() {
  //  print("token calling");

    final AuthLink authLink = AuthLink(
        headerKey: 'X-Shopify-Access-Token',
        getToken: ()  {
          // final token = await HelperUtils.getToken(); // token get via shared preference
          // print(token.toString());
          return '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'; }
    );

  //  print("token calling${authLink.requestTransformer.toString()}");
    return linkr = authLink.concat(linkr);
  }


  ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
    GraphQLClient(
      cache: GraphQLCache(store: InMemoryStore()),
      link: getLink(),  // here if you have bearer token token then use this function 'getLink()' otherwise linkr
    ),
  );

  GraphQLClient clientToQuery()
  {
    // here if you have bearer token token then use this function 'getLink()' otherwise linkr
    return GraphQLClient(link: getLink(), cache:GraphQLCache(store: InMemoryStore()),
    );
  }
}