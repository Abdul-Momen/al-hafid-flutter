
import 'package:alhafidh/states/controller/address.dart';
import 'package:alhafidh/states/controller/auth.dart';
import 'package:alhafidh/states/controller/cart.dart';
import 'package:alhafidh/states/controller/home.dart';
import 'package:alhafidh/states/controller/order.dart';
import 'package:alhafidh/states/controller/products.dart';
import 'package:alhafidh/states/controller/section.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
     Get.lazyPut(() => HomeController());
    // Get.lazyPut(() => MyWalletController());
     Get.lazyPut(() => ProductsController());

  }
}

class HomeBinding implements Bindings {
  @override
  void dependencies() {
     Get.lazyPut(() => HomeController());
     Get.lazyPut(() => OrderController());


  }
}
class AuthBinding implements Bindings {
  @override
  void dependencies() {
     Get.lazyPut(() => AuthController());
  }
}

class ProductsBinding implements Bindings {
  @override
  void dependencies() {
     Get.lazyPut(() => ProductsController());
  }
}

class AddressBinding implements Bindings {
  @override
  void dependencies() {
     Get.lazyPut(() => AddressController());
  }
}

class OrderBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderController());
    Get.lazyPut(() => CartsController());

  }
}
class ResetBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }
}

class CartBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartsController());
    Get.lazyPut(() => OrderController());
  }
}

class SectionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SectionController());
  }
}