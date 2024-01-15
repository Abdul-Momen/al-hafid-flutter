import 'dart:convert';

import 'package:alhafidh/states/Repository/product_repository.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/states/models/all_category_model.dart';
import 'package:alhafidh/states/models/exchange_model.dart';
import 'package:alhafidh/states/models/filter_all_option_response_model.dart';
import 'package:alhafidh/states/models/filter_response_model.dart';
import 'package:alhafidh/states/models/product_details_model.dart';
import 'package:alhafidh/states/models/related_prodcut_model.dart';
import 'package:alhafidh/states/models/related_product_model.dart';
import 'package:alhafidh/states/models/review_model.dart';
import 'package:alhafidh/states/models/store_locator_model.dart';
import 'package:alhafidh/states/models/trans_ar_product.dart';
import 'package:alhafidh/states/services/products.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../models/retrive_cart_model.dart';

class ProductsController extends GetxController {
  var productsRepository = Get.put(ProductRepository());
  RxBool productsLoading = true.obs;
  RxBool relatedProductsLoading = true.obs;
  RxBool reviewProductsLoading = true.obs;
  RxBool productDetailsLoading = true.obs;
  RxBool storeLocatorLoading = true.obs;
  RxBool filterAllOptionDataLoading = true.obs;
  RxBool filterDataLoading = true.obs;
  RxBool filterProductsLoading = true.obs;
  RxBool searchProductsLoading = true.obs;

  RxBool exchangeLoading = true.obs;

  // category loading
  RxBool categoryLoading = true.obs;

  // category loading
  // RxBool searchLoading = true.obs;

  // category loading
  RxBool productDtTrLoading = true.obs;
  RxBool productDescriptionTrLoading = true.obs;
  RxBool productTrLoading = true.obs;

  // var searchProductList = <ProductsEdge>[].obs;
  var translateProductDtlist = <Translation>[].obs;

  RxString arHtml =''.obs;
  RxString pImageIndx =''.obs;

  // var productList = <Products>[].obs;

  var productRelatedList = <Product>[].obs;
  var productAllList = <Product>[].obs;
  var productSearchList = <Product>[].obs;
  var tproductRelatedList = <RelatedProduct>[].obs;
  var recommendationProdcutList = <ProductRecommendation>[].obs;

  var reviewList = <Review>[].obs;
  var storeLocatorList = <StoreLocatorModel>[].obs;
  var serviceLocatorList = <StoreLocatorModel>[].obs;
  var allLocatorList = <StoreLocatorModel>[].obs;

  // var relatedProductList = <ProductsEdge>[].obs;

  ProductDetailsModel? pDetailsModel;
  ExchangeModel? exchangeModel;

  // var productList;
  var categoryList = <MItem>[].obs;

  // var product Sort by list;
  var sortByList = <FOption>[].obs;
  var vendorList = <FOption>[].obs;
  var priceList = <FOption>[].obs;
  var colorList = <FOption>[].obs;
  var typeList = <FOption>[].obs;
  var tvTypeList = <FOption>[].obs;
  var displaySizeList = <FOption>[].obs;
  var stockList = <FOption>[].obs;
  var cfCapacityList = <FOption>[].obs;

  var washingTypeList = <FOption>[].obs;
  var coolingCapacityList = <FOption>[].obs;
  var doorStyleList = <FOption>[].obs;
  var compressorTypeList = <FOption>[].obs;
  var capacityTypeList = <FOption>[].obs;

  var promoCodes = <String>[].obs;
  var promoImages = <String>[].obs;

  // sub category list
  var subCategoryList = <MItem>[].obs;
  var subAndSubCategoryList = <SItem>[].obs;
  FilterAllOptionResponseModel? filterAllOptionResponseModel;
  FilterProductResponseModel? filterProductResponseModel;
  FilterProductResponseModel? searchProductResponseModel;


  //double exchangeRate=1309.94;
  RxDouble exchangeRate = Preference.getExchangeRate().obs;

  // RxInt pId=4493035864123.obs;

  List<String> trTitle = List.empty(growable: true);

  int totalPage = 5;

  RxBool isOnBoard=false.obs;


  @override
  void onInit() {
    getExchangeRate();
    super.onInit();
  }


  //get all category graphQl Api
  void getAllCategory() async {
    categoryLoading(true);

    final result = await productsRepository.getAllCategory();
    if (result.menu != null) {
      // print('get category list success =>');

      categoryList.value = result.menu.mitems
          .where(
              (x) => x.type.toLowerCase().contains("COLLECTION".toLowerCase()))

          .toList();
      subCategoryList.value = result.menu.mitems;
      categoryLoading(false);
      //  print(
      //      'filter 1 items id   =>${result.menu.mitems[0].id.replaceAll(new RegExp(r'[^0-9]'), '')}');
    } else {
      Get.snackbar("get category list", "Unsuccessfully",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

/*
  //get search product graphQl api
  void getSearchProduct(String serTxt) async {
    searchLoading(true);
    final result = await productsRepository.searchProduct(50, serTxt);
    if (result.products.edges.isNotEmpty) {
     // print('get search list success =>');
      searchProductList.value = result.products.edges;
      searchLoading(false);
    } else {
      Get.snackbar("Empty list", "can't find any product",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
*/

  //get search product graphQl api
  void getDtTranProductAr(String productId) async {
    productDtTrLoading(true);
    final result =
        await productsRepository.getProductDetailsTrAr(productId, 'ar');
    if (result.translatableResource.translations.isNotEmpty) {
      //  print('get search list success =>');
      translateProductDtlist.value = result.translatableResource.translations;
      //trTitle.add( translateProductDtlist[0].value);
      productDtTrLoading(false);
    } else {
      Get.snackbar("Empty list", "can't find any product",
          snackPosition: SnackPosition.BOTTOM);
    }
  }


  //get search product graphQl api
  void getDescriptionTranProductAr(String handle) async {
    productDescriptionTrLoading(true);
    final result = await productsRepository.getProductDescriptionTrAr(handle);
    if (result.product.metafield.value.isNotEmpty) {
        print('get search list success =>');
      arHtml.value = result.product.metafield.value;
      //trTitle.add( translateProductDtlist[0].value);
      productDescriptionTrLoading(false);
    } else {
      Get.snackbar("Empty list", "can't find any product",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  //get search product graphQl api
  Future<bool> getTranProductAr(List<Edge> cartItemList) async {
    productTrLoading(true);
    print('test 1');

    try {
      for (int i = 0; i < cartItemList.length; i++) {
        //  print('test 2');
        /* print('test id '+ cartItemList[i]
            .node
            .merchandise
            .product
            .id
            .replaceAll(RegExp(r'[^0-9]'), '').toString());*/

        final result = await productsRepository.getProductDetailsTrAr(
            cartItemList[i]
                .node
                .merchandise
                .product
                .id
                .replaceAll(RegExp(r'[^0-9]'), '')
                .toString(),
            Preference.getIsArabicFlag() ? 'ar' : 'ar');

        if (result.translatableResource.translations.isNotEmpty) {
          //  print('get search list success =>');
          translateProductDtlist.value =
              result.translatableResource.translations;
          //add
          trTitle.add(translateProductDtlist[0].value);
          //print('test 3');

          // print("value = "+translateProductDtlist[0].value.toString());
        } else {
          Get.snackbar("Empty list", "can't find any product",
              snackPosition: SnackPosition.BOTTOM);
        }
      }
    } finally {
      productTrLoading(false);
      // print('test 4');
      return true;
    }
  }

  /*//get product with category rest api
  void getProducts(int collectionId) async {
    productsLoading(true);
    try {
      var response =
          await ProductsService.getProducts(collectionId: collectionId);
      ProductListModel p = ProductListModel.fromJson(response);
      productList.value = p.products;
      print('Product by id list=>');
      print(response.toString());
    } finally {
      productsLoading(false);
    }
  }
*/

/*
  //get related product list
  void getRelatedProducts(int pId) async {
    relatedProductsLoading(true);
    try {
      var response =
          await ProductsService.getRelatedProducts(pId: pId);
      RelatedProductModel p = RelatedProductModel.fromJson(response);
      tproductRelatedList.value = p.products;
      print('Related Product by id list=>');
      print(response.toString());
    } finally {
      relatedProductsLoading(false);
    }
  }
*/

  //get related product list
  void getReviewProducts(int productId) async {
    reviewProductsLoading(true);
    try {
      var response =
          await ProductsService.getReviewProducts(productId: productId);
      ReviewModel r = ReviewModel.fromJson(response);
      reviewList.value = r.reviews;
      //print('Review list=>');
      //print(response.toString());
    } finally {
      reviewProductsLoading(false);
    }
  }

  //get exchange rate
  void getExchangeRate() async {
    exchangeLoading(true);
    try {
      var response = await ProductsService.getExchangeRate(productId: 333333);
      ExchangeModel r = ExchangeModel.fromJson(response);
      exchangeModel = r;

      print('exchange json =>');
      print(r.asset.value.toString());

      var decodeResponse = jsonDecode(r.asset.value);
      String rate = jsonEncode(decodeResponse['current']['manual_exchange_rate']);
      String code = jsonEncode(decodeResponse['current']['custom_promocode']);
      String image = jsonEncode(decodeResponse['current']['images_custom_promocode']);
      String flash = jsonEncode(decodeResponse['current']['flash_screen']);

      isOnBoard.value=bool.parse(flash);

      exchangeRate.value = double.parse(rate.replaceAll(RegExp(r'[^0-9.]'), ''));

      print('rate==>' + exchangeRate.value.toString());
      print('code==>' + code.toString());
      print('img==>' + image.toString());
      print('flash==>' + flash.toString());

      List<String> result = code.replaceAll(RegExp('"'), '').split(',');
      List<String> codelist = result.map((element) => element.toString()).toList();

      print('code list ==>' + codelist.toString());

      promoCodes.value=codelist;


      List<String> images = image.replaceAll(RegExp('"'), '').split(',');
      List<String> imagelist = images.map((element) => element.toString()).toList();

      print('image list ==>' + codelist.toString());
      print(imagelist);
      promoImages.value=imagelist;

      Preference.setExchangeRate(exchangeRate.value);
      Preference.setPromoCodes(codelist);
      Preference.setPromoImages(imagelist);

    } finally {
      exchangeLoading(false);
    }
  }

  //get Store locator list
  void getStoreLocator(String qName, String qAddress) async {
    storeLocatorLoading(true);
    try {
      var response = await ProductsService.getStoreLocator(
          qName: qName, qAddress: qAddress);
      // print('get Store locator list=>');
      // print(response.toString());
      allLocatorList.value = storeLocatorModelFromJson(jsonEncode(response));

      //filter service list
      serviceLocatorList.value = allLocatorList
          .where((x) => x.tags.filter[0]
              .toLowerCase()
              .contains("Service Center".toLowerCase()))
          .toList();

      //filter store list
      storeLocatorList.value = allLocatorList
          .where((x) =>
              x.tags.filter[0].toLowerCase().contains("Showroom".toLowerCase()))
          .toList();
      // StoreLocatorModels=StoreLocatorModel.fromJson(response);
    } finally {
      storeLocatorLoading(false);
    }
  }

  //get customer data graph ql api
  void getRelatedProductsGpl({required String pId}) async {
    relatedProductsLoading(true);
    final result = await productsRepository.relatedProduct(pId);

    if (result.productRecommendations.isNotEmpty) {
      print('get related graph Ql response =>');
      recommendationProdcutList.value = result.productRecommendations;
      relatedProductsLoading(false);
    } else {
      Get.snackbar("customer data null", "get customer data",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  //get product details
  void getProductDetails({required int productMasterID}) async {
    productDetailsLoading(true);
    try {
      var response =
          await ProductsService.getProductDetails(pID: productMasterID);
      //print('response =>');
      // print(response.toString());
      pDetailsModel = ProductDetailsModel.fromJson(response);
      // print('Details Product =>');
      // print(response.toString());
    } finally {
      productDetailsLoading(false);
      if (pDetailsModel != null) {
        ///get product by category
        /*getProducts(
          pDetailsModel!.categoryRequestModels.isNotEmpty
              ? pDetailsModel!.categoryRequestModels[0].categoryId
              : 575,
        );*/
      }
    }
  }

  void getFilterAllOptionData({required int collectionId}) async {
    filterAllOptionDataLoading(true);
    try {
      var response = await ProductsService.getFilterAllOptionData(
          collectionId: collectionId);
      filterAllOptionResponseModel =
          FilterAllOptionResponseModel.fromJson(response);
      if (filterAllOptionResponseModel != null) {
        // print('filter length:${filterAllOptionResponseModel!.filter.options.length}');

        // sort list
        sortByList.value = filterAllOptionResponseModel!.filter.options
            .where(
                (x) => x.label.toLowerCase().contains('Sort by'.toLowerCase()))
            .toList();

        //vendor list
        vendorList.value = filterAllOptionResponseModel!.filter.options
            .where(
                (x) => x.label.toLowerCase().contains("vendor".toLowerCase()))
            .toList();

        //product type list
        typeList.value = filterAllOptionResponseModel!.filter.options
            .where((x) =>
                x.label.toLowerCase().contains("Product Type".toLowerCase()))
            .toList();

        //tv type list
        tvTypeList.value = filterAllOptionResponseModel!.filter.options
            .where(
                (x) => x.label.toLowerCase().contains("TV Type".toLowerCase()))
            .toList();

        //color list
        colorList.value = filterAllOptionResponseModel!.filter.options
            .where((x) => x.label.toLowerCase().contains("Color".toLowerCase()))
            .toList();

        //display size list
        displaySizeList.value = filterAllOptionResponseModel!.filter.options
            .where((x) =>
                x.label.toLowerCase().contains("Display Sizes".toLowerCase()))
            .toList();

        //stock size list
        stockList.value = filterAllOptionResponseModel!.filter.options
            .where((x) =>
                x.label.toLowerCase().contains("Stock Status".toLowerCase()))
            .toList();

        //Cf capacity list
        cfCapacityList.value = filterAllOptionResponseModel!.filter.options
            .where((x) =>
                x.label.toLowerCase().contains("CF Capacity".toLowerCase()))
            .toList();

        // washingTypeList list
        washingTypeList.value = filterAllOptionResponseModel!.filter.options
            .where((x) =>
                x.label.toLowerCase().contains("Washing Type".toLowerCase()))
            .toList();

        //coolingCapacity List
        coolingCapacityList.value = filterAllOptionResponseModel!.filter.options
            .where((x) => x.label
                .toLowerCase()
                .contains("Cooling Capacity".toLowerCase()))
            .toList();

        //Compressor Type list
        compressorTypeList.value = filterAllOptionResponseModel!.filter.options
            .where((x) =>
                x.label.toLowerCase().contains("Compressor Type".toLowerCase()))
            .toList();

        //Door Style list
        doorStyleList.value = filterAllOptionResponseModel!.filter.options
            .where((x) =>
                x.label.toLowerCase().contains("Door Style".toLowerCase()))
            .toList();

        /*  //Cf capacity list
        capacityTypeList.value = filterAllOptionResponseModel!.filter.options
            .where((x) =>
                x.label.toLowerCase().contains("Capacity".toLowerCase()))
            .toList();*/
/*

      //Cf capacity list
        cfCapacityList.value = filterAllOptionResponseModel!.filter.options
            .where((x) =>
                x.label.toLowerCase().contains("Washing Type".toLowerCase()))
            .toList();

      //Cf capacity list
        cfCapacityList.value = filterAllOptionResponseModel!.filter.options
            .where((x) =>
                x.label.toLowerCase().contains("Washing Type".toLowerCase()))
            .toList();
*/
      } else {
        //print('LLL');
      }
    } finally {
      // print('sdd');
      filterAllOptionDataLoading(false);
    }
  }

  void getFilterAllProducts({
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
  }) async {
    filterProductsLoading(true);
    try {
      var response = await ProductsService.getFilterAllProducts(
        collectionId: collectionId,
        sortBy: sortBy,
        vendorList: vendorList,
        selectedTvType: selectedTvType,
        selectedDisplaySize: selectedDisplaySize,
        selectedStock: selectedStock,
        selectedProductType: selectedProductType,
        selectedColor: selectedColor,
        selectedCfCapacity: selectedCfCapacity,
        pageNum: pageNum,
        selectedWashingType: selectedWashingType,
        selectedCompressorType: selectedCompressorType,
        selectedDoorStyle: selectedDoorStyle,
        selectedCoolingCapacity: selectedCoolingCapacity,
      );
      filterProductResponseModel =
          FilterProductResponseModel.fromJson(response);

      if (filterProductResponseModel != null) {
        //print('filter product legth:${filterProductResponseModel!.products.length}');
        productRelatedList.value = filterProductResponseModel!.products;

        var v = filterProductResponseModel!.totalProduct / 10;
        totalPage = v.round();

      } else {
        // print('LLL');
      }
    } finally {
      // print('sdd');
      filterProductsLoading(false);
    }
  }


  void getLoadMoreFilterAllProducts({
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
  }) async {
    filterProductsLoading(true);
    try {
      var response = await ProductsService.getFilterAllProducts(
        collectionId: collectionId,
        sortBy: sortBy,
        vendorList: vendorList,
        selectedTvType: selectedTvType,
        selectedDisplaySize: selectedDisplaySize,
        selectedStock: selectedStock,
        selectedProductType: selectedProductType,
        selectedColor: selectedColor,
        selectedCfCapacity: selectedCfCapacity,
        pageNum: pageNum,
        selectedWashingType: selectedWashingType,
        selectedCompressorType: selectedCompressorType,
        selectedDoorStyle: selectedDoorStyle,
        selectedCoolingCapacity: selectedCoolingCapacity,
      );
      filterProductResponseModel =
          FilterProductResponseModel.fromJson(response);

      if (filterProductResponseModel != null) {
        //print('filter product legth:${filterProductResponseModel!.products.length}');
        productAllList.addAll(filterProductResponseModel!.products);

        print("lenth p =" +productAllList.length.toString());

        var v = filterProductResponseModel!.totalProduct / 10;
        totalPage = v.round();

      } else {
        // print('LLL');
      }
    } finally {
      // print('sdd');
      filterProductsLoading(false);
    }
  }

  //get search product
  void getSearchAllProducts({
    required String q,
  }) async {
    searchProductsLoading(true);
    try {
      var response = await ProductsService.getSearchAllProducts(
        q: q,
      );
      searchProductResponseModel =
          FilterProductResponseModel.fromJson(response);

      if (searchProductResponseModel != null) {
        //print('filter product length:${filterProductResponseModel!.products.length}');
        productSearchList.value = searchProductResponseModel!.products;
      } else {
        print('ttts');
      }
    } finally {
      // print('sdd');
      searchProductsLoading(false);
    }
  }

/* void getCartItems(int customerID) async {
    cartItemsLoading(true);
    try {
      var response = await ProductsService.getCartItems(customerId: customerID);
      cartItemList.value = cartItemListModelFromJson(jsonEncode(response));
    } finally {
      cartItemsLoading(false);
    }
  }

  Future<bool> addToCart(CartItemModel cModel) async {
    addToCartLoading(true);
    try {
      var response = await ProductsService.addToCart(payload: cModel.toJson());
      carRequestModel = CartItemModel.fromJson(response);
      return true;
    } finally {
      addToCartLoading(false);
    }
  }

  Future<bool> removeFromCart(CartItemModel cModel) async {
    addToCartLoading(true);
    try {
      var response =
          await ProductsService.removeFromCart(payload: cModel.toJson());
      carRequestModel = CartItemModel.fromJson(response);
      return true;
    } finally {
      addToCartLoading(false);
    }
  }

  Future<bool> removeItemFromCart({required int cartID}) async {
    removeItemFromCartLoading(true);
    try {
      var response = await ProductsService.removeItemFromCart(cartId: cartID);
      return true;
    } finally {
      removeItemFromCartLoading(false);
    }
  }*/
}
