import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/helper/helper.dart';
import 'package:alhafidh/states/controller/cart.dart';
import 'package:alhafidh/states/controller/order.dart';
import 'package:alhafidh/states/controller/products.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/ui/screens/checkout/checkout.dart';
import 'package:alhafidh/ui/screens/guest_contact_info/add_guest_address.dart';
import 'package:alhafidh/ui/screens/home/cart_page/summary_item.dart';
import 'package:alhafidh/ui/screens/home/home.dart';
import 'package:alhafidh/ui/widgets/custom_btn.dart';
import 'package:alhafidh/ui/widgets/custom_field.dart';
import 'package:alhafidh/ui/widgets/custom_item.dart';
import 'package:alhafidh/ui/widgets/custom_title.dart';
import 'package:alhafidh/ui/widgets/quantity_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import '../../../../states/models/retrive_cart_model.dart';

class CartPage extends StatefulWidget {
  final String cartId;
  final VoidCallback backFn;
  final ProductsController productsCon;
  final CartsController cartsCon;

//  final OrderController ordersCon;

  const CartPage({
    Key? key,
    required this.backFn,
    required this.cartId,
    required this.productsCon,
    required this.cartsCon,
    // required this.ordersCon,
  }) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  //  final ProductsController  widget.productsCon = Get.find<ProductsController>();
  final CartsController _cartsCon = Get.find<CartsController>();
  final OrderController _ordersCon = Get.find<OrderController>();
  final TextEditingController _noteCon = TextEditingController();

  // UserModel? userModel;
  // double _subTotal = 0.0;
  String? cartId;

  //for price formatting
  final value = new NumberFormat("#,##0", "en_US");

  //for translation title
  List<String> trTitle = List.empty(growable: true);

  bool isFrist = true;
  @override
  void initState() {
    //Get.lazyPut(()=>OrderController());
    cartId = Preference.getCartId();
    //call cart list
    _cartsCon.getCartList(cId: Preference.getCartId());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Get.put(OrderController());
    //_subTotal = 0;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Preference.getCartId().isEmpty
              ? Center(
                  child: Text(
                    AppLocalizations.of(context)!.cart_empty,
                  ),
                )
              : Column(
                  children: [
                    // Title
                    CustomTitle(
                      title: AppLocalizations.of(context)!.my_cart,
                      onBackTapFn: widget.backFn,
                      isBack: true,
                    ),
                    Obx(() {
                      if (_cartsCon.cartItemsLoading.value &&
                          widget.productsCon.productTrLoading.value) {
                        return Padding(
                          padding: EdgeInsets.only(top: 200.h),
                          child: const CircularProgressIndicator(),
                        );
                      } else {
                        if (_cartsCon.cartItemList.isEmpty) {
                          return Padding(
                            padding: EdgeInsets.only(top: 200.h),
                            child: Text(
                              AppLocalizations.of(context)!.cart_empty,
                            ),
                          );
                        } else {
                          if (isFrist) {
                            widget.productsCon.trTitle.clear();
                            print('test 0');
                            printText();
                            isFrist = false;
                          }

                          print('list=' + widget.productsCon.trTitle.toString());

                          return Column(
                            children: [
                              // Cart Items
                              SizedBox(
                                height: 297.h,
                                child: ListView.builder(
                                  itemCount: _cartsCon.cartItemList.length,
                                  itemBuilder: (context, index) {
                                    return CustomItem(
                                      imgLink: widget
                                          .cartsCon
                                          .cartItemList[index]
                                          .node
                                          .merchandise
                                          .image
                                          .originalSrc,
                                      productName: Preference.getIsArabicFlag()
                                          ? widget.productsCon.productTrLoading
                                                  .value
                                              ? widget
                                                  .cartsCon
                                                  .cartItemList[index]
                                                  .node
                                                  .merchandise
                                                  .product
                                                  .title
                                              : widget
                                                  .productsCon.trTitle[index]
                                          : widget.cartsCon.cartItemList[index]
                                              .node.merchandise.product.title,
                                      // productName: widget.productsCon.trTitle[0],
                                      price: value.format(calculateRoundPrice(
                                          inputNum: double.parse(widget
                                                  .cartsCon
                                                  .cartItemList[index]
                                                  .node
                                                  .merchandise
                                                  .priceV2
                                                  .amount) *
                                              widget.productsCon.exchangeRate
                                                  .value)),
                                      deleteIconFn: () {
                                        _cartsCon.removeFromCart(
                                            cId: Preference.getCartId(),
                                            linesId: _cartsCon
                                                .cartItemList[index].node.id);
                                        Get.defaultDialog(
                                          title: AppLocalizations.of(context)!
                                              .deleting,
                                          content: Obx(
                                            () {
                                              if (_cartsCon
                                                  .removeItemFromCartLoading
                                                  .value) {
                                                return SizedBox(
                                                  height: 100.h,
                                                  child: const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  ),
                                                );
                                              } else {
                                                Future.delayed(
                                                  const Duration(seconds: 0),
                                                  () {
                                                    setState(() {
                                                      Get.offAllNamed(
                                                        HomeScreen.routeName,
                                                        arguments: [
                                                          '3',
                                                        ],
                                                      );
                                                      Get.back();
                                                      _cartsCon.getCartList(
                                                          cId: Preference
                                                              .getCartId());
                                                    });
                                                  },
                                                );
                                                return Center(
                                                  child: Text(
                                                    AppLocalizations.of(
                                                            context)!
                                                        .deleted,
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        );
                                      },
                                      pId: int.parse(widget
                                          .cartsCon
                                          .cartItemList[index]
                                          .node
                                          .merchandise
                                          .product
                                          .id
                                          .replaceAll(RegExp(r'[^0-9]'), '')),
                                      child: QuantityEdit(
                                        quantity: _cartsCon
                                            .cartItemList[index].node.quantity
                                            .round(),
                                        decreaseFn: () {
                                          if (_cartsCon.cartItemList[index].node
                                                  .quantity ==
                                              1) {
                                            return;
                                          }
                                          setState(
                                            () {
                                              //update cart
                                              _cartsCon.updateCart(
                                                  merchandiseId: widget
                                                      .cartsCon
                                                      .cartItemList[index]
                                                      .node
                                                      .merchandise
                                                      .id
                                                      .toString(),
                                                  qnty: widget
                                                      .cartsCon
                                                      .cartItemList[index]
                                                      .node
                                                      .quantity = widget
                                                          .cartsCon
                                                          .cartItemList[index]
                                                          .node
                                                          .quantity -
                                                      1,
                                                  id: widget
                                                      .cartsCon
                                                      .cartItemList[index]
                                                      .node
                                                      .id
                                                      .toString(),
                                                  cId: Preference.getCartId());

                                              Get.defaultDialog(
                                                title: AppLocalizations.of(
                                                        context)!
                                                    .updating,
                                                content: Obx(
                                                  () {
                                                    if (widget
                                                        .cartsCon
                                                        .updateCartLoading
                                                        .value) {
                                                      return const SizedBox
                                                          .shrink();
                                                    } else {
                                                      Future.delayed(
                                                        const Duration(
                                                            seconds: 0),
                                                        () {
                                                          Get.back();
                                                          _cartsCon.getCartList(
                                                              cId: Preference
                                                                  .getCartId());
                                                        },
                                                      );
                                                      return const SizedBox
                                                          .shrink();
                                                    }
                                                  },
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        increaseFn: () async {
                                          setState(
                                            () {
                                              _cartsCon.updateCart(
                                                  merchandiseId: widget
                                                      .cartsCon
                                                      .cartItemList[index]
                                                      .node
                                                      .merchandise
                                                      .id
                                                      .toString(),
                                                  qnty: widget
                                                      .cartsCon
                                                      .cartItemList[index]
                                                      .node
                                                      .quantity = widget
                                                          .cartsCon
                                                          .cartItemList[index]
                                                          .node
                                                          .quantity +
                                                      1,
                                                  id: widget
                                                      .cartsCon
                                                      .cartItemList[index]
                                                      .node
                                                      .id,
                                                  cId: Preference.getCartId());

                                              Get.defaultDialog(
                                                title: AppLocalizations.of(
                                                        context)!
                                                    .updating,
                                                content: Obx(
                                                  () {
                                                    if (widget
                                                        .cartsCon
                                                        .updateCartLoading
                                                        .value) {
                                                      return const SizedBox
                                                          .shrink();
                                                    } else {
                                                      Future.delayed(
                                                        const Duration(
                                                            seconds: 0),
                                                        () {
                                                          Get.back();
                                                          _cartsCon.getCartList(
                                                              cId: Preference
                                                                  .getCartId());
                                                        },
                                                      );
                                                      return const SizedBox
                                                          .shrink();
                                                    }
                                                  },
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),

                              addH(10.h),
                            ],
                          );
                        }
                      }
                    })
                  ],
                ),
        ),
      ),
      bottomSheet: Preference.getCartId().isEmpty
          ? SizedBox(
              height: 70.h,
              width: double.infinity,
              child: Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: const SizedBox.shrink()),
            )
          : Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SizedBox(
                  height: 300.h,
                  width: double.infinity,
                  child: Obx(() {
                    if (_cartsCon.cartItemsLoading.value) {
                      return const SizedBox.shrink();
                    } else {
                      if (_cartsCon.cartItemList.isEmpty) {
                        return const SizedBox.shrink();
                      } else {
                        return Container(
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Summary
                              SizedBox(
                                width: 388.w,
                                height: 122.h,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.summary,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily:
                                            ConstantStrings.kAppRobotoFont,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    // Sub Total
                                    SummaryItem(
                                      title: AppLocalizations.of(context)!
                                          .sub_total,
                                      price:
                                          " ${AppLocalizations.of(context)!.iqd} ${value.format(calculateRoundPrice(inputNum: double.parse(_cartsCon.retriveCartListModel!.cart.cost.totalAmount.amount) * widget.productsCon.exchangeRate.value)) }",
                                    ),

                                    //divider
                                    const Divider(),

                                    // Order Total
                                    SummaryItem(
                                      title: AppLocalizations.of(context)!
                                          .order_total,
                                      price:
                                          " ${AppLocalizations.of(context)!.iqd} ${value.format(calculateRoundPrice(inputNum: double.parse(_cartsCon.retriveCartListModel!.cart.cost.totalAmount.amount) * widget.productsCon.exchangeRate.value))}",
                                    ),
                                  ],
                                ),
                              ),
                              addH(10.h),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.add_a_note,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontFamily:
                                          ConstantStrings.kAppRobotoBold,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  addH(10.h),
                                  CustomField(
                                    textCon: _noteCon,
                                    hintText: '',
                                    inputType: TextInputType.emailAddress,
                                    txtSize: 13.sp,
                                    height: 70.h,
                                  ),
                                ],
                              ),
                              // Continue Shopping & Checkout Button
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomBtn(
                                    onPressedFn: () {
                                      Get.offAllNamed(
                                        HomeScreen.routeName,
                                        arguments: [
                                          '0',
                                        ],
                                      );
                                    },
                                    btnTxt: AppLocalizations.of(context)!
                                        .continue_shopping,
                                    btnSize: Size(170.w, 45.h),
                                    txtColor: Colors.black,
                                    btnColor: Colors.white,
                                    txtSize: 15.sp,
                                    txtWeight: FontWeight.w400,
                                  ),
                                  CustomBtn(
                                    onPressedFn: () {
                                      print('cart list print=>');
                                      print(_cartsCon.cartItemList.length.toString());

                                      _ordersCon.createCartCheckout(
                                        edge: _cartsCon.cartItemList.value,
                                      );
                                      _ordersCon.addCartNote(
                                        note: _noteCon.text,
                                      );
                                      //set note pref
                                      Preference.setCartNote(_noteCon.text);

                                      if (Preference.getLoggedInFlag()) {
                                        Get.toNamed(CheckoutScreen.routeName);
                                      } else {
                                        Get.toNamed(
                                            AddGuestAddressScreen.routeName);
                                      }

                                      /*
                                              Get.defaultDialog(
                                                title: 'Add to checkout...',
                                                content: Obx(
                                                  () {
                                                    if ( widget.ordersCon
                                                        .createCartCheckoutLoading
                                                        .value) {
                                                      return SizedBox(
                                                        height: 100.h,
                                                        child: const Center(
                                                          child:
                                                              CircularProgressIndicator(),
                                                        ),
                                                      );
                                                    } else {
                                                      Future.delayed(
                                                        const Duration(seconds: 1),
                                                        () {
                                                          Get.back();
                                                          if (Preference
                                                              .getLoggedInFlag()) {
                                                            Get.toNamed(CheckoutScreen
                                                                .routeName);
                                                          } else {
                                                            Get.toNamed(
                                                                ContactInfoScreen
                                                                    .routeName);
                                                          }
                                                        },
                                                      );
                                                      return const Center(
                                                        child:
                                                            Text('Added checkout ..'),
                                                      );
                                                    }
                                                  },
                                                ),
                                              );
*/
                                    },
                                    btnTxt:
                                        AppLocalizations.of(context)!.checkout,
                                    btnSize: Size(170.w, 45.h),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }
                    }
                  }),
                ),
              ),
            ),
    );
  }

  void printText() async {
    print('test 001');
    await widget.productsCon.getTranProductAr(_cartsCon.cartItemList.value);
  }
}