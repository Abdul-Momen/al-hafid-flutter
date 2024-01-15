import 'package:alhafidh/constants/color.dart';
import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/helper/helper.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/states/models/related_prodcut_model.dart';
import 'package:alhafidh/states/models/related_product_model.dart';
import 'package:alhafidh/states/models/wishlist_model.dart';
import 'package:alhafidh/ui/screens/product_details_page/product_details.dart';
import 'package:alhafidh/ui/widgets/build_text.dart';
import 'package:alhafidh/ui/widgets/custom_img.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import '../../main.dart';

class RelatedProductCard extends StatefulWidget {
  final ProductRecommendation pModel;
  double? cardWidth;
  double? cardHeight;
  double? imgHeight;
  double? imgWidth;
  double? addCartBtnWidth;
  double? addCartBtnHeight;
  double? buyBtnWidth;
  double? buyBtnHeight;
  double? offWidth;
  double? offHeight;
  final double exchangeRate;

  final VoidCallback onTapBuyNowFn;
  final VoidCallback onTapAddToCartFn;

  RelatedProductCard({
    Key? key,
    this.cardWidth,
    this.imgWidth,
    this.imgHeight,
    this.cardHeight,
    this.addCartBtnWidth,
    this.addCartBtnHeight,
    this.buyBtnWidth,
    this.buyBtnHeight,
    this.offHeight,
    this.offWidth,
    required this.onTapBuyNowFn,
    required this.onTapAddToCartFn,
    required this.exchangeRate,
    required this.pModel,
  }) : super(key: key);

  @override
  State<RelatedProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<RelatedProductCard> {
  bool isFavorite = false;
  late final WishlistModel wishlistModel;

  //for price formatting
  final value = NumberFormat("#,##0", "en_US");

  //fro promo code

  int selectedPromoImageIndex = 0;
  List<String> promoImg = Preference.getPromoImages();
  List<String> code = Preference.getPromoCode();

  @override
  Widget build(BuildContext context) {
    //for dynamic promo code
    for (var i = 0; i < code.length; i++) {
      //  print("test");
      if (widget.pModel.tags.contains(code[i])) {
        print(code[i].toString());
        print(i.toString());
        selectedPromoImageIndex = i;
      }
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: widget.cardWidth ?? 160.w,
          // height: widget.cardHeight ?? 245.h,
          child: Center(
            child: Stack(
              children: [
                // Product Image, Name, Price
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    //go to details
                    Get.toNamed(ProductDetails.routeName, preventDuplicates: false,
                        arguments: [
                      int.parse(
                          widget.pModel.id.replaceAll(RegExp(r'[^0-9.]'), '')),
                          widget.pModel.handle
                    ]);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        addH(7.h),
                        CustomImg(
                          imgUrl:
                              widget.pModel.images.edges[0].node.originalSrc,
                          imgWidth: widget.imgWidth ?? 114.w,
                          imgHeight: widget.imgHeight ?? 70.h,
                          imgFit: BoxFit.fill,
                        ),
                        addH(2.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (widget.pModel.vendor.toLowerCase() ==
                                'alhafidh')
                              _buildBrandImg(img: 'assets/images/alhafidh.png'),
                            if (widget.pModel.vendor.toLowerCase() ==
                                'panasonic')
                              _buildBrandImg(
                                  img: 'assets/images/panasonic.png'),
                            if (widget.pModel.vendor.toLowerCase() == 'samsung')
                              _buildBrandImg(img: 'assets/images/samsung.png'),
                            if (widget.pModel.vendor.toLowerCase() == 'huawei')
                              _buildBrandImg(img: 'assets/images/huawei.png'),
                            if (widget.pModel.vendor.toLowerCase() ==
                                'unilumin')
                              _buildBrandImg(img: 'assets/images/unilumin.png'),
                            if (widget.pModel.vendor.toLowerCase() == 'applre')
                              _buildBrandImg(img: 'assets/images/apple.png'),
                            if (widget.pModel.vendor.toLowerCase() ==
                                'electrolux')
                              _buildBrandImg(
                                  img: 'assets/images/electrolux.png'),
                            if (widget.pModel.vendor.toLowerCase() == 'midea')
                              _buildBrandImg(img: 'assets/images/midea.png'),
                            VerticalDivider(
                              width: 2.w,
                              color: Colors.black26,
                            ),
                            addW(10.w),
                            if (selectedPromoImageIndex != 0)
                              CustomImg(
                                imgUrl: promoImg[selectedPromoImageIndex],
                                imgWidth: 30.w,
                                imgHeight: 20.h,
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
                        addH(2.h),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 5.w,
                            bottom: 2.h,
                            right: 5.w,
                          ),
                          child: BuildText(
                            text: widget.pModel.title,
                            txtClr: ConstantColors.lightRed,
                            maximumLines: 2,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5.w, right: 5.w),
                              child: BuildText(
                                text: widget.pModel.variants.edges[0].node.sku,
                                txtClr: Colors.black45,
                                maximumLines: 1,
                                fontSize:
                                    Preference.getIsArabicFlag() ? 8.sp : 10.sp,
                              ),
                            ),
                          ],
                        ),
                        addH(2.h),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /* BuildText(
                                text: '\$${widget.pModel.variants[0].price}',
                                txtClr: Colors.black,
                                maximumLines: 1,
                                fontSize: 9.sp,
                              ),*/
                              BuildText(
                                // text: '${AppLocalizations.of(context)!.iqd}${value.format(int.parse(double.parse(widget.pModel.variants.edges[0].node.priceV2.amount).toStringAsFixed(0)) * widget.exchangeRate)}',
                                text:
                                    '${AppLocalizations.of(context)!.iqd}${value.format(calculateRoundPrice(inputNum: double.parse(widget.pModel.variants.edges[0].node.priceV2.amount) * widget.exchangeRate))}',
                                txtClr: Colors.black,
                                maximumLines: 1,
                                fontSize: 9.sp,
                              ),
                            ],
                          ),
                        ),
                        //for off image
                        if (widget.pModel.variants.edges[0].node
                                .compareAtPriceV2.amount.isNotEmpty &&
                            widget.pModel.variants.edges[0].node
                                .compareAtPriceV2.amount.isNotEmpty)
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BuildText(
                                  text:
                                      '${AppLocalizations.of(context)!.iqd}${value.format(double.parse(widget.pModel.variants.edges[0].node.compareAtPriceV2.amount.toString()) * widget.exchangeRate)}',
                                  txtClr: Colors.black45,
                                  maximumLines: 1,
                                  fontSize: 9.sp,
                                  textDecoration: TextDecoration.lineThrough,
                                  fontWeight: FontWeight.normal,
                                ),
                              ],
                            ),
                          ),
                        addH(2.h),
                        if (widget.pModel.variants.edges[0].node
                                .availableForSale ==
                            false)
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1.h),
                                border: Border.all(
                                  color: ConstantColors.lightRed,
                                  width: 1.h,
                                ),
                              ),
                              height: 25.h,
                              width: 100.w,
                              child: Center(
                                  child: BuildText(
                                text: AppLocalizations.of(context)!.sold_Out,
                                txtClr: ConstantColors.lightRed,
                                fontFamily: ConstantStrings.kAppFontPoppins,
                                fontWeight: FontWeight.bold,
                                fontSize: 8.sp,
                              )),
                            ),
                          ),
                        if (widget
                            .pModel.variants.edges[0].node.availableForSale)
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: widget.onTapBuyNowFn,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.h),
                                      color: Colors.green,
                                    ),
                                    height: widget.buyBtnHeight ?? 21.h,
                                    width: widget.buyBtnWidth ?? 50.w,
                                    child: Center(
                                        child: BuildText(
                                      text:
                                          AppLocalizations.of(context)!.buy_Now,
                                      txtClr: ConstantColors.white,
                                      fontFamily:
                                          ConstantStrings.kAppFontPoppins,
                                      fontSize: 8.sp,
                                    )),
                                  ),
                                ),
                                InkWell(
                                  onTap: widget.onTapAddToCartFn,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.h),
                                      color: ConstantColors.lightRed,
                                    ),
                                    height: widget.addCartBtnHeight ?? 21.h,
                                    width: widget.addCartBtnWidth ?? 58.w,
                                    child: Center(
                                        child: BuildText(
                                      text: AppLocalizations.of(context)!
                                          .add_to_Cart,
                                      txtClr: ConstantColors.white,
                                      fontFamily:
                                          ConstantStrings.kAppFontPoppins,
                                      fontSize: 8.sp,
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        addH(2.h),
                      ],
                    ),
                  ),
                ),
                // Favorite Icon
                if (widget.pModel.variants.edges[0].node.availableForSale)
                  Positioned(
                    top: 10.h,
                    right: 10.w,
                    child: InkWell(
                      onTap: () => {
                        setState(
                          () => isFavorite = !isFavorite,
                        ),
                        wishlistModel = WishlistModel(
                          title: widget.pModel.title,
                          status: '',
                          image: widget.pModel.images.edges[0].node.originalSrc,
                          price: '10',
                          //'${double.parse(widget.pModel.variants.edges[0].node.priceV2.amount.toString()) * widget.exchangeRate}',
                          stock: '',
                          isFavorite: true,
                          adminGraphQlapiId:
                              widget.pModel.variants.edges[0].node.id,
                          quantity: 1,
                        ),
                        objectBox.insertWishlist(wishlistModel),
                      },
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: ConstantColors.grayBlack,
                        size: 15.w,
                      ),
                    ),
                  ),
                //for off image
                if (widget.pModel.variants.edges[0].node.compareAtPriceV2.amount
                        .isNotEmpty &&
                    widget.pModel.variants.edges[0].node.compareAtPriceV2.amount
                        .isNotEmpty)
                  Positioned(
                    top: 15.h,
                    left: 10.w,
                    child: InkWell(
                      onTap: () {},
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: widget.offHeight ?? 25.h,
                            width: widget.offWidth ?? 25.w,
                            child: Image.asset(
                              'assets/images/off_bg.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          Center(
                              child: Text(
                            '${AppLocalizations.of(context)!.off}\n${value.format(((double.parse(widget.pModel.variants.edges[0].node.compareAtPriceV2.amount.toString()) - double.parse(
                                  widget.pModel.variants.edges[0].node.priceV2
                                      .amount
                                      .toString(),
                                )) / double.parse(widget.pModel.variants.edges[0].node.compareAtPriceV2.amount.toString()) * 100))}%',
                            style: TextStyle(
                              fontSize: 8.sp,
                              color: ConstantColors.white,
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
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
        height: h ?? 20.h,
        width: w ?? 40.w,
        fit: BoxFit.cover,
      ),
    );
  }
}
