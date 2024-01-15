import 'package:alhafidh/constants/color.dart';
import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/helper/helper.dart';
import 'package:alhafidh/states/controller/cart.dart';
import 'package:alhafidh/states/controller/products.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/ui/screens/home/home.dart';
import 'package:alhafidh/ui/screens/products/filter_dialog.dart';
import 'package:alhafidh/ui/screens/products/sortby_dialog.dart';
import 'package:alhafidh/ui/widgets/custom_app_bar.dart';
import 'package:alhafidh/ui/widgets/custom_btn.dart';
import 'package:alhafidh/ui/widgets/custom_title.dart';
import 'package:alhafidh/ui/widgets/product_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pagination/flutter_pagination.dart';
import 'package:flutter_pagination/widgets/button_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:number_pagination/number_pagination.dart';

class ProductsScreen extends StatefulWidget {
  static String routeName = '/products';

  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final ProductsController _productsCon = Get.find<ProductsController>();
  final CartsController _cartsCon = Get.find<CartsController>();
  int collectionId = 0;
  String screenTitle = 'Products';

  int selectedPageNumber = 1;
  int totalPage = 10;


  @override
  void initState() {
    if (Get.arguments != null) {
      String aStr = Get.arguments[0];
      String aStr2 = Get.arguments[1];
      collectionId = int.parse(aStr);
      screenTitle = aStr2;
      print('Category ID => : $collectionId');
    }

    //screenTitle = Get.arguments[1];
    _productsCon.getFilterAllProducts(collectionId: collectionId,sortBy: '');
    // _productsCon.getFilterAllOptionData(collectionId: collectionId);


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _pullRefresh,
          child: Column(
            children: [
              CustomTitle(
                title: Preference.getIsArabicFlag()
                    ? ConstantStrings.menuItemList[0][screenTitle] ??
                        screenTitle
                    : screenTitle,
              ),
              // Sort by & Filter
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //for sort by
                  CustomBtn(
                    onPressedFn: () => showDialog(
                      SortByDialog(
                        productsCon: _productsCon,
                        collectionId: collectionId,
                      ),
                    ),
                    btnTxt: AppLocalizations.of(context)!.sort_by,
                    txtSize: 15.sp,
                    txtWeight: FontWeight.w600,
                    btnColor: Colors.white,
                    txtColor: Colors.black,
                    btnSize: Size(155.w, 45.h),
                    btnIcon: 'assets/svg/sort.svg',
                  ),
                  CustomBtn(
                    onPressedFn: () => showDialog(
                      FilterDialog(
                        productsCon: _productsCon,
                        collectionId: collectionId,
                      ),
                    ),
                    btnTxt: AppLocalizations.of(context)!.filter,
                    txtSize: 15.sp,
                    txtWeight: FontWeight.w600,
                    btnColor: Colors.white,
                    txtColor: Colors.black,
                    btnSize: Size(155.w, 45.h),
                    btnIcon: 'assets/svg/filter.svg',
                  ),
                ],
              ),
              addH(15.h),
              // Products
              Container(
                width: double.infinity,
                height: 590.h,
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Obx(() {
                  if (_productsCon.filterProductsLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (_productsCon
                        .filterProductResponseModel!.products.isEmpty) {
                      return Center(
                        child: Text(
                          AppLocalizations.of(context)!.no_Data_Found,
                        ),
                      );
                    } else {
                      var v = _productsCon
                              .filterProductResponseModel!.totalProduct /
                          10.round();
                      totalPage = v.round();

                      return Column(
                        children: [
                          SizedBox(
                            height: 550.h,
                            child: GridView.builder(
                              itemCount: _productsCon
                                  .filterProductResponseModel!.products.length,
                              // padding: EdgeInsets.symmetric(horizontal: 20.w),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 15.w,
                                mainAxisSpacing: 5.h,
                                mainAxisExtent: 258.h,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return ProductCard(
                                  pModel: _productsCon
                                      .filterProductResponseModel!
                                      .products[index],
                                  cardWidth: 170.w,
                                  cardHeight: 275.h,
                                  imgHeight: 90.h,
                                  imgWidth: 90.w,
                                  addCartBtnWidth: 80.w,
                                  addCartBtnHeight: 25.h,
                                  buyBtnWidth: 60.w,
                                  buyBtnHeight: 25.h,
                                  offHeight: 30.h,
                                  offWidth: 30.w,
                                  exchangeRate: _productsCon.exchangeRate.value,
                                  onTapBuyNowFn: () {
                                    if (_cartsCon.isAddCarted.value) {
                                      _cartsCon.addToCart(
                                        merchandiseId:
                                            "gid://shopify/ProductVariant/${_productsCon.filterProductResponseModel!.products[index].variants[0].id}",
                                        qnty: 1,
                                      );
                                    } else {
                                      _cartsCon.addToAnotherCart(
                                        merchandiseId:
                                            "gid://shopify/ProductVariant/${_productsCon.filterProductResponseModel!.products[index].variants[0].id}",
                                        cId: _cartsCon.cartId.value,
                                        quantity: 1,
                                      );
                                    }
                                    Get.defaultDialog(
                                      title:
                                          AppLocalizations.of(context)!.adding,
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
                                              const Duration(seconds: 0),
                                              () {
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
                                  onTapAddToCartFn: () {
                                    if (_cartsCon.isAddCarted.value) {
                                      _cartsCon.addToCart(
                                        merchandiseId:
                                            "gid://shopify/ProductVariant/${_productsCon.filterProductResponseModel!.products[index].variants[0].id}",
                                        qnty: 1,
                                      );
                                    } else {
                                      _cartsCon.addToAnotherCart(
                                        merchandiseId:
                                            "gid://shopify/ProductVariant/${_productsCon.filterProductResponseModel!.products[index].variants[0].id}",
                                        cId: _cartsCon.cartId.value,
                                        quantity: 1,
                                      );
                                    }
                                    Get.defaultDialog(
                                      title:
                                          AppLocalizations.of(context)!.adding,
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
                                );
                              },
                            ),
                          ),
                          addH(10.h),
                        ],
                      );
                    }
                  }
                }),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Pagination(
              paginateButtonStyles: PaginateButtonStyles(
                  backgroundColor: ConstantColors.lightRed),
              prevButtonStyles: PaginateSkipButton(
                  buttonBackgroundColor: ConstantColors.lightRed,
                  borderRadius:Preference.getIsArabicFlag()? BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)):BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
              nextButtonStyles: PaginateSkipButton(
                  buttonBackgroundColor: ConstantColors.lightRed,
                  borderRadius: Preference.getIsArabicFlag()? BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)):BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              onPageChange: (number) {
                setState(() {
                  _productsCon.filterProductResponseModel!.products.clear();
                  selectedPageNumber = number;
                  _productsCon.getFilterAllProducts(
                      collectionId: collectionId, pageNum: selectedPageNumber);
                });
              },
              useGroup: false,
              totalPage: _productsCon.totalPage,
              show: 1,
              currentPage: selectedPageNumber,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pullRefresh() async {
    setState(() {
      _productsCon.getFilterAllProducts(collectionId: collectionId);
    });
  }

  void showDialog(Widget showDialog) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black.withOpacity(0.8),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, anim1, anim2) {
        return showDialog;
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 1),
            end: const Offset(0, 0),
          ).animate(anim1),
          child: child,
        );
      },
    );
  }
}