
import 'package:alhafidh/states/Repository/product_repository.dart';
import 'package:alhafidh/states/data/prefs.dart';

import 'package:get/get.dart';

import '../models/retrive_cart_model.dart';

class CartsController extends GetxController {
  var productsRepository = Get.put(ProductRepository());
  RxBool cartItemsLoading = true.obs;
  RxBool addToCartLoading = true.obs;
  RxBool updateCartLoading = true.obs;
  RxBool addToAnotherCartLoading = true.obs;
  RxBool removeItemFromCartLoading = true.obs;

  RxBool isAddCarted = true.obs;
  RxBool isUpdatedCarted = true.obs;
  RxString cartId = ''.obs;

  RxBool createBuyNowCheckoutLoading = true.obs;
  RxString cartCheckoutId = ''.obs;


  // var productList;
  var cartItemList = <Edge>[].obs;
  var linesList = <String>[].obs;

  RetriveCartListModel? retriveCartListModel;

  //add to cart first Time
  void addToCart({
    required String merchandiseId,
    required int qnty,
  }) async {
    addToCartLoading(true);
    final result = await productsRepository.cartCreate(
      merchandiseId,
      qnty,
    );
    if (result.cartCreate.cart.lines.edges.isNotEmpty) {
      //print('add to cart success =>');
      addToCartLoading(false);
      isAddCarted(false);
      //save Cart id
      cartId(result.cartCreate.cart.id);
      Preference.setCartId(result.cartCreate.cart.id);
    } else {
      Get.snackbar("update cart", "Unsuccessfully",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  //update to cart first Time
  void updateCart({
    required String merchandiseId,
    required int qnty,
    required String id,
    required String cId,
  }) async {
    updateCartLoading(true);
    final result = await productsRepository.updateCart(
      merchandiseId,
      qnty,
        id,
        cId,
    );
    if (result.cartLinesUpdate.cart.lines.edges.isNotEmpty) {
      //print('update cart success =>');
      updateCartLoading(false);
      isUpdatedCarted(false);

      //save Cart id
      cartId(result.cartLinesUpdate.cart.id);
      Preference.setCartId(result.cartLinesUpdate.cart.id);
     // print("cart list ");
    } else {
      Get.snackbar("add to cart", "Unsuccessfully",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

/*
  //create buynow checkout
  void createBuyNowCheckout({required String pId}) async {
    createBuyNowCheckoutLoading(true);

    final result = await productsRepository.createBuyNowCheckout(pId);
    if (result.checkoutCreate.checkout.id.isNotEmpty) {
      print('crete buyNow checkout success =>');
      createBuyNowCheckoutLoading(false);
      //save Cart id
      cartCheckoutId(result.checkoutCreate.checkout.id);
      Preference.setCartCheckOutId(result.checkoutCreate.checkout.id);
      print('Save checkoutId =>');
      Preference.getCartCheckOutId();

    } else {
      Get.snackbar("BuyNow", "Unsuccessfully",
          snackPosition: SnackPosition.BOTTOM);
    }
  }*/

  //add to Another Cart/**/
  void addToAnotherCart({
    required String merchandiseId,
    required String cId,
    required int quantity,
  }) async {
    addToAnotherCartLoading(true);

    final result = await productsRepository.cartAnotherCreate(
        merchandiseId, cId, quantity);
    if (result.cartLinesAdd != null) {
      if (result.cartLinesAdd.cart != null) {
      //  print('add to cart success =>');
        addToAnotherCartLoading(false);
        //save Cart id
        cartId(result.cartLinesAdd.cart.id);
        Preference.setCartId(result.cartLinesAdd.cart.id);
      } else {
        Get.snackbar("", result.cartLinesAdd.userErrors[0].message,
            snackPosition: SnackPosition.BOTTOM);
      }
    } else {
      Get.snackbar("add to cart", "Unsuccessfully",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  //remove From Cart
  void removeFromCart({
    required String cId,
    required String linesId,
  }) async {
    removeItemFromCartLoading(true);

    final result = await productsRepository.removeFromCart(
      cId,
      linesId,
    );
    if (result.cartLinesRemove != null) {
      if (result.cartLinesRemove.cart != null) {
       // print('add to cart success =>');
        removeItemFromCartLoading(false);
      } else {
        Get.snackbar("", result.cartLinesRemove.userErrors[0].message,
            snackPosition: SnackPosition.BOTTOM);
      }
    } else {
      Get.snackbar("add to cart", "Unsuccessfully",
          snackPosition: SnackPosition.BOTTOM);
    }
  }


  //remove From Cart
  void removeAllFromCart({
    required String cId,
    required List<String> linesIds,
  }) async {
    removeItemFromCartLoading(true);

    final result = await productsRepository.removeAllFromCart(
      cId,
      linesIds,
    );
    if (result.cartLinesRemove != null) {
      if (result.cartLinesRemove.cart != null) {
       // print('add to cart success =>');
        removeItemFromCartLoading(false);
      } else {
        Get.snackbar("", result.cartLinesRemove.userErrors[0].message,
            snackPosition: SnackPosition.BOTTOM);
      }
    } else {
      Get.snackbar("add to cart", "Unsuccessfully",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  //get cart list graphQl api
  void getCartList({
    required String cId,
  }) async {
    final result = await productsRepository.retriveCartList(
      cId,
    );
    if (result.cart.id.isNotEmpty) {
      retriveCartListModel = result;
      if (result.cart.lines.edges.isNotEmpty) {
       // print('get cart list success =>');
        cartItemList.value = result.cart.lines.edges;
        for(var cartitem in result.cart.lines.edges){
          linesList.add(cartitem.node.id);
        }
        print('cart id');
        cartId(result.cart.id);
        print(cartId);

        print('LineList');
        print(linesList);
        cartItemsLoading(false);
      }else{
        Future.delayed(const Duration(seconds: 6), (){
         // print("Wait for 10 seconds");
          cartItemsLoading(false);
        });
      }
    } else {
      Get.snackbar("cart list ", "Unsuccessfully",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}