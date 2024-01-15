import 'package:alhafidh/constants/color.dart';
import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/states/controller/home.dart';
import 'package:alhafidh/states/controller/products.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/states/models/customer_model.dart';
import 'package:alhafidh/ui/screens/home/custom_banner_slider.dart';
import 'package:alhafidh/ui/screens/home/home.dart';
import 'package:alhafidh/ui/screens/home/home_page/bottomsheet_for_rewards.dart';
import 'package:alhafidh/ui/screens/home/home_page/bottomsheet_way_to_earn.dart';
import 'package:alhafidh/ui/screens/home/home_page/bottomsheet_way_to_redeem.dart';
import 'package:alhafidh/ui/screens/home/home_page/category_item.dart';
import 'package:alhafidh/ui/screens/home/home_page/loyalty_points.dart';
import 'package:alhafidh/ui/screens/products/products.dart';
import 'package:alhafidh/ui/screens/search_screen/search.dart';
import 'package:alhafidh/ui/screens/search_screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:alhafidh/states/controller/cart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../helper/helper.dart';
import '../../../widgets/custom_btn.dart';
import '../../../widgets/horizontal_list.dart';
import '../../../widgets/product_card.dart';

class HomePage extends StatefulWidget {
  final HomeController homeCon;
  final ProductsController productCon;
  final CartsController cartsCon;

  const HomePage({
    Key? key,
    required this.homeCon,
    required this.productCon,
    required this.cartsCon,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final HomeController widget.homeCon = Get.find();
  // final ProductsController widget.productCon = Get.find<ProductsController>();
  // final CartsController widget.cartsCon = Get.find<CartsController>();
  late TextEditingController searchCon = TextEditingController();

  int _selectedBrandIndex = 0;
  int currentTab = 0;

  List<String> catImages = [
    'assets/images/tv.png',
    'assets/images/refrigerator.png',
    'assets/images/washing_machine.png',
    'assets/images/air_conditioner.png',
    'assets/images/smartphones.png',
    'assets/images/personal_care.png',
  ];
  List<int> catId = [
    190741413947,
    168861532219,
    190830870587,
    190827757627,
    191125585979,
    190820483131,
  ];
  List<int> brandCId = [
    190864523323,
    190864654395,
    190864588859,
    276223918139,
    274544885819,
  ];

  bool isLoading = false;
  String searchValue = '';

  CustomerModel? uModel;

  @override
  void initState() {
    //get exchange rate
    widget.productCon.getExchangeRate();
    //get preference to user details
    if (Preference.getLoggedInFlag()) {
      uModel = Preference.getUserDetails();
    }
    if (widget.homeCon.productList.isEmpty) {
      widget.homeCon.getProducts();
    }
    if (widget.homeCon.topBannerImageList.isEmpty) {
      widget.homeCon.getTopBannerImage();
    }

    if (widget.homeCon.secondBannerImageList.isEmpty) {
      widget.homeCon.get2ndBannerImage();
    }

    if (widget.homeCon.brandProductsList.isEmpty) {
      //get Band Product
      widget.homeCon.getBrandProducts(190864523323);
    }

    if (widget.homeCon.specialProductsList.isEmpty) {
      //get special products
      widget.homeCon.getSpecialProducts(195594190907);
    }

    if (widget.homeCon.newArrivalProductsList.isEmpty) {
      //get new arrival
      widget.homeCon.getNewArrivalProducts(279780884539);
    }

    if (widget.homeCon.bestSellerProductsList.isEmpty) {
      //get best seller
      widget.homeCon.getBestSellerProducts(194856681531,true);
    }

    if (widget.homeCon.allProductsList.isEmpty) {
      //get all product
      widget.homeCon.getAllProducts(264319205435,true);
    }
    widget.homeCon.getAllProducts(264319205435,true);

    if (Preference.getLoggedInFlag()) {
      //get rewinds rules
      widget.homeCon.getRewardsRules();

      //get rewinds points
      widget.homeCon.getRewardsUserPoints(customerEmail: Preference.getLoginEmail());
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (Preference.getLoggedInFlag()) {
      //get rewinds rules
      widget.homeCon.getRewardsRules();

      //get rewinds points
      widget.homeCon.getRewardsUserPoints(customerEmail: Preference.getLoginEmail());
    }
    List<String> catName = [
      AppLocalizations.of(context)!.tv_Audio,
      AppLocalizations.of(context)!.refrigerators,
      AppLocalizations.of(context)!.washing_Machines,
      AppLocalizations.of(context)!.air_Conditioners,
      AppLocalizations.of(context)!.mobiles_Tablets,
      AppLocalizations.of(context)!.personal_Care,
    ];
    List<String> brandName = [
      AppLocalizations.of(context)!.alhafidh,
      AppLocalizations.of(context)!.panasonic,
      AppLocalizations.of(context)!.samsung,
      AppLocalizations.of(context)!.electrolux,
      AppLocalizations.of(context)!.midea,
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: _pullRefresh,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  addH(70.h),

                  //for top banner
                  CustomBanner(
                    imageList: widget.homeCon.topBannerImageList,
                    loading: widget.homeCon.onTopBannerLoading,
                    imageHandlerList: widget.homeCon.topBannerHandlerList,
                    homeCon: widget.homeCon,
                  ),

                  addH(10.h),

                  // Categories
                  SizedBox(
                    width: 395.w,
                    height: 110.h,
                    child: SizedBox(
                      width: double.infinity,
                      height: 110.h,
                      child: ListView.builder(
                        itemCount: catImages.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return CategoryItem(
                            onTapFn: () {
                              Get.toNamed(ProductsScreen.routeName, arguments: [
                                catId[index].toString(),
                                catName[index].toString()
                              ]);
                            },
                            img: catImages[index],
                            name: catName[index],
                          );
                        },
                      ),
                    ),
                  ),
                  addH(10.h),

                  // Special Offer
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: HorizontalList(
                      loadingFlag: widget.homeCon.specialProductsLoading,
                      productList: widget.homeCon.specialProductsList,
                      title: AppLocalizations.of(context)!.special_Offer,
                      // title: AppLocalizations.of(context)!.,
                      viewAllTxtFn: () {
                        //go products with collection id
                        Get.toNamed(ProductsScreen.routeName, arguments: [
                          '195594190907',
                          AppLocalizations.of(context)!.special_Offer
                        ]);
                      },
                      onTapBuyNowFn: () {
                        Get.offAllNamed(
                          HomeScreen.routeName,
                          arguments: [
                            '3',
                          ],
                        );
                      },
                      // onTapAddToCartFn: () {},
                      exchangeRate: widget.productCon.exchangeRate.value,
                      cartsCon: widget.cartsCon,
                    ),
                  ),
                  addH(10.h),

                  // New Arrivals
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: HorizontalList(
                      loadingFlag: widget.homeCon.newArrivalProductsLoading,
                      productList: widget.homeCon.newArrivalProductsList,
                      title: AppLocalizations.of(context)!.new_Arrivals,
                      cartsCon: widget.cartsCon,
                      viewAllTxtFn: () {
                        //go products with collection id
                        Get.toNamed(ProductsScreen.routeName, arguments: [
                          '279780884539',
                          AppLocalizations.of(context)!.new_Arrivals
                        ]);
                      },
                      exchangeRate: widget.productCon.exchangeRate.value,
                      onTapBuyNowFn: () {
                        Get.offAllNamed(
                          HomeScreen.routeName,
                          arguments: [
                            '3',
                          ],
                        );
                      },
                      // onTapAddToCartFn: () {},
                    ),
                  ),
                  addH(10.h),

                  //for 2nd banner
                  CustomBanner(
                    imageList: widget.homeCon.secondBannerImageList,
                    loading: widget.homeCon.secondBannerLoading,
                    imageHandlerList: widget.homeCon.secondBannerHandlerList,
                    homeCon: widget.homeCon,
                  ),
                  addH(10.h),

                  // Shop By Brands
                  Container(
                    width: double.infinity,
                    height: 60.h,
                    margin: EdgeInsets.only(left: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /* Text(
                        'Shop By Brands',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: ConstantStrings.kAppRobotoFont,
                          color: Colors.black,
                        ),
                      ),*/
                        addH(9.h),
                        // Brands
                        SizedBox(
                          width: double.infinity,
                          height: 35.h,
                          child: ListView.builder(
                            itemCount: brandName.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  setState(
                                    () {
                                      _selectedBrandIndex = index;
                                      widget.homeCon
                                          .getBrandProducts(brandCId[index]);
                                    },
                                  );
                                },
                                child: Container(
                                  width: 80.w,
                                  margin: EdgeInsets.only(right: 10.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.w),
                                    // color: ConstantColors.kF3F3F3,
                                    color: _selectedBrandIndex == index
                                        ? ConstantColors.lightRed
                                        : Colors.white,
                                    // border: Border.all(
                                    //   //color: ConstantColors.kD4EAFC,
                                    //   width: 1.w,
                                    // ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      brandName[index],
                                      style: TextStyle(
                                        color: _selectedBrandIndex == index
                                            ? ConstantColors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  // by brand
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Obx(() {
                      if (widget.homeCon.brandProductsLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        if (widget.homeCon.brandProductsList.isEmpty) {
                          return Text(
                            AppLocalizations.of(context)!.no_Data_Found,
                          );
                        } else {
                          return SizedBox(
                            width: double.infinity,
                            height: 240.h,
                            child: ListView.builder(
                              itemCount:
                                  widget.homeCon.brandProductsList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.only(right: 15),
                                  child: ProductCard(
                                    cardWidth: 143.w,
                                    //cardHeight: 265.h,
                                    imgHeight: 90.h,
                                    imgWidth: 90.w,
                                    onTapBuyNowFn: () {
                                      Get.offAllNamed(
                                        HomeScreen.routeName,
                                        arguments: [
                                          '3',
                                        ],
                                      );
                                    },
                                    pModel:
                                        widget.homeCon.brandProductsList[index],
                                    onTapAddToCartFn: () {
                                      if (widget
                                          .cartsCon.addToCartLoading.value) {
                                        SizedBox(
                                          height: 100.h,
                                          child: const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        );
                                      } else {
                                        Future.delayed(
                                          const Duration(seconds: 1),
                                          () {
                                            widget.cartsCon.getCartList(
                                                cId: Preference.getCartId());
                                            Get.back();
                                            /* _subTotal = 0;
                                            widget.productCon.getCartItems(
                                              userModel!.customerId,
                                            );*/
                                          },
                                        );
                                        Center(
                                          child: Text(
                                              AppLocalizations.of(context)!
                                                  .added_success),
                                        );
                                      }
                                    },
                                    exchangeRate:
                                        widget.productCon.exchangeRate.value,
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      }
                    }),
                  ),
                  addH(10.h),

                  // best seller list
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: HorizontalList(
                      loadingFlag: widget.homeCon.bestSellerProductsLoading,
                      productList: widget.homeCon.bestSellerProductsList,
                      cartsCon: widget.cartsCon,

                      title: AppLocalizations.of(context)!.best_Seller,
                      viewAllTxtFn: () {
                        //go products with collection id
                        Get.toNamed(ProductsScreen.routeName, arguments: [
                          '194856681531',
                          AppLocalizations.of(context)!.best_Seller
                        ]);
                      },
                      onTapBuyNowFn: () {
                        Get.offAllNamed(
                          HomeScreen.routeName,
                          arguments: [
                            '3',
                          ],
                        );
                      },
                      // onTapAddToCartFn: () {},
                      exchangeRate: widget.productCon.exchangeRate.value,
                    ),
                  ),
                  addH(10.h),

                  // All Products for you
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: HorizontalList(
                      loadingFlag: widget.homeCon.allProductProductsLoading,
                      productList: widget.homeCon.allProductsList,
                      title: AppLocalizations.of(context)!.all_Products,
                      cartsCon: widget.cartsCon,
                      viewAllTxtFn: () {
                        //go products with collection id
                        Get.toNamed(ProductsScreen.routeName, arguments: [
                          '264319205435',
                          AppLocalizations.of(context)!.all_Products
                        ]);
                      },
                      onTapBuyNowFn: () {
                        Get.offAllNamed(
                          HomeScreen.routeName,
                          arguments: [
                            '3',
                          ],
                        );
                      },
                      //onTapAddToCartFn: () {},
                      exchangeRate: widget.productCon.exchangeRate.value,
                    ),
                  ),
                  addH(20.h),
                  // Banner
                  //for 3rd banner
                  CustomBanner(
                    imageList: widget.homeCon.topBannerImageList,
                    loading: widget.homeCon.onTopBannerLoading,
                    imageHandlerList: widget.homeCon.topBannerHandlerList,
                    homeCon: widget.homeCon,
                  ),
                  addH(10.h),
                ],
              ),
            ),
            Positioned(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: ConstantColors.lightGray)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: SizedBox(
                          width: 180.w,
                          child: TextField(
                            controller: searchCon,
                            onTap: () {
                              searchCon.clear();
                              showSearch(
                                  context: context,
                                  // delegate to customize the search bar
                                  delegate: CustomSearchDelegate());
                              /// widget.productCon.getSearchAllProducts( q: "cool");
                            },
                            readOnly: true,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: ConstantStrings.kAppRobotoFont,
                              fontWeight: FontWeight.normal,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText:
                                 Preference.getIsArabicFlag()? "  ${AppLocalizations.of(context)!.search_txt}":AppLocalizations.of(context)!.search_txt,

                              // hintText: '${LocaleKeys.app_bar.tr}',
                            ),
                            onChanged: (value) {
                              /* searchCon.clear();
                        showSearch(
                            context: context,
                            // delegate to customize the search bar
                            delegate: CustomSearchDelegate());

                        /// widget.productCon.getSearchAllProducts( q: "cool");*/
                            },
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          searchCon.clear();
                          // method to show the search bar
                          ///  widget.productCon.getSearchAllProducts( q: "cool");
                          showSearch(
                              context: context,
                              // delegate to customize the search bar
                              delegate: CustomSearchDelegate());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: Preference.getIsArabicFlag()
                                ? BorderRadius.only(
                                    topLeft: Radius.circular(5.0),
                                    bottomLeft: Radius.circular(5.0))
                                : BorderRadius.only(
                                    topRight: Radius.circular(5.0),
                                    bottomRight: Radius.circular(5.0)),
                            color: Colors.black,
                          ),
                          height: 46.h,
                          width: 53.h,
                          child: const Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //product search
            Positioned(
                bottom: 10,
                right: 10,
                child: Obx(() {
                  if (widget.homeCon.userPointsLoading.value) {
                    return const SizedBox.shrink();
                  } else {
                    if (widget.homeCon.rewards != null) {
                      if (Preference.getLoggedInFlag()) {
                        return InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              backgroundColor: Colors.transparent,
                              builder: (BuildContext context) {
                                return LoyaltyPointPage(
                                  uModel: uModel,
                                  homeCon: widget.homeCon,
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 40.h,
                            width: 120.w,
                            decoration: BoxDecoration(
                                color: Colors.amber.shade900,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(5))),
                            child: Center(
                                child: Text(
                              "${AppLocalizations.of(context)!.loyalty_points} ${widget.homeCon.rewards!.availablePoints}",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.white,
                              ),
                            )),
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    } else {
                      return const SizedBox.shrink();
                    }
                  }
                })),
          ],
        ),
      ),

/*
     floatingActionButton: Obx(() {
        if (widget.homeCon.userPointsLoading.value) {
          return SizedBox();
        } else {
          if(widget.homeCon.rewards!=null){
            if (Preference.getLoggedInFlag()) {
              return InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    backgroundColor: Colors.transparent,
                    builder: (BuildContext context) {
                      return LoyaltyPointPage(
                        uModel: uModel,
                        homeCon: widget.homeCon,
                      );
                    },
                  );
                },
                child: Container(
                  height: 40.h,
                  width: 120.w,
                  decoration: BoxDecoration(
                      color: Colors.amber.shade900,
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: Center(
                      child: Text(
                        "${AppLocalizations.of(context)!.loyalty_points} ${widget.homeCon.rewards!.availablePoints}",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.white,
                        ),
                      )),
                ),
              );
            } else {
              return SizedBox();
            }
          }else {
            return SizedBox();
          }

        }
      }),
*/
    );
  }

  Future<void> _pullRefresh() async {
    setState(() {
      //get Band Product
      widget.homeCon.getBrandProducts(190864523323);

      //get special products
      widget.homeCon.getSpecialProducts(195594190907);

      //get new arrival
      widget.homeCon.getNewArrivalProducts(279780884539);

      //get best seller
      widget.homeCon.getBestSellerProducts(194856681531,true);

      //get all product
      widget.homeCon.getAllProducts(264319205435,true);

      if (Preference.getLoggedInFlag()) {
        //get rewinds rules
        widget.homeCon.getRewardsRules();

        //get rewinds points
        widget.homeCon.getRewardsUserPoints(customerEmail: Preference.getLoginEmail());
      }
    });
  }
}
