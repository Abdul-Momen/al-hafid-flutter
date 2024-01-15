import 'dart:convert';

import 'package:alhafidh/states/Repository/order_repository.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/states/models/create_cart_checkout.dart';
import 'package:alhafidh/states/models/get_shipping_rate.dart';
import 'package:alhafidh/states/models/my_orders_model.dart';
import 'package:alhafidh/states/models/order_model.dart';
import 'package:alhafidh/states/models/set_shipping_rate.dart';
import 'package:alhafidh/states/models/transaction_model.dart';
import 'package:alhafidh/states/services/order.dart';
import 'package:alhafidh/ui/screens/checkout/checkout.dart';
import 'package:get/get.dart';
import '../models/retrive_cart_model.dart';

class OrderController extends GetxController {
  var ordersRepository = Get.put(OrderRepository());
  RxBool orderLoading = true.obs;
  RxBool currentOrderLoading = true.obs;
  RxBool previousOrderLoading = true.obs;
  RxBool frequentOrderLoading = true.obs;

  RxBool associateCustomerLoading = true.obs;
  RxBool setShippingAddressLoading = true.obs;
  RxBool addCartNoteLoading = true.obs;
  RxBool applyDiscountLoading = true.obs;
  RxBool removeDiscountLoading = true.obs;

  RxBool setGuestShipAddressLoading = true.obs;
  RxBool addedGuestLoading = true.obs;

  RxBool getShippingRateLoading = true.obs;
  RxBool setShippingRateLoading = true.obs;
  RxBool myOrdersLoading = true.obs;
  RxBool myCompleteOrdersLoading = true.obs;

  RxBool createCartCheckoutLoading = true.obs;
  RxBool isAddCartCheckout = true.obs;
  RxString cartCheckoutId = ''.obs;
  RxString discountCode = ''.obs;

  RxBool isOrdering = true.obs;
  RxBool isOrdered = false.obs;
  RxBool myOrdersIsEmpty = false.obs;

  RxBool isDiscount = true.obs;
  RxBool isDiscounted = false.obs;
  String ordMgs = "Something went wrong!";
  String orderId = '';
  RxDouble discountPrice = 0.0.obs;

  // var rateList;
  var shippingRateList = <ShippingRate>[].obs;

  var myAllOrdersList = <Order>[].obs;
  var fulfilOrders = <Order>[].obs;
  var cancelOrders = <Order>[].obs;
  var pendingOrders = <Order>[].obs;
  var processingOrders = <Order>[].obs;
  var paidOrder = <Order>[].obs;
  var pendingOrder = <Order>[].obs;

  CreateCheckoutCartResponse? checkoutResponse;

  SetShippingRateResponse? setShippingRateObj;
  GetShippingRateResponse? getShippingRateObj;

  //get related product list
  void getMyOrders({
    required String cEmail,
  }) async {
    myOrdersLoading(true);

    try {
      var response = await OrderService.getMyOrders(userEmail: cEmail);
      MyOrdersModel r = MyOrdersModel.fromJson(response);

      myAllOrdersList.value = r.orders;

      if(myAllOrdersList.isEmpty){
        myOrdersIsEmpty.value=true;
        print('true');
      }else{
        myOrdersIsEmpty.value=false;
        print('false');
      }
      pendingOrders.value = myAllOrdersList
          .where((o) =>
              o.financialStatus == 'pending' && o.fulfillmentStatus == null)
          .toList();

      processingOrders.value = myAllOrdersList
          .where(
              (o) => o.financialStatus == 'paid' && o.fulfillmentStatus == null)
          .toList();

      pendingOrder.value = myAllOrdersList
          .where((o) =>
              o.financialStatus == 'pending' &&
              o.fulfillmentStatus == 'fulfilled')
          .toList();
      processingOrders.addAll(pendingOrder);

      cancelOrders.value =
          myAllOrdersList.where((o) => o.financialStatus == 'voided').toList();

      fulfilOrders.value = myAllOrdersList
          .where((o) =>
              o.financialStatus == 'paid' && o.fulfillmentStatus == 'fulfilled')
          .toList();

      print('all total list ${myAllOrdersList.length}');
      print('all fulfill list ${fulfilOrders.length}');
      print('all cancel list ${cancelOrders.length}');
      print('all pending list ${pendingOrders.length}');
      print('all processing list ${processingOrders.length}');

      //print('My Orders list=>');
      //print(response.toString());
      // print('My Complete Orders list=>');
      //  print(myOrderCompletedList.value.toString());
      myOrdersLoading(false);
    } finally {
      myOrdersLoading(false);
    }
  }

  //for create Order
  Future<bool> order({
    // required List<Edge> cartList,
    required List cartList,
    required Transactions transitions,
    required String financialStatus,
    required double discountPrice,
    required String discountCode,
    required bool isDiscount,
    required dynamic shippingAddress,
  }) async {
    // Methods.showLoading();
    isOrdering(true);
    try {
      var response = await OrderService.order(
        cartList: cartList,
        transacton: transitions,
        financialStatus: financialStatus,
        address: shippingAddress,
        discountPrice: discountPrice,
        discountCode: discountCode,
        isDiscount: isDiscount,
      );

      //   print(jsonEncode(response).toString());
      String s = jsonEncode(response).toString();

      //cheek json success response if customer
      bool isSuccessed = s.toLowerCase().contains("order".toLowerCase());

      if (isSuccessed) {
        orderId = jsonEncode(response['order']['order_number']);

        //print("Order id => $orderId");

        isOrdered(true);
        ordMgs = 'Order Successfully';
        orderLoading(false);

        return true;
      } else {
        ordMgs = 'Something went wrong!';
        return false;
      }
    } finally {
      isOrdering(false);
      orderLoading(false);
      //Methods.hideLoading();
    }
  }

  //create cart checkout
  void createCartCheckout({required List<dynamic> edge}) async {
    createCartCheckoutLoading(true);
    print('check lenth');
    print(edge.length.toString());
    final result = await ordersRepository.createCartCheckoutProduct(edge);
    if (result.checkoutCreate.checkout.id.isNotEmpty) {
      //print('add to cart checkout success =>');
      createCartCheckoutLoading(false);
      isAddCartCheckout(false);
      //save Cart id
      cartCheckoutId(result.checkoutCreate.checkout.id);
      checkoutResponse = result;
      Preference.setCartCheckOutId(result.checkoutCreate.checkout.id);

      //  print('save checkoutId =>');
      Preference.getCartCheckOutId();
    } else {
      Get.snackbar("add to cart", "Unsuccessfully",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  //create cart checkout
  void associateCustomerCheckout(
      {required String checkoutId, required String customerTkn}) async {
    associateCustomerLoading(true);
    final result = await ordersRepository.associateCustomerCheckout(
        checkoutId, customerTkn);
    if (result.checkoutCustomerAssociateV2.checkout.id.isNotEmpty) {
      //print('associateCustomer success =>');
      associateCustomerLoading(false);
    } else {
      Get.snackbar("associateCustomer", "Unsuccessfully",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // setShippingAddress
  void setShippingAddress({
    required String email,
    required String lastName,
    required String firstName,
    required String address1,
    required String province,
    required String country,
    required String zip,
    required String city,
    required String checkoutId,
  }) async {
    setShippingAddressLoading(true);
    final result = await ordersRepository.setShippingAddress(
      email: email,
      lastName: lastName,
      firstName: firstName,
      address1: address1,
      province: province,
      country: country,
      zip: zip,
      city: city,
      checkoutId: checkoutId,
    );
    if (result.checkoutShippingAddressUpdateV2.checkout.id.isNotEmpty) {
      // print('setShippingAddress success =>');
      //print(result.checkoutShippingAddressUpdateV2.checkout.toString());
      if (result.checkoutShippingAddressUpdateV2.checkoutUserErrors.isEmpty) {
        setShippingAddressLoading(false);
      } else {
        //check error massage or code
        Get.snackbar(
            result.checkoutShippingAddressUpdateV2.checkoutUserErrors[0].code,
            result
                .checkoutShippingAddressUpdateV2.checkoutUserErrors[0].message,
            snackPosition: SnackPosition.TOP);
      }
    } else {
      Get.snackbar(" setShippingAddress", "Unsuccessfully",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // add note
  void addCartNote({required String note}) async {
    addCartNoteLoading(true);
    final result = await ordersRepository.addCartNote(note: note);
    if (result.cartNoteUpdate.cart.id.isNotEmpty) {
      //print('addNoteCart success =>');
      addCartNoteLoading(false);
    } else {
      Get.snackbar(" addNoteCart", "Unsuccessfully",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // apply discount code
  void applyDiscountCode(
      {required String code, required String checkoutId}) async {
    applyDiscountLoading(true);
    isDiscount.value = true;
    final result = await ordersRepository.applyDiscountCode(
        checkoutId: checkoutId, code: code);
    discountCode.value=code;

    if (result.checkoutDiscountCodeApplyV2.checkout.id.isNotEmpty) {
      print('apply discount success =>');

      discountPrice.value = double.parse(
          result.checkoutDiscountCodeApplyV2.checkout.totalPrice.amount);

      isDiscount.value = false;
      applyDiscountLoading(false);
      isDiscounted.value = true;
    } else {
      Get.snackbar(" addNoteCart", "Unsuccessfully",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // remove discount code
  void removeDiscountCode({required String checkoutId}) async {
    removeDiscountLoading(true);

    final result =
        await ordersRepository.removeDiscountCode(checkoutId: checkoutId);

    if (result.checkoutDiscountCodeRemove.checkout.id.isNotEmpty) {
      // print('remove discount success =>');

      discountPrice.value = double.parse(
          result.checkoutDiscountCodeRemove.checkout.totalPrice.amount);

      isDiscount.value = true;
      removeDiscountLoading(false);
      isDiscounted.value = false;
    } else {
      Get.snackbar(" addNoteCart", "Unsuccessfully",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

// set Guest ShippingAddress
  void setGuestShippingAddress({
    required String email,
    required String lastName,
    required String firstName,
    required String address1,
    required String province,
    required String country,
    required String zip,
    required String city,
    required String checkoutId,
    required String phone,
  }) async {
    setGuestShipAddressLoading(true);
    final result = await ordersRepository.guestShippingAddress(
      email: email,
      lastName: lastName,
      firstName: firstName,
      address1: address1,
      province: province,
      country: country,
      zip: zip,
      city: city,
      checkoutId: checkoutId,
    );
    if (result.checkoutShippingAddressUpdateV2 != null) {
      if (result
          .checkoutShippingAddressUpdateV2.checkoutUserErrors.isNotEmpty) {
        Get.snackbar(
            result.checkoutShippingAddressUpdateV2.checkoutUserErrors[0].code,
            result
                .checkoutShippingAddressUpdateV2.checkoutUserErrors[0].message,
            snackPosition: SnackPosition.BOTTOM);
        return;
      } else {
        //print('set Guest ShippingAddress success =>');

        Preference.setGuestEmail(email);
        Preference.setGuestFName(firstName);
        Preference.setGuestLName(lastName);
        Preference.setGuestAddress(address1);
        Preference.setGuestCity(city);
        Preference.setGuestPhone(phone);

        //go to checkout page
        bool b = true;
        Get.toNamed(CheckoutScreen.routeName, arguments: [b]);
        setGuestShipAddressLoading(false);
      }
    } else {
      Get.snackbar("AddGuestShippingAddress", "Unsuccessfully",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  //getShippingRate
  void getShippingRate({required var edge}) async {
    getShippingRateLoading(true);
    final result = await ordersRepository.getShippingRate(edge);
    if (result.node.availableShippingRates.shippingRates.isNotEmpty) {
      //print('getShippingRate success =>');
      shippingRateList.value = result.node.availableShippingRates.shippingRates;
      getShippingRateObj = result;
      // print('getShippingRate 2 success =>');
      // print(jsonEncode(result.node.availableShippingRates.shippingRates)
      //   .toString());
      getShippingRateLoading(false);
    } else {
      Get.snackbar("getShippingRate", "Unsuccessfully",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  //setShippingRate
  void setShippingRate({ShippingRate? rate}) async {
    setShippingRateLoading(true);
    final result = await ordersRepository.setShippingRate(handle: rate!.handle);
    if (result.checkoutShippingLineUpdate.checkout.id.isNotEmpty) {
      // print('Set ShippingRate success =>');
      setShippingRateObj = result;
      setShippingRateLoading(false);
    } else {
      Get.snackbar("setShippingRate", "Unsuccessfully",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

/* OrderModel? orderModel;
  var currentOrderList = <OrderResponseModel>[].obs;
  var previousOrderList = <OrderResponseModel>[].obs;
  var frequentOrderList = <OrderResponseModel>[].obs;

  // Current Order List
  void getOrders({
    required RxBool loadingFlag,
    required RxList<OrderResponseModel> orderList,
    required String orderApi,
    required int userID,
  }) async {
    loadingFlag(true);
    try {
      var response = await OrderService.getOrders(
        api: orderApi,
        userId: userID,
      );
      orderList.value = orderModelListFromJson(jsonEncode(response));
    } finally {
      loadingFlag(false);
    }
  }

  // place order
  void placeOrder({required dynamic payload}) async {
    orderLoading(true);
    try {
      var response = await OrderService.placeOrder(payload);
      orderModel = orderModelFromJson(jsonEncode(response["order"]));
    } finally {
      orderLoading(false);
    }
  }*/
}
