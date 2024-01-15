import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/helper/helper.dart';
import 'package:alhafidh/states/controller/cart.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/states/models/filter_response_model.dart';
import 'package:alhafidh/ui/screens/home/home.dart';
import 'package:alhafidh/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/color.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HorizontalList extends StatelessWidget {
  final RxBool loadingFlag;
  final List<Product> productList;
  final String title;
  final VoidCallback viewAllTxtFn;
  final VoidCallback onTapBuyNowFn;
  final CartsController cartsCon;

  //final VoidCallback onTapAddToCartFn;
  final double exchangeRate;

  const HorizontalList({
    Key? key,
    required this.loadingFlag,
    required this.productList,
    required this.title,
    required this.viewAllTxtFn,
    required this.onTapBuyNowFn,
    // required this.onTapAddToCartFn,
    required this.exchangeRate,
    required this.cartsCon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final CartsController cartsCon = Get.find<CartsController>();

    int selectedPromoImageIndex = 0;

    late List<String> promoImg = Preference.getPromoImages();
    late List<String> code = Preference.getPromoCode();

    return SizedBox(
      width: double.infinity,
      height: 270.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Container(
            height: 27.h,
            padding: EdgeInsets.only(right: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: ConstantStrings.kAppRobotoFont,
                    color: Colors.black,
                  ),
                ),
                InkWell(
                  onTap: viewAllTxtFn,
                  child: Text(
                    AppLocalizations.of(context)!.view_more,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: ConstantStrings.kAppRobotoFont,
                      color: ConstantColors.lightRed,
                    ),
                  ),
                ),
              ],
            ),
          ),
          addH(5.h),
          // // Products
          SizedBox(
            width: double.infinity,
            height: 235.h,
            child: Obx(() {
              if (loadingFlag.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (productList.isEmpty) {
                  return Center(
                    child: Text(
                      AppLocalizations.of(context)!.no_Data_Found,
                    ),
                  );
                } else {

                  return ListView.builder(
                    itemCount: productList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: ProductCard(
                          cardWidth: 143.w,
                          //cardHeight: 265.h,
                          imgHeight: 90.h,
                          imgWidth: 90.w,
                          onTapBuyNowFn: () {
                            // print('Tab Add to Cart');
                            if (cartsCon.isAddCarted.value) {
                              // print('Tab Add to Cart 1 ');
                              cartsCon.addToCart(
                                merchandiseId:
                                    "gid://shopify/ProductVariant/${productList[index].variants[0].id}",
                                qnty: 1,
                              );
                              // print('Product id => gid://shopify/ProductVariant/${productList[index].variants[0].id}');
                            } else {
                              // print('Tab Add to Cart 2 ');
                              cartsCon.addToAnotherCart(
                                merchandiseId:
                                    "gid://shopify/ProductVariant/${productList[index].variants[0].id}",
                                cId: cartsCon.cartId.value,
                                quantity: 1,
                              );
                            }

                            Get.defaultDialog(
                              title: AppLocalizations.of(context)!.adding,
                              content: Obx(
                                () {
                                  if (cartsCon.addToCartLoading.value) {
                                    return SizedBox(
                                      height: 100.h,
                                      child: const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  } else {
                                    Future.delayed(
                                      const Duration(seconds: 0),
                                      () {
                                        cartsCon.getCartList(
                                            cId: Preference.getCartId());
                                        Get.back();
                                        Get.offAllNamed(
                                          HomeScreen.routeName,
                                          arguments: [
                                            '3',
                                          ],
                                        );
                                        /* _subTotal = 0;
                                        _productsCon.getCartItems(
                                          userModel!.customerId,
                                        );*/
                                      },
                                    );
                                    return Center(
                                      child: Text(
                                        AppLocalizations.of(context)!
                                            .added_success,
                                      ),
                                    );
                                  }
                                },
                              ),
                            );
                          },
                          pModel: productList[index],
                          onTapAddToCartFn: () {
                            // print('Tab Add to Cart');
                            if (cartsCon.isAddCarted.value) {
                              // print('Tab Add to Cart 1 ');
                              cartsCon.addToCart(
                                merchandiseId:
                                    "gid://shopify/ProductVariant/${productList[index].variants[0].id}",
                                qnty: 1,
                              );
                              // print('Product id => gid://shopify/ProductVariant/${productList[index].variants[0].id}');
                            } else {
                              // print('Tab Add to Cart 2 ');
                              cartsCon.addToAnotherCart(
                                merchandiseId:
                                    "gid://shopify/ProductVariant/${productList[index].variants[0].id}",
                                cId: cartsCon.cartId.value,
                                quantity: 1,
                              );
                            }

                            //dialog...
                            Get.defaultDialog(
                              title: AppLocalizations.of(context)!.adding,
                              content: Obx(
                                () {
                                  if (cartsCon.addToCartLoading.value) {
                                    return SizedBox(
                                      height: 100.h,
                                      child: const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  } else {
                                    Future.delayed(
                                      const Duration(seconds: 1),
                                      () {
                                        cartsCon.getCartList(
                                            cId: Preference.getCartId());
                                        Get.back();
                                        /* _subTotal = 0;
                                        _productsCon.getCartItems(
                                          userModel!.customerId,
                                        );*/
                                      },
                                    );
                                    return Center(
                                      child: Text(
                                        AppLocalizations.of(context)!
                                            .added_success,
                                      ),
                                    );
                                  }
                                },
                              ),
                            );
                          },
                          exchangeRate: exchangeRate,
                        ),
                      );
                    },
                  );
                }
              }
            }),
          ),
        ],
      ),
    );
  }
}
