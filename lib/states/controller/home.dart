import 'dart:convert';
import 'package:alhafidh/states/Repository/home_repository.dart';
import 'package:alhafidh/states/models/banner_top_model.dart';
import 'package:alhafidh/states/models/faq_model.dart';
import 'package:alhafidh/states/models/filter_response_model.dart';
import 'package:alhafidh/states/models/onboarding_response.dart';
import 'package:alhafidh/states/models/page_model.dart';
import 'package:alhafidh/states/models/product_model.dart';
import 'package:alhafidh/states/models/rewards_model.dart';
import 'package:alhafidh/states/models/rewards_rules_model.dart';
import 'package:alhafidh/states/models/second_banner_model.dart';
import 'package:alhafidh/states/services/home.dart';
import 'package:alhafidh/states/services/products.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as dom;

class HomeController extends GetxController {
  var homeRepository = Get.put(HomeRepository());

  // banner loading
  RxBool bannerLoading = true.obs;

  // category loading
  RxBool categoryLoading = true.obs;

  // sub category loading
  RxBool subCategoryLoading = true.obs;

  // products loading
  RxBool productsLoading = true.obs;
  RxBool brandProductsLoading = true.obs;
  RxBool userPointsLoading = true.obs;
  RxBool rewardsRulesLoading = true.obs;
  RxBool redeemRewardsLoading = true.obs;
  RxBool specialProductsLoading = true.obs;
  RxBool newArrivalProductsLoading = true.obs;
  RxBool bestSellerProductsLoading = true.obs;
  RxBool allProductProductsLoading = true.obs;
  RxBool deleteAccountLoading = true.obs;

  RxBool onBoardingFirstLoading = true.obs;
  RxBool onBoardingSecondLoading = true.obs;

  RxBool onTopBannerLoading = true.obs;
  RxBool secondBannerLoading = true.obs;
  RxBool thirdBannerLoading = true.obs;
  RxBool fourBannerLoading = true.obs;

  RxBool bannerCollectionIdLoading = true.obs;

  //for home page banner
  OnbordingResponse? firstImage;
  OnbordingResponse? secondImage;
  BannerTop? topBanner;

  ReqardsPointModel? rewards;
  var rewardRules = <RewardsRulesModel>[].obs;

  //get media obj
  PageModel? mediaCenter;

  // product list
  var productList = <Products>[].obs;

  // brand product list
  var brandProductsList = <Product>[].obs;

  // brand product list
  var specialProductsList = <Product>[].obs;

  // brand product list
  var newArrivalProductsList = <Product>[].obs;

  // brand product list
  var bestSellerProductsList = <Product>[].obs;

  // brand product list
  var allProductsList = <Product>[].obs;

  var deleteCode = 0.obs;

  var images = <Asset>[].obs;

  var topBannerImageList = <String>[].obs;

  var topBannerIdList = <String>[].obs;
  var topBannerHandlerList = <String>[].obs;

  var secondBannerIdList = <String>[].obs;
  var secondBannerHandlerList = <String>[].obs;

  var thirdBannerIdList = <String>[].obs;
  var thirdBannerHandlerList = <String>[].obs;

  List<String> secondBannerImageList = [];
  List<String> thirdBannerImageList = [];
  List<String> forthBannerImageList = [];

  String bannerCollectionId = '';

  @override
  void onInit() {
    //get Band Product
    getBrandProducts(190864523323);

    //get special products
    getSpecialProducts(195594190907);

    //get new arrival
    getNewArrivalProducts(279780884539);

    //get best seller
    getBestSellerProducts(194856681531, true);

    //get all product
    getAllProducts(264319205435, true);

    //get reward rules
    getRewardsRules();

    super.onInit();
  }

  //get collection id graphQl
  void getBannerCollectionId({
    required String handle,
  }) async {
    bannerCollectionIdLoading(true);
    final result = await homeRepository.getBannerCollectionId(handle: handle);
    if (result.collectionByHandle.id.isNotEmpty) {
      //print('associateCustomer success =>');
      bannerCollectionId = result.collectionByHandle.id.toString();
      bannerCollectionIdLoading(false);
    } else {
      Get.snackbar("associateCustomer", "Unsuccessfully",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void getProducts() async {
    productsLoading.value = true;
    try {
      var response = await HomeService.getProducts();
      ProductListModel p = ProductListModel.fromJson(response);
      productList.value = p.products;
      // print('Product list=>');
      // print(response.toString());
    } finally {
      productsLoading.value = false;
    }
  }

  void getOnboardFristImage() async {
    onBoardingFirstLoading.value = true;
    try {
      var response = await HomeService.getOnboardFristImage();
      OnbordingResponse p = OnbordingResponse.fromJson(response);
      firstImage = p;
      //print('print onboarding 1 respone =>');
      // print(firstImage);
    } finally {
      onBoardingFirstLoading.value = false;
    }
  }

  //get product with category rest api
  void getBrandProducts(int collectionId) async {
    brandProductsLoading(true);
    try {
      var response = await ProductsService.getFilterAllProducts(
          collectionId: collectionId, stock: true);
      FilterProductResponseModel filterProductResponseModel =
          FilterProductResponseModel.fromJson(response);
      brandProductsList.value = filterProductResponseModel.products;
      // print('Product by id list=>');
      // print(response.toString());
    } finally {
      brandProductsLoading(false);
    }
  }

  //get User Points Api
  void getRewardsUserPoints({required String customerEmail}) async {
    userPointsLoading(true);
    try {
      var response =
          await ProductsService.getUsersPoints(customerEmail: customerEmail);
      rewards = ReqardsPointModel.fromJson(response);
      print('Rewards Points =>');
      //print(rewards!.availablePoints.toString());
    } finally {
      userPointsLoading(false);
    }
  }

  //get rewards Rules Api
  void getRewardsRules() async {
    rewardsRulesLoading(true);
    try {
      var response = await ProductsService.getRewardsRules();
      rewardRules.value = rewardsRulesModelFromJson(jsonEncode(response));
      // print('Rewards Rules =>');
      // print(v.length.toString());
    } finally {
      rewardsRulesLoading(false);
    }
  }

  //post redeem rewards point Api
  void redeemRewards({required int redeemId}) async {
    redeemRewardsLoading(true);
    try {
      var response =
          await ProductsService.postRedeemRewards(redeemId: redeemId);
      rewards = ReqardsPointModel.fromJson(response);
      // print('Rewards Rules =>');
      // print(v.length.toString());
    } finally {
      redeemRewardsLoading(false);
    }
  }

  //get product with category rest api
  void getSpecialProducts(int collectionId) async {
    specialProductsLoading(true);
    try {
      var response = await ProductsService.getFilterAllProducts(
          collectionId: collectionId, stock: true);
      FilterProductResponseModel filterProductResponseModel =
          FilterProductResponseModel.fromJson(response);
      specialProductsList.value = filterProductResponseModel.products;
      //  print('Product by id list=>');
      //  print(response.toString());
    } finally {
      specialProductsLoading(false);
    }
  }

  //get product with category rest api
  void getNewArrivalProducts(int collectionId) async {
    newArrivalProductsLoading(true);
    try {
      var response = await ProductsService.getFilterAllProducts(
          collectionId: collectionId, stock: true);
      FilterProductResponseModel filterProductResponseModel =
          FilterProductResponseModel.fromJson(response);
      newArrivalProductsList.value = filterProductResponseModel.products;
      // print('Product by id list=>');
      // print(response.toString());
    } finally {
      newArrivalProductsLoading(false);
    }
  }

  //get product with category rest api
  void getBestSellerProducts(int collectionId, bool stock) async {
    bestSellerProductsLoading(true);
    try {
      var response = await ProductsService.getFilterAllProducts(
          collectionId: collectionId, stock: stock);
      FilterProductResponseModel filterProductResponseModel =
          FilterProductResponseModel.fromJson(response);
      bestSellerProductsList.value = filterProductResponseModel.products;
      // print('Product by id list=>');
      // print(response.toString());
    } finally {
      bestSellerProductsLoading(false);
    }
  }

  //get product with category rest api
  void getAllProducts(int collectionId, bool stock) async {
    allProductProductsLoading(true);
    try {
      var response = await ProductsService.getFilterAllProducts(
          collectionId: collectionId, stock: true);
      FilterProductResponseModel filterProductResponseModel =
          FilterProductResponseModel.fromJson(response);
      allProductsList.value = filterProductResponseModel.products;
      //  print('Product by id list=>');
      //  print(response.toString());
    } finally {
      allProductProductsLoading(false);
    }
  }

  //delete account rest api
  void deleteAccount(int customerId) async {
    deleteAccountLoading(true);
    try {
      var response =
          await ProductsService.deleteAccount(customerId: customerId);
      deleteCode.value = response;
      print(deleteCode);
    } finally {
      deleteAccountLoading(false);
    }
  }

  void getOnboardSecondImage() async {
    onBoardingSecondLoading.value = true;
    try {
      var response = await HomeService.getOnboardSecondImage();
      OnbordingResponse p = OnbordingResponse.fromJson(response);
      secondImage = p;
      // images.value = p.asset;
      // print('print boarding 2 respone =>');
      // print(secondImage);
    } finally {
      onBoardingSecondLoading.value = false;
    }
  }

  void getTopBannerImage() async {
    onTopBannerLoading.value = true;
    try {
      var response = await HomeService.getMainBannerImage();
      BannerTop p = BannerTop.fromJson(response);
      topBanner = p;
      String result = p.the1554699267962.replaceAll("\n", "");
      //  List<String> payload = payloadFromJson(result);
      var document = parse(result);
      var imgList = document.querySelectorAll("img");

      for (dom.Element img in imgList) {
        print('imgggg');
        print(img.attributes["data-src"]!);
        topBannerImageList.add(img.attributes["data-src"]!);
      }


      ///for filter html to list
      var idlist = document.querySelectorAll("a");
      for (dom.Element id in idlist) {
        // print(img.attributes["data-src"]);
        topBannerIdList.add(id.attributes["href"]!);
      }

      print('total link list');
      print(topBannerIdList.length);

      ///for filter html to list
      for (int i = 0; i < topBannerIdList.length; i++) {
        // topBannerIdList[i].replaceAll(new RegExp('/collections/'), '').replaceAll(new RegExp('https://alhafidh.com'), '').split('?');
        final split = topBannerIdList[i]
            .replaceAll(new RegExp('/collections/'), '')
            .replaceAll(new RegExp('https://alhafidh.com'), '')
            .split('?');
        /* final Map<int, String> values = {
          for (int i = 0; i < split.length; i++)
            i: split[i]
        };*/
        // print(split[0]);
        //   topBannerHandlerList.add(topBannerIdList[i].replaceAll(new RegExp('/collections/'), '').replaceAll(new RegExp('https://alhafidh.com'), ''));
        topBannerHandlerList.add(split[0]);
      }

      // topBannerHandlerList.value = new List.from(topBannerHandlerList.reversed);
      print('test list');
      print(topBannerHandlerList);

      final filteredIdList = topBannerImageList.where((item) {
        return item.contains('Mobile');
      }).toList();

      final filteredIdList2 = topBannerImageList.where((item) {
        return item.contains('mobile');
      }).toList();

      //  print('filter item search to  list ');
      // print(filteredIdList);
      topBannerImageList.value = filteredIdList;
      topBannerImageList.addAll(filteredIdList2);

      topBannerImageList.forEach((e) {
        print('image  list+');
        print(e);
      });

      //  topBannerImageList.value = new List.from(topBannerImageList.reversed);
      print('dynamic image id list ');
      // print(topBannerImageList);
      print(topBannerIdList);
      print(topBannerImageList);

      // images.value = p.asset;
      //print('print top banner response =>');
      //print(topBanner!.the1554699267962.toString());
    } finally {
      onTopBannerLoading.value = false;
    }
  }

  void get2ndBannerImage() async {
    secondBannerLoading.value = true;
    try {
      var response = await HomeService.get2ndBannerImage();
      SecondBannerModel p = SecondBannerModel.fromJson(response);

      String result = p.the1531902587175.replaceAll("\n", "");
      //  List<String> payload = payloadFromJson(result);
      var document = parse(result);
      var imgList = document.querySelectorAll("img");

      for (dom.Element img in imgList) {
        //print(img.attributes["data-src"]);
        secondBannerImageList.add(img.attributes["data-src"]!);
      }

      ///for filter html to list
      var idlist = document.querySelectorAll("a");
      for (dom.Element id in idlist) {
        // print(img.attributes["data-src"]);
        secondBannerIdList.add(id.attributes["href"]!);
      }

      ///for filter html to list
      for (int i = 0; i < secondBannerIdList.length; i++) {
        // topBannerIdList[i].replaceAll(new RegExp('/collections/'), '').replaceAll(new RegExp('https://alhafidh.com'), '').split('?');
        final split = secondBannerIdList[i]
            .replaceAll(new RegExp('/collections/'), '')
            .replaceAll(new RegExp('https://alhafidh.com'), '')
            .split('?');
        /* final Map<int, String> values = {
          for (int i = 0; i < split.length; i++)
            i: split[i]
        };*/
        // print(split[0]);
        //   topBannerHandlerList.add(topBannerIdList[i].replaceAll(new RegExp('/collections/'), '').replaceAll(new RegExp('https://alhafidh.com'), ''));
        secondBannerHandlerList.add(split[0]);
      }

      print('2nd banner id list');
      print(secondBannerHandlerList);
      /* final filteredIdList = secondBannerImageList.where((item) {
        return item.contains('Mobile');
      }).toList();

      final filteredIdList2 = secondBannerImageList.where((item) {
        return item.contains('mobile');
      }).toList();
*/
      //  print('filter item search to  list ');
      // print(filteredIdList);
      //  secondBannerImageList = filteredIdList;
      // secondBannerImageList.addAll(filteredIdList2);
      // print('dynamic 2nd image list ');
      // print(secondBannerImageList);

      // images.value = p.asset;
      //print('print top banner response =>');
      //print(topBanner!.the1554699267962.toString());
    } finally {
      secondBannerLoading.value = false;
    }
  }
}
