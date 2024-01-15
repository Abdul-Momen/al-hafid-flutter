import 'package:alhafidh/states/controller/cart.dart';
import 'package:alhafidh/states/models/wishlist_model.dart';
import 'package:alhafidh/ui/widgets/custom_app_bar.dart';
import 'package:alhafidh/ui/widgets/custom_btn.dart';
import 'package:alhafidh/ui/widgets/custom_item.dart';
import 'package:alhafidh/ui/widgets/custom_title.dart';
import 'package:alhafidh/ui/widgets/quantity_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../main.dart';

class Wishlist extends StatefulWidget {
  static String routeName = '/wishlist';

  const Wishlist({Key? key}) : super(key: key);

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final CartsController _cartsCon = Get.find<CartsController>();

  late Stream<List<WishlistModel>> streamWishlist;
  int quantity = 1;

  @override
  void initState() {
    streamWishlist = objectBox.getWishlists();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0.w),
          child: Column(
            children: [
              // Title
              CustomTitle(
                title: AppLocalizations.of(context)!.wishlist,
              ),
              // Cart Items
              SizedBox(
                height: 580.h,
                child: StreamBuilder<List<WishlistModel>>(
                  stream: streamWishlist,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      final wishlists = snapshot.data!;
                      return ListView.builder(
                        itemCount: wishlists.length,
                        itemBuilder: (context, index) {
                          final wishlist = wishlists[index];
                          return CustomItem(
                            imgLink: wishlist.image,
                            productName: wishlist.title,
                            price: wishlist.price,
                            deleteIconFn: () {
                              objectBox.deleteWishlist(wishlist.id);
                            },
                            pId: wishlist.id,
                            child: Row(
                              children: [
                                QuantityEdit(
                                  quantity: wishlist.quantity,
                                  decreaseFn: () {
                                    if (wishlist.quantity == 1) {
                                      return;
                                    }
                                    setState(
                                      () => wishlist.quantity--,
                                    );
                                    /*_productsCon.removeFromCart(
                                      _getNewCartItem(
                                        _productsCon.cartItemList[index],
                                      ),
                                    );*/
                                  },
                                  increaseFn: () async {
                                    // CartItemModel cItem =
                                    //     _productsCon.cartItemList[index];
                                    // cItem.quantity = 1;
                                    // bool isAdded = await _productsCon.addToCart(
                                    //   cItem,
                                    // );
                                    // if (isAdded) {

                                    setState(
                                      () {
                                        wishlist.quantity++;
                                      },
                                    );
                                    /*_productsCon.addToCart(
                                      _getNewCartItem(
                                        _productsCon.cartItemList[index],
                                      ),
                                    );
                                    }*/
                                  },
                                ),
                                //add to cart btn
                                Center(
                                  child: CustomBtn(
                                    onPressedFn: () {
                                      if (_cartsCon.isAddCarted.value) {
                                        _cartsCon.addToCart(
                                          merchandiseId:
                                              wishlist.adminGraphQlapiId,
                                          qnty: wishlist.quantity,
                                        );
                                      } else {
                                        _cartsCon.addToAnotherCart(
                                          merchandiseId:
                                              wishlist.adminGraphQlapiId,
                                          cId: _cartsCon.cartId.value,
                                          quantity: wishlist.quantity,
                                        );
                                      }
                                      Get.defaultDialog(
                                        title: AppLocalizations.of(context)!
                                            .adding,
                                        content: Obx(
                                          () {
                                            if (_cartsCon
                                                .addToCartLoading.value) {
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
                                                  //delete item when added cart
                                                  objectBox.deleteWishlist(
                                                      wishlist.id);
                                                  Get.back();
                                                  setState(() {

                                                  });
                                                },
                                              );
                                              return Center(
                                                child: Text(AppLocalizations.of(
                                                        context)!
                                                    .added_success),
                                              );
                                            }
                                          },
                                        ),
                                      );
                                    },
                                    btnTxt: AppLocalizations.of(context)!
                                        .add_to_Cart,
                                    txtSize: 10.sp,
                                    btnSize: Size(90.w, 20.h),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
