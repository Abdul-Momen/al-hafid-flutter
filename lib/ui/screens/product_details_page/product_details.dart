import 'dart:async';
import 'package:alhafidh/constants/color.dart';
import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/helper/helper.dart';
import 'package:alhafidh/states/controller/cart.dart';
import 'package:alhafidh/states/controller/products.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/states/models/customer_model.dart';
import 'package:alhafidh/states/models/product_model.dart';
import 'package:alhafidh/ui/screens/home/home.dart';
import 'package:alhafidh/ui/screens/home/logo.dart';
import 'package:alhafidh/ui/screens/product_details_page/product_gallery.dart';
import 'package:alhafidh/ui/screens/product_details_page/rating_item.dart';
import 'package:alhafidh/ui/screens/products/products.dart';
import 'package:alhafidh/ui/widgets/build_text.dart';
import 'package:alhafidh/ui/widgets/custom_app_bar.dart';
import 'package:alhafidh/ui/widgets/custom_btn.dart';
import 'package:alhafidh/ui/widgets/custom_img.dart';
import 'package:alhafidh/ui/widgets/horizontal_list.dart';
import 'package:alhafidh/ui/widgets/quantity_edit.dart';
import 'package:alhafidh/ui/widgets/releted_horizontal_list.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../main.dart';
import '../../../states/models/filter_response_model.dart';
import '../../../states/models/wishlist_model.dart';

class ProductDetails extends StatefulWidget {
  static String routeName = '/product_details';

  //final VoidCallback backFn;

  const ProductDetails({
    Key? key,
    //required this.backFn,
  }) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final ProductsController _productsCon = Get.find<ProductsController>();
  final CartsController _cartsCon = Get.find<CartsController>();
  late int pId;
  late String handle;
  CustomerModel? uModel;
  int _quantity = 1;
  int _selectedPackageIndex = 0;

  bool _isFavorite = false;
  bool _isAddingtoCart = false;
  int _isSelect = 0;
  late final WishlistModel wishlistModel;
  bool viewAll = false;


  //for price formatting
  final value = NumberFormat("#,##0", "en_US");
  final rValue = NumberFormat("#,##0.00", "en_US");

  int selectedPromoImageIndex = 0;

  List<String> promoImg = Preference.getPromoImages();
  List<String> code = Preference.getPromoCode();

  @override
  void initState() {
    if (Preference.getCartId().isNotEmpty) {
      _cartsCon.getCartList(cId: Preference.getCartId());
    }
    if (Get.arguments != null) {
      //get product by arg
      pId = Get.arguments[0];
      handle = Get.arguments[1];
      print('handle = > ' + handle);
      // selectedImage = Get.arguments[1];
    }

    //for title tr arabic
    _productsCon.getDtTranProductAr(pId.toString());

    //get product dt
    _productsCon.getProductDetails(
      productMasterID: pId,
    );
    _productsCon.getReviewProducts(pId);

    _productsCon.getDescriptionTranProductAr(handle);

    //get Related GraphQl product
    // _productsCon.getRelatedProducts(productType: pModel.productType, vendor: pModel.vendor);
    //air condition product Id default
    //_productsCon.getFilterAllProducts(collectionId: 190827757627);
    //_productsCon.getRelatedProducts(pId);
    _productsCon.getRelatedProductsGpl(pId: pId.toString());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //_productsCon.getRelatedProductsGpl(pId: pId.toString());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(),
      body: SafeArea(
        child: Obx(() {
          if (Preference.getIsArabicFlag()
              ? _productsCon.productDetailsLoading.value &&
                  _productsCon.productDescriptionTrLoading.value
              : _productsCon.productDetailsLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (_productsCon.pDetailsModel == null) {
              return Center(
                child: Text(ConstantStrings.kWentWrong),
              );
            } else {
              //for dynamic promo code
              for (var i = 0; i < code.length; i++) {
                print("test a");
                print(_productsCon.pDetailsModel!.product.tags.toString());
                if (_productsCon.pDetailsModel!.product.tags
                    .contains(code[i])) {
                  print("test b");

                  print(code[i].toString());
                  print("test c ");

                  print(i.toString());
                  selectedPromoImageIndex = i;
                }
              }
              //print("p im t ${promoImg[selectedPromoImageIndex]}");

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          children: [
                            // product image & gallery
                            ProductGallery(
                              pModel: _productsCon.pDetailsModel!,
                              productsCon: _productsCon,
                            ),

                            Positioned(
                              top: 20.h,
                              right: 0.w,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // favorite icon
                                        InkWell(
                                          onTap: () {
                                            setState(
                                              () => _isFavorite = !_isFavorite,
                                            );
                                            wishlistModel = WishlistModel(
                                              title: _productsCon
                                                  .pDetailsModel!.product.title,
                                              status: '',
                                              image: _productsCon.pDetailsModel!
                                                  .product.image.src,
                                              price: value.format(double.parse(
                                                    _productsCon
                                                        .pDetailsModel!
                                                        .product
                                                        .variants[0]
                                                        .price,
                                                  ) *
                                                  _productsCon
                                                      .exchangeRate.value),
                                              stock: '',
                                              isFavorite: true,
                                              adminGraphQlapiId:
                                                  'gid://shopify/ProductVariant/${_productsCon.pDetailsModel!.product.variants[0].id}',
                                              quantity: 1,
                                            );
                                            objectBox
                                                .insertWishlist(wishlistModel);
                                          },
                                          child: Icon(
                                            _isFavorite
                                                ? Icons.favorite
                                                : Icons.favorite_outline,
                                            color: _isFavorite
                                                ? Colors.red
                                                : Colors.black,
                                            size: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                    addH(15.h),
                                    InkWell(
                                      onTap: () {
                                        // for share
                                        share(
                                            url: _productsCon
                                                .pDetailsModel!.product.handle);
                                      },
                                      child: const Icon(
                                        Icons.share_outlined,
                                        color: Colors.black,
                                        size: 25,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),

                            if (_productsCon.pDetailsModel!.product.variants[0]
                                    .compareAtPrice !=
                                null)
                              Positioned(
                                top: 15.h,
                                left: 20.w,
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: ConstantColors.lightRed),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Center(
                                          child: Text(
                                        '${AppLocalizations.of(context)!.off} ${AppLocalizations.of(context)!.iqd} ${rValue.format(double.parse(_productsCon.pDetailsModel!.product.variants[0].compareAtPrice) * _productsCon.exchangeRate.value - calculateRoundPrice(inputNum: double.parse(_productsCon.pDetailsModel!.product.variants[0].price) * _productsCon.exchangeRate.value))}',
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: ConstantColors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                    ),
                                  ),
                                ),
                              ),

                            Positioned(
                              bottom: 110.h,
                              left: 10.w,
                              child: Column(
                                children: [
                                  if (selectedPromoImageIndex != 0)
                                    CustomImg(
                                      imgUrl: Uri.encodeFull(
                                          promoImg[selectedPromoImageIndex]
                                              .trim()),
                                      imgWidth: 90.w,
                                      imgHeight: 70.h,
                                      imgFit: BoxFit.fill,
                                    ),
                                  if (selectedPromoImageIndex == 0)
                                    SizedBox(
                                      height: 20.h,
                                      width: 30.w,
                                      child: Container(),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        addH(10.h),

                        // product name
                        SizedBox(
                          width: 355.w,
                          height: 45.h,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                            child: AutoSizeText(
                              Preference.getIsArabicFlag()
                                  ? _productsCon
                                              .translateProductDtlist[0].key ==
                                          'title'
                                      ? _productsCon
                                          .translateProductDtlist[0].value
                                          .toString()
                                      : _productsCon
                                          .translateProductDtlist[1].value
                                          .toString()
                                  : _productsCon.pDetailsModel!.product.title,
                              maxLines: 2,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: ConstantStrings.kFontFamily,
                              ),
                            ),
                          ),
                        ),
                        addH(5.h),

                        //product model & brand
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.0.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  _buildTitle(
                                      title:
                                          AppLocalizations.of(context)!.model),
                                  _buildTitle(
                                      title: _productsCon.pDetailsModel!.product
                                          .variants[0].sku,
                                      clr: Colors.grey,
                                      fSize: 12.sp),
                                ],
                              ),
                              Row(
                                children: [
                                  _buildTitle(
                                      title:
                                          AppLocalizations.of(context)!.brand),
                                  if (_productsCon.pDetailsModel!.product.vendor
                                          .toLowerCase() ==
                                      'alhafidh')
                                    _buildBrandImg(
                                        img: 'assets/images/alhafidh.png'),
                                  if (_productsCon.pDetailsModel!.product.vendor
                                          .toLowerCase() ==
                                      'panasonic')
                                    _buildBrandImg(
                                        img: 'assets/images/panasonic.png'),
                                  if (_productsCon.pDetailsModel!.product.vendor
                                          .toLowerCase() ==
                                      'samsung')
                                    _buildBrandImg(
                                        img: 'assets/images/samsung.png'),
                                  if (_productsCon.pDetailsModel!.product.vendor
                                          .toLowerCase() ==
                                      'huawei')
                                    _buildBrandImg(
                                        img: 'assets/images/huawei.png'),
                                  if (_productsCon.pDetailsModel!.product.vendor
                                          .toLowerCase() ==
                                      'unilumin')
                                    _buildBrandImg(
                                        img: 'assets/images/unilumin.png'),
                                  if (_productsCon.pDetailsModel!.product.vendor
                                          .toLowerCase() ==
                                      'applre')
                                    _buildBrandImg(
                                        img: 'assets/images/apple.png'),
                                  if (_productsCon.pDetailsModel!.product.vendor
                                          .toLowerCase() ==
                                      'electrolux')
                                    _buildBrandImg(
                                        img: 'assets/images/electrolux.png'),
                                  if (_productsCon.pDetailsModel!.product.vendor
                                          .toLowerCase() ==
                                      'midea')
                                    _buildBrandImg(
                                        img: 'assets/images/midea.png'),

                                  /*  // product image
                                          CustomImg(
                                            imgUrl:
                                                'https://firebasestorage.googleapis.com/v0/b/test-f61e9.appspot.com/o/image%2045.png?alt=media&token=ca624a84-9787-4ad4-b140-6cb173ef74e2',
                                            imgWidth: 30.w,
                                            imgHeight: 25.h,
                                          ),*/
                                ],
                              ),
                            ],
                          ),
                        ),

                        //total review
                        Obx(() {
                          if (_productsCon.reviewProductsLoading.value) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            if (_productsCon.reviewList.isEmpty) {
                              return Center(
                                child: Text(
                                  AppLocalizations.of(context)!.no_Data_Found,
                                ),
                              );
                            } else {
                              //calculate average
                              int sumRating = 0;
                              for (var i = 0;
                                  i < _productsCon.reviewList.length;
                                  i++) {
                                sumRating += _productsCon.reviewList[i].rating;
                              }
                              var average =
                                  (sumRating / _productsCon.reviewList.length);

                              return Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 18.0.w),
                                child: Row(
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            color: ConstantColors.lightRed,
                                            border: Border.all(
                                              color: ConstantColors.lightRed,
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10))),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                color: Colors.white,
                                                size: 12,
                                              ),
                                              _buildTitle(
                                                  title: rValue.format(average),
                                                  clr: Colors.white,
                                                  fSize: 11.sp),
                                            ],
                                          ),
                                        )),
                                    addW(5.w),
                                    _buildTitle(
                                        title:
                                            '(${_productsCon.reviewList.length} ${AppLocalizations.of(context)!.review})',
                                        clr: Colors.grey,
                                        fSize: 11.sp),
                                  ],
                                ),
                              );
                            }
                          }
                        }),

                        addH(5.h),

                        // prices
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.0.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ///remove Use price
                              /* Row(
                                children: [
                                  Text(
                                    "\$${_productsCon.pDetailsModel!.product.variants[0].price}",
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: ConstantStrings.kFontFamily,
                                    ),
                                  ),
                                  addW(5.w),
                                  if (_productsCon.pDetailsModel!.product.variants[0].compareAtPrice != null)
                                    Text(
                                      "\$${_productsCon.pDetailsModel!.product.variants[0].compareAtPrice}",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12.sp,
                                        decoration: TextDecoration.lineThrough,
                                        fontFamily: ConstantStrings.kFontFamily,
                                      ),
                                    ),
                                ],
                              ),*/
                              Row(
                                children: [
                                  Text(
                                    '${AppLocalizations.of(context)!.iqd} ${value.format(calculateRoundPrice(inputNum: double.parse(_productsCon.pDetailsModel!.product.variants[0].price) * _productsCon.exchangeRate.value))}',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: ConstantStrings.kFontFamily,
                                    ),
                                  ),
                                  addW(5.w),
                                  if (_productsCon.pDetailsModel!.product
                                          .variants[0].compareAtPrice !=
                                      null)
                                    Text(
                                      '${AppLocalizations.of(context)!.iqd} ${value.format(double.parse(_productsCon.pDetailsModel!.product.variants[0].compareAtPrice) * _productsCon.exchangeRate.value)}',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12.sp,
                                        decoration: TextDecoration.lineThrough,
                                        fontFamily: ConstantStrings.kFontFamily,
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        addH(10.h),
                        // description, spacification,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _isSelect = 0;
                                  });
                                },
                                child: Container(
                                  color: _isSelect == 0
                                      ? ConstantColors.lightRed
                                      : Colors.white,
                                  height: 40.h,
                                  width: 100.w,
                                  child: Center(
                                    child: Text(
                                      AppLocalizations.of(context)!.description,
                                      style: TextStyle(
                                          color: _isSelect == 0
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              /* InkWell(
                                  onTap: () {
                                    setState(() {
                                      _isSelect = 1;
                                    });
                                  },
                                  child: Container(
                                    color: _isSelect == 1
                                        ? ConstantColors.lightRed
                                        : Colors.white,
                                    height: 40.h,
                                    width: 100.w,
                                    child: Center(
                                        child: Text(
                                      'Specification',
                                      style: TextStyle(
                                          color: _isSelect == 1
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _isSelect = 2;
                                    });
                                  },
                                  child: Container(
                                    color: _isSelect == 2
                                        ? ConstantColors.lightRed
                                        : Colors.white,
                                    height: 40.h,
                                    width: 100.w,
                                    child: Center(
                                        child: Text(
                                      'Downloads',
                                      style: TextStyle(
                                          color: _isSelect == 2
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),*/
                            ],
                          ),
                        ),
                        if (_isSelect == 0)
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Html(
                                  data: Preference.getIsArabicFlag()
                                      ? _productsCon.arHtml.value
                                      : _productsCon
                                          .pDetailsModel!.product.bodyHtml,
                                ),
                              ],
                            ),
                          )
                      ],
                    ),
                    // ratings,
                    Obx(() {
                      if (_productsCon.reviewProductsLoading.value) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        if (_productsCon.reviewList.isEmpty) {
                          return Center(
                            child: Text(
                              AppLocalizations.of(context)!.no_Data_Found,
                            ),
                          );
                        } else {
                          //calculate average
                          int sumRating = 0;
                          for (var i = 0;
                              i < _productsCon.reviewList.length;
                              i++) {
                            sumRating += _productsCon.reviewList[i].rating;
                          }
                          var average =
                              (sumRating / _productsCon.reviewList.length);

                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                addH(20.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 130.w,
                                      child: Row(
                                        children: [
                                          Text(
                                            AppLocalizations.of(context)!
                                                .ratings,
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                              fontFamily:
                                                  ConstantStrings.kFontFamily,
                                            ),
                                          ),
                                          addW(10.w),
                                          Icon(
                                            Icons.star,
                                            size: 15,
                                            color: ConstantColors.lightRed,
                                          ),
                                          Text(
                                            '${rValue.format(average)}',
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.grey.shade700,
                                              fontWeight: FontWeight.bold,
                                              fontFamily:
                                                  ConstantStrings.kFontFamily,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      child: Row(
                                        children: [
                                          Text(
                                            '${_productsCon.reviewList.length} ${AppLocalizations.of(context)!.ratings}',
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.grey,
                                              fontFamily:
                                                  ConstantStrings.kFontFamily,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              // TODO: see all ratings
                                            },
                                            child: const Icon(
                                              Icons.arrow_forward_ios,
                                              size: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                addH(10.h),
                                // Ratings
                                if (viewAll == false)
                                  SizedBox(
                                      width: double.infinity,
                                      height: 240.h,
                                      child: ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        primary: false,
                                        itemCount:
                                            _productsCon.reviewList.length,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return RatingItem(
                                            name: _productsCon
                                                .reviewList[index].title,
                                            date: DateFormat('dd-MM-yyyy')
                                                .format(DateTime.parse(
                                                    _productsCon
                                                        .reviewList[index]
                                                        .createdAt)),
                                            subTxt: _productsCon
                                                .reviewList[index].body,
                                            dividerFlag: true,
                                            totalRating: double.parse(
                                                _productsCon
                                                    .reviewList[index].rating
                                                    .toString()),
                                          );
                                        },
                                      )),
                                if (viewAll == true)
                                  ListView.builder(
                                    //physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    primary: false,
                                    itemCount: _productsCon.reviewList.length,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return InkWell(
                                        child: RatingItem(
                                          name: _productsCon
                                              .reviewList[index].title,
                                          date: DateFormat('dd-MM-yyyy').format(
                                              DateTime.parse(_productsCon
                                                  .reviewList[index].createdAt)),
                                          subTxt:
                                              _productsCon.reviewList[index].body,
                                          dividerFlag: true,
                                          totalRating: double.parse(_productsCon
                                              .reviewList[index].rating
                                              .toString()),
                                        ),
                                      );
                                    },
                                  ),

                                addH(10.h),
                                InkWell(
                                  onTap: () {
                                    if (viewAll) {
                                      viewAll = false;
                                      setState(() {});
                                    } else {
                                      viewAll = true;
                                      setState(() {});
                                    }
                                  },
                                  child: Center(
                                    child: Text(
                                     viewAll?AppLocalizations.of(context)!.view_less: AppLocalizations.of(context)!.view_All,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: ConstantColors.k2377A6,
                                        fontFamily: ConstantStrings.kFontFamily,
                                      ),
                                    ),
                                  ),
                                ),
                                addH(20.h),

                                //dame related..
                                /*    // Related Products
                                HorizontalList(
                                  loadingFlag:
                                      _productsCon.filterProductsLoading,
                                  //loadingFlag: false.obs,
                                  productList: _productsCon.productRelatedList,
                                  title: AppLocalizations.of(context)!
                                      .related_Products,
                                  viewAllTxtFn: () {},
                                  onTapBuyNowFn: () {
                                    Get.offAllNamed(
                                      HomeScreen.routeName,
                                      arguments: [
                                        '3',
                                      ],
                                    );
                                  },
                                  // onTapAddToCartFn: () {},
                                  exchangeRate: _productsCon.exchangeRate.value,
                                  cartsCon: _cartsCon,
                                ),*/
                              ],
                            ),
                          );
                        }
                      }
                    }),

                    ///dam related..
                    // Related Products
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: ReleatedHorizontalList(
                        loadingFlag: _productsCon.relatedProductsLoading,
                        //loadingFlag: false.obs,
                        productList: _productsCon.recommendationProdcutList,
                        title: AppLocalizations.of(context)!.related_Products,
                        viewAllTxtFn: () {
                          ///go products with collection id
                          Get.toNamed(ProductsScreen.routeName, arguments: [
                            '279780884539',
                            AppLocalizations.of(context)!.new_Arrivals
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
                        onTapAddToCartFn: () {},
                        exchangeRate: _productsCon.exchangeRate.value,
                        cartsCon: _cartsCon,
                      ),
                    ),
                  ],
                ),
              );
            }
          }
        }),
      ),
      bottomNavigationBar: SizedBox(
        height: 150.h,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Obx(() {
              if (_productsCon.productDetailsLoading.value) {
                return const SizedBox.shrink();
              } else {
                if (_productsCon.pDetailsModel == null) {
                  return const SizedBox.shrink();
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 428.w,
                        height: 75.h,
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          children: [
                            addH(5.h),
                            if (_productsCon.pDetailsModel!.product.variants[0]
                                    .inventoryQuantity ==
                                0)
                              Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(1.h),
                                    border: Border.all(
                                      color: ConstantColors.lightRed,
                                      width: 1.h,
                                    ),
                                  ),
                                  height: 50.h,
                                  width: 300.w,
                                  child: Center(
                                      child: BuildText(
                                    text:
                                        AppLocalizations.of(context)!.sold_Out,
                                    txtClr: ConstantColors.lightRed,
                                    fontFamily: ConstantStrings.kAppFontPoppins,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp,
                                  )),
                                ),
                              ),
                            if (_productsCon.pDetailsModel!.product.variants[0]
                                    .inventoryQuantity !=
                                0)
                              Row(
                                children: [
                                  QuantityEdit(
                                    quantity: _quantity,
                                    decreaseFn: () {
                                      if (_quantity == 1) {
                                        return;
                                      }
                                      setState(() => _quantity--);
                                    },
                                    increaseFn: () {
                                      setState(() => _quantity++);
                                    },
                                  ),
                                  /*        Text(
                              // 'AED${_productsCon.pDetailsModel!.productSubSkuRequestModels[_selectedPackageIndex].price * _quantity}',
                              '\$ ${344 * _quantity}',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: ConstantStrings.kFontFamily,
                              ),
                        ),*/
                                  CustomBtn(
                                    onPressedFn: () async {
                                      if (_cartsCon.isAddCarted.value) {
                                        _cartsCon.addToCart(
                                          merchandiseId:
                                              "gid://shopify/ProductVariant/${_productsCon.pDetailsModel!.product.variants[0].id}",
                                          qnty: _quantity,
                                        );
                                        print('Product id => '
                                            "gid://shopify/ProductVariant/${_productsCon.pDetailsModel!.product.variants[0].id}");
                                      } else {
                                        _cartsCon.addToAnotherCart(
                                          merchandiseId:
                                              "gid://shopify/ProductVariant/${_productsCon.pDetailsModel!.product.variants[0].id}",
                                          cId: _cartsCon.cartId.value,
                                          quantity: _quantity,
                                        );
                                        print('Product id => '
                                            "gid://shopify/ProductVariant/${_productsCon.pDetailsModel!.product.variants[0].id}");
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
                                                const Duration(seconds: 0),
                                                () {
                                                  _cartsCon.isAddCarted.value =
                                                      true;
                                                  // TODO: implement initState
                                                  if (Preference.getCartId()
                                                      .isNotEmpty) {
                                                    _cartsCon.getCartList(
                                                        cId: Preference
                                                            .getCartId());
                                                  }
                                                  Get.back();
                                                  Get.offAllNamed(
                                                    HomeScreen.routeName,
                                                    arguments: [
                                                      '3',
                                                    ],
                                                  );
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
                                    btnTxt: _isAddingtoCart
                                        ? AppLocalizations.of(context)!
                                            .processing
                                        : AppLocalizations.of(context)!.buy_Now,
                                    txtSize: 12.sp,
                                    btnSize: Size(110.w, 40.h),
                                    btnColor: Colors.green,
                                    btnBorderColor: Colors.green,
                                  ),
                                  const Spacer(),
                                  CustomBtn(
                                    onPressedFn: () async {
                                      if (_cartsCon.isAddCarted.value) {
                                        _cartsCon.addToCart(
                                          merchandiseId:
                                              "gid://shopify/ProductVariant/${_productsCon.pDetailsModel!.product.variants[0].id}",
                                          qnty: _quantity,
                                        );
                                        print('Product id => '
                                            "gid://shopify/ProductVariant/${_productsCon.pDetailsModel!.product.variants[0].id}");
                                      } else {
                                        _cartsCon.addToAnotherCart(
                                          merchandiseId:
                                              "gid://shopify/ProductVariant/${_productsCon.pDetailsModel!.product.variants[0].id}",
                                          cId: _cartsCon.cartId.value,
                                          quantity: _quantity,
                                        );
                                        print('Product id => '
                                            "gid://shopify/ProductVariant/${_productsCon.pDetailsModel!.product.variants[0].id}");
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
                                                const Duration(seconds: 0),
                                                () {
                                                  _cartsCon.isAddCarted.value =
                                                      true;
                                                  // TODO: implement initState
                                                  if (Preference.getCartId()
                                                      .isNotEmpty) {
                                                    _cartsCon.getCartList(
                                                        cId: Preference
                                                            .getCartId());
                                                  }
                                                  Get.back();
                                                  /* _subTotal = 0;
                                                  _productsCon.getCartItems(
                                                    userModel!.customerId,
                                                  );*/
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
                                    btnTxt: _isAddingtoCart
                                        ? AppLocalizations.of(context)!
                                            .processing
                                        : AppLocalizations.of(context)!
                                            .add_to_Cart,
                                    txtSize: 12.sp,
                                    btnSize: Size(110.w, 40.h),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 70.h,
                        child: CurvedNavigationBar(
                          color: ConstantColors.grayWhite,
                          backgroundColor: ConstantColors.white,
                          buttonBackgroundColor: ConstantColors.lightRed,
                          index: 1,
                          items: <Widget>[
                            //bottom navigation icon
                            InkWell(
                              onTap: () {
                                Get.offAllNamed(HomeScreen.routeName,
                                    arguments: [
                                      '0',
                                    ]);
                              },
                              child: Icon(
                                Icons.home,
                                size: 25.h,
                                color: ConstantColors.grayBlack,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.offAllNamed(HomeScreen.routeName,
                                    arguments: [
                                      '1',
                                    ]);
                              },
                              child: Icon(
                                Icons.category_outlined,
                                size: 25.h,
                                color: Colors.white,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.offAllNamed(HomeScreen.routeName,
                                    arguments: [
                                      '2',
                                    ]);
                              },
                              child: Icon(
                                Icons.person,
                                size: 25.h,
                                color: ConstantColors.grayBlack,
                              ),
                            ),
                            Stack(
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    Get.offAllNamed(HomeScreen.routeName,
                                        arguments: [
                                          '3',
                                        ]);
                                  },
                                  child: Icon(
                                    Icons.shopping_bag_outlined,
                                    size: 25.h,
                                    color: ConstantColors.grayBlack,
                                  ),
                                ),
                                Obx(() {
                                  if (_cartsCon.cartItemsLoading.value) {
                                    return Text('');
                                  } else {
                                    if (_cartsCon.cartItemList.isNotEmpty) {
                                      return Positioned(
                                        right: 0,
                                        child: Container(
                                          padding: const EdgeInsets.all(1),
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          constraints: BoxConstraints(
                                            minWidth: 12.w,
                                            minHeight: 12.h,
                                          ),
                                          child: Text(
                                            _cartsCon.cartItemList.length
                                                .toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 9.sp,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      );
                                    } else {
                                      return Text('');
                                    }
                                  }
                                })
                              ],
                            ),
                          ],
                          onTap: (index) {},
                          letIndexChange: (index) => true,
                        ),
                      ),
                    ],
                  );
                }
              }
            }),
          ],
        ),
      ),
    );
  }

  //add share btn
  Future<void> share({required String url}) async {
    await FlutterShare.share(
        title: 'AlHafid',
        text: '',
        linkUrl: 'https://www.alhafidh.com/en/products/$url',
        chooserTitle: 'Example Chooser Title');
  }

  //custom text
  Widget _buildTitle({required String title, Color? clr, double? fSize}) {
    return Text(
      title,
      style: TextStyle(
          fontSize: fSize ?? 16.sp,
          fontWeight: FontWeight.bold,
          fontFamily: ConstantStrings.kFontFamily,
          color: clr ?? Colors.black87),
    );
  }

  Widget _buildBrandImg({
    required String img,
    double? h,
    double? w,
  }) {
    return Padding(
      padding: EdgeInsets.all(5.0.w),
      child: Image.asset(
        img,
        height: h ?? 60.h,
        width: w ?? 70.w,
      ),
    );
  }
}
