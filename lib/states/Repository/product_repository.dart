import 'package:alhafidh/states/GraphqlConfig/graphql_provider.dart';
import 'package:alhafidh/states/GraphqlConfig/graphql_admin_provider.dart';
import 'package:alhafidh/states/GraphqlConfig/test_graphql_provider.dart';
import 'package:alhafidh/states/HelperUtils/global_constant.dart';
import 'package:alhafidh/states/Query/query_mutation.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/states/models/all_category_model.dart';
import 'package:alhafidh/states/models/create_cart.dart';
import 'package:alhafidh/states/models/create_cart_checkout.dart';
import 'package:alhafidh/states/models/product_description_tr_model.dart';
import 'package:alhafidh/states/models/related_prodcut_model.dart';
import 'package:alhafidh/states/models/remove_cart_model.dart';
import 'package:alhafidh/states/models/retrive_cart_model.dart';
import 'package:alhafidh/states/models/search_response.dart';
import 'package:alhafidh/states/models/trans_ar_product.dart';
import 'package:alhafidh/states/models/update_cart_response.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:gql/language.dart';
import '../models/retrive_cart_model.dart';

import '../models/another_create_cart.dart';

abstract class IProductRepository {

  Future<RecommendProduct> relatedProduct(String pId);

  Future<SearchResponse> searchProduct(int totalItm, String searchTxt);

  Future<CreateCartModel> cartCreate(String merchandiseId, int quantity);

  Future<UpdateCartResponse> updateCart(
      String merchandiseId, int quantity, String id, String cartId);

  Future<AnotherCartModel> cartAnotherCreate(
      String merchandiseId, String cartId, int quantity);

  Future<RetriveCartListModel> retriveCartList(
    String cartId,
  );

  Future<RemoveCartModel> removeFromCart(String cartId, String linesId);

  Future<ProductDescriptionTrModel> getProductDescriptionTrAr(String handle);

  Future<AllCategoryModel> getAllCategory();
}

class ProductRepository implements IProductRepository {
  //for createCart CheckOUt in my cart
  @override
  Future<CreateCheckoutCartResponse> createBuyNowCheckout(String pId) async {
    var responsedata;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery();
    final MutationOptions options = MutationOptions(
        document: AuthQuery.createBuyNowCheckout, // call the query
        variables: {
          "merchandiseId": "gid://shopify/ProductVariant/$pId",
          "quantity": 1
        });
    final QueryResult result = await client.mutate(options);

    print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
      print('crete Buy now checkout json=>');
      print(responseDetails);
      responsedata = CreateCheckoutCartResponse.fromRawJson(responseDetails);
    }

    return responsedata;
  }

  //for related product
  @override
  Future<SearchResponse> searchProduct(int totalItem, String searchTxt) async {
    var responsedata;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery();
    final MutationOptions options = MutationOptions(document: parseString('''
{
    products(first: $totalItem, query: "$searchTxt") {
      edges {
        node {
            id
            title,
            vendor,
            handle,
            productType,
            images(first: 1) {
                edges {
                    node {
                    originalSrc
                    }
                }
            },
            variants(first: 1) {
                edges {
                    node {
                        sku
                        barcode
                        availableForSale
                        id
                        compareAtPrice {
                            amount
                            currencyCode
                        }
                        price {
                            amount
                            currencyCode
                        }
                        
                              
                    }
                }
            }
        }
      }
    }
  }
  ''') // call the query
        );
    final QueryResult result = await client.mutate(options);
    print(result.toString());
    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
      print('Product related json=>');
      print(responseDetails);
      responsedata = SearchResponse.fromRawJson(responseDetails);
    }

    return responsedata;
  }

  //for related product
  @override
  Future<RecommendProduct> relatedProduct(String pId) async {
    var responsedata;
    print("is arabic " + Preference.getIsArabicFlag().toString());

    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery();
    final MutationOptions options = MutationOptions(
        document: AuthQuery.relatedProduct,
        variables: {
          "productId": "gid://shopify/Product/$pId",
          "variantsFirst": 1,
          "imagesFirst": 1
        },
        // ignore cache data if any
        // cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
        fetchPolicy: FetchPolicy.cacheAndNetwork,
        errorPolicy: ErrorPolicy.none,
        cacheRereadPolicy: CacheRereadPolicy.mergeOptimistic);
    final QueryResult result = await client.mutate(options);

    print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
      print('Product related json=>');
      print(responseDetails);
      responsedata = RecommendProduct.fromRawJson(responseDetails);
    }

    return responsedata;
  }

  //for get all category
  @override
  Future<AllCategoryModel> getAllCategory() async {
    var responsedata;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery();
    final MutationOptions options =
        MutationOptions(document: AuthQuery.getAllCategory // call the query
            );
    final QueryResult result = await client.mutate(options);

    print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
      print('get all category json=>');
      print(responseDetails);
      responsedata = AllCategoryModel.fromRawJson(responseDetails);
    }

    return responsedata;
  }

  //for create cart
  @override
  Future<CreateCartModel> cartCreate(String merchandiseId, int quantity) async {
    var responsedata;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery();
    final MutationOptions options = MutationOptions(
        document: AuthQuery.createCart, // call the query
        variables: {"merchandiseId": merchandiseId, "quantity": quantity});
    final QueryResult result = await client.mutate(options);

    print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
      print('graph create cart json=>');
      print(responseDetails);
      responsedata = CreateCartModel.fromRawJson(responseDetails);
    }

    return responsedata;
  }

  //for update cart
  @override
  Future<UpdateCartResponse> updateCart(
      String merchandiseId, int quantity, String id, String cartId) async {
    var responsedata;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery();
    final MutationOptions options = MutationOptions(
        document: AuthQuery.updateCart, // call the query
        variables: {
          "cartId": cartId,
          "lines": [
            {"id": id, "merchandiseId": merchandiseId, "quantity": quantity}
          ]
        });
    final QueryResult result = await client.mutate(options);

    print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
      print('update cart json=>');
      print(responseDetails);
      responsedata = UpdateCartResponse.fromRawJson(responseDetails);
    }

    return responsedata;
  }

  //for create Another cart
  @override
  Future<AnotherCartModel> cartAnotherCreate(
      String merchandiseId, String cartId, int quantity) async {
    var responsedata;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery();
    final MutationOptions options = MutationOptions(
        document: AuthQuery.createAnotherCart, // call the query
        variables: {
          "cartId": cartId,
          "lines": [
            {"merchandiseId": merchandiseId, "quantity": quantity}
          ]
        });
    final QueryResult result = await client.mutate(options);

    print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
      print('graph create cart json=>');
      print(responseDetails);
      responsedata = AnotherCartModel.fromRawJson(responseDetails);
    }

    return responsedata;
  }

  //for removed from cart
  @override
  Future<RemoveCartModel> removeFromCart(String cartId, String linesId) async {
    var responsedata;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery();
    final MutationOptions options = MutationOptions(
        document: AuthQuery.removeFromCart, // call the query
        variables: {
          "cartId": cartId,
          "lineIds": [linesId]
        });
    final QueryResult result = await client.mutate(options);

    print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
      print('graph remove from list =>');
      print(responseDetails);
      responsedata = RemoveCartModel.fromRawJson(responseDetails);
    }

    return responsedata;
  }

  //for removed from cart
  @override
  Future<RemoveCartModel> removeAllFromCart(String cartId, List<String> linesIds) async {
    var responsedata;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery();
    final MutationOptions options = MutationOptions(
        document: AuthQuery.removeFromCart, // call the query
        variables: {
          "cartId": cartId,
          "lineIds": linesIds
        });
    final QueryResult result = await client.mutate(options);

    print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
      print('graph remove from list =>');
      print(responseDetails);
      responsedata = RemoveCartModel.fromRawJson(responseDetails);
    }

    return responsedata;
  }

  //for Retrieve cart list
  @override
  Future<RetriveCartListModel> retriveCartList(String cartId) async {
    var responsedata;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery();
    final MutationOptions options = MutationOptions(
        document: AuthQuery.retriveCart, // call the query
        variables: {"id": '$cartId'});
    final QueryResult result = await client.mutate(options);

    // print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
     // HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
      // print('graph create cart json=>');
      // print(responseDetails);
      responsedata = RetriveCartListModel.fromRawJson(responseDetails);
    }

    return responsedata;
  }

  //for Retrieve cart list for Admin graph Ql
  @override
  Future<TranslateArProduct> getProductDetailsTrAr(
      String productId, String local) async {
    print('test 111');

    var responsedata;
    GraphqlTrClass graphqlClass = GraphqlTrClass();
    GraphQLClient client = graphqlClass.clientToQuery();
    final MutationOptions options = MutationOptions(
      document: parseString('''
query {
  translatableResource(resourceId: "gid://shopify/Product/$productId") {
        resourceId
        translations(locale: "$local") {
          key
          value
          locale
        }
  }
}
  '''), //   // call the query
    );
    final QueryResult result = await client.mutate(options);

    print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
      print('print tr product json=>');
      print(responseDetails);
      responsedata = TranslateArProduct.fromRawJson(responseDetails);
    }

    return responsedata;
  }

  //for Retrieve cart list for Admin graph Ql

  @override
  Future<ProductDescriptionTrModel> getProductDescriptionTrAr(
      String handle) async {
    print('test description ');

    var responsedata;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery();
    final MutationOptions options = MutationOptions(
      document: parseString('''query productDetails @inContext(language: AR){
  product(handle: "$handle") { 
    metafield: metafield(namespace: "c_f", key: "description_excerpt") {
      value
      type
    }
  }
}'''), //   // call the query
    );
    final QueryResult result = await client.mutate(options);

    print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
      print('print tr description json=>');
      print(responseDetails);
      responsedata = ProductDescriptionTrModel.fromRawJson(responseDetails);
    }

    return responsedata;
  }
}
