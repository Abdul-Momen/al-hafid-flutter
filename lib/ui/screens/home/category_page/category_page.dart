import 'package:alhafidh/constants/color.dart';
import 'package:alhafidh/helper/helper.dart';
import 'package:alhafidh/states/controller/home.dart';
import 'package:alhafidh/states/controller/products.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/ui/screens/home/category_page/category_item.dart';
import 'package:alhafidh/ui/screens/products/products.dart';
import 'package:alhafidh/ui/screens/search_screen/search.dart';
import 'package:alhafidh/ui/widgets/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../constants/string.dart';
import '../../../widgets/custom_search_box.dart';

class CategoriesPage extends StatefulWidget {
  final VoidCallback backFn;

  const CategoriesPage({Key? key, required this.backFn}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final HomeController _homeCon = Get.find<HomeController>();
  int _selectedCategory = 0;

  final ProductsController _productsCon = Get.find<ProductsController>();
  late TextEditingController searchCon = TextEditingController();

  bool _isViible = false;

  @override
  void initState() {
    _productsCon.getAllCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Obx(() {
            if (_productsCon.categoryLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (_productsCon.categoryList.isEmpty) {
                return Center(
                  child: Text(ConstantStrings.kWentWrong),
                );
              } else {
                return Column(
                  children: [
                    addH(16.h),
                    //search
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border:
                                Border.all(color: ConstantColors.lightGray)),
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
                                    hintText: AppLocalizations.of(context)!
                                        .search_txt,
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
                    //title txt
                    CustomTitle(
                      title: AppLocalizations.of(context)!.categories,
                      onBackTapFn: widget.backFn,
                      isBack: true,
                    ),
                    // Categories
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Parent Category
                        Container(
                          width: 100.w,
                          height: 490.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.w),
                            color: ConstantColors.white,
                          ),
                          child: ListView.builder(
                            itemCount: _productsCon.categoryList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () => setState(() {
                                  _selectedCategory = index;
                                  /* _homeCon.getSubCategories(
                              _homeCon.categoryList[index].categoryId,
                            );*/
                                  if (index == 5) {
                                    //go products with collection id
                                    Get.toNamed(ProductsScreen.routeName,
                                        arguments: [
                                          '195594190907',
                                          AppLocalizations.of(context)!
                                              .special_Offer
                                        ]);
                                  }
                                }),
                                child: ClipPath(
                                  clipper: ShapeBorderClipper(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: _selectedCategory == index
                                          ? BorderRadius.only(
                                              topLeft: Radius.circular(5.w),
                                              bottomLeft: Radius.circular(5.w),
                                            )
                                          : BorderRadius.zero,
                                    ),
                                  ),
                                  child: Container(
                                    height: 50.h,
                                    padding: EdgeInsets.symmetric(
                                      horizontal:
                                          _selectedCategory == index ? 0 : 1,
                                    ),
                                    decoration: BoxDecoration(
                                      color: _selectedCategory == index
                                          ? Colors.white
                                          : Colors.transparent,
                                      border: Border(
                                        bottom: BorderSide(
                                          color: _selectedCategory == index
                                              ? ConstantColors.lightRed
                                              : ConstantColors.whiteGray,
                                          width: 1.w,
                                        ),
                                        top: BorderSide(
                                          color: _selectedCategory == index
                                              ? ConstantColors.lightRed
                                              : index != 0
                                                  ? Colors.transparent
                                                  : ConstantColors.whiteGray,
                                          width: 1.w,
                                        ),
                                        left: BorderSide(
                                          color: _selectedCategory == index
                                              ? ConstantColors.lightRed
                                              : ConstantColors.whiteGray,
                                          width: 1.w,
                                        ),
                                        right: BorderSide(
                                          color: _selectedCategory == index
                                              ? Colors.white
                                              : ConstantColors.whiteGray,
                                          width: 1.w,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        Preference.getIsArabicFlag()
                                            ? ConstantStrings.menuItemList[0][
                                                    _productsCon
                                                        .categoryList[index]
                                                        .title] ??
                                                _productsCon
                                                    .categoryList[index].title
                                            : _productsCon
                                                .categoryList[index].title,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily:
                                              ConstantStrings.kAppRobotoFont,
                                          fontWeight: _selectedCategory == index
                                              ? FontWeight.w600
                                              : FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        addW(13.w),
                        // Sub Categories
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 250.w,
                              height: 490.h,
                              child: Obx(() {
                                if (_productsCon.categoryLoading.value) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  if (_productsCon
                                      .categoryList[_selectedCategory]
                                      .items
                                      .isEmpty) {
                                    return Center(
                                      child: Text(
                                        AppLocalizations.of(context)!
                                            .sub_ca_nt_fnd,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily:
                                              ConstantStrings.kFontFamily,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    );
                                  } else {
                                    return ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: _productsCon
                                            .categoryList[_selectedCategory]
                                            .items
                                            .length,
                                        itemBuilder:
                                            (BuildContext context, int indexT) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              addH(15.h),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      print(_productsCon
                                                          .categoryList[
                                                              _selectedCategory]
                                                          .items[indexT]
                                                          .resourceId
                                                          .replaceAll(
                                                              RegExp(r'[^0-9]'),
                                                              '')
                                                          .toString());

                                                      //parce id
                                                      Get.toNamed(
                                                        ProductsScreen
                                                            .routeName,
                                                        arguments: [
                                                          _productsCon
                                                              .categoryList[
                                                                  _selectedCategory]
                                                              .items[indexT]
                                                              .resourceId
                                                              .replaceAll(
                                                                  RegExp(
                                                                      r'[^0-9]'),
                                                                  ''),
                                                          _productsCon
                                                              .categoryList[
                                                                  _selectedCategory]
                                                              .items[indexT]
                                                              .title
                                                        ],
                                                      );
                                                    },
                                                    child: Text(
                                                      Preference
                                                              .getIsArabicFlag()
                                                          ? ConstantStrings
                                                                      .menuItemList[0]
                                                                  [_productsCon
                                                                      .categoryList[
                                                                          _selectedCategory]
                                                                      .items[
                                                                          indexT]
                                                                      .title] ??
                                                              _productsCon
                                                                  .categoryList[
                                                                      _selectedCategory]
                                                                  .items[indexT]
                                                                  .title
                                                          : _productsCon
                                                              .categoryList[
                                                                  _selectedCategory]
                                                              .items[indexT]
                                                              .title,
                                                      style: TextStyle(
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            ConstantStrings
                                                                .kFontFamily,
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      if (_productsCon
                                                          .categoryList[
                                                              _selectedCategory]
                                                          .items[indexT]
                                                          .items
                                                          .isEmpty) {
                                                        //when is empty

                                                        print("print p id  >" +
                                                            _productsCon
                                                                .categoryList[
                                                                    _selectedCategory]
                                                                .items[indexT]
                                                                .resourceId
                                                                .replaceAll(
                                                                    RegExp(
                                                                        r'[^0-9]'),
                                                                    '')
                                                                .toString());

                                                        //parce id
                                                        Get.toNamed(
                                                          ProductsScreen
                                                              .routeName,
                                                          arguments: [
                                                            _productsCon
                                                                .categoryList[
                                                                    _selectedCategory]
                                                                .items[indexT]
                                                                .resourceId
                                                                .replaceAll(
                                                                    RegExp(
                                                                        r'[^0-9]'),
                                                                    ''),
                                                            _productsCon
                                                                .categoryList[
                                                                    _selectedCategory]
                                                                .items[indexT]
                                                                .title
                                                          ],
                                                        );
                                                      } else {
                                                        if (_productsCon
                                                            .categoryList[
                                                                _selectedCategory]
                                                            .items[indexT]
                                                            .isVisible) {
                                                          setState(() {
                                                            _productsCon
                                                                .categoryList[
                                                                    _selectedCategory]
                                                                .items[indexT]
                                                                .isVisible = false;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            _productsCon
                                                                .categoryList[
                                                                    _selectedCategory]
                                                                .items[indexT]
                                                                .isVisible = true;
                                                          });
                                                        }
                                                      }
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 15.0),
                                                      child: _productsCon
                                                              .categoryList[
                                                                  _selectedCategory]
                                                              .items[indexT]
                                                              .isVisible
                                                          ? const Icon(
                                                              Icons
                                                                  .keyboard_arrow_down_outlined,
                                                            )
                                                          : const Icon(
                                                              Icons
                                                                  .keyboard_arrow_right_outlined,
                                                            ),
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              //sub sub category
                                              //cheek item
                                              _productsCon
                                                      .categoryList[
                                                          _selectedCategory]
                                                      .items[indexT]
                                                      .isVisible
                                                  ? Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        addH(10.h),
                                                        if (_productsCon
                                                            .categoryList[
                                                                _selectedCategory]
                                                            .items[indexT]
                                                            .items
                                                            .isNotEmpty)
                                                          GridView.builder(
                                                            shrinkWrap: true,
                                                            physics:
                                                                const NeverScrollableScrollPhysics(),
                                                            itemCount: _productsCon
                                                                .categoryList[
                                                                    _selectedCategory]
                                                                .items[indexT]
                                                                .items
                                                                .length,
                                                            gridDelegate:
                                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                              crossAxisCount: 2,
                                                              crossAxisSpacing:
                                                                  9.h,
                                                              childAspectRatio:
                                                                  Preference
                                                                          .getIsArabicFlag()
                                                                      ? 2.30.h
                                                                      : 2.50.h,
                                                            ),
                                                            itemBuilder:
                                                                (_, index) {
                                                              return CategoryItem(
                                                                indexValue:
                                                                    index,
                                                                onTapFn: () {
                                                                  //parce id sub sub
                                                                  Get.toNamed(
                                                                    ProductsScreen
                                                                        .routeName,
                                                                    arguments: [
                                                                      _productsCon
                                                                          .categoryList[
                                                                              _selectedCategory]
                                                                          .items[
                                                                              indexT]
                                                                          .items[
                                                                              index]
                                                                          .resourceId
                                                                          .replaceAll(
                                                                              RegExp(r'[^0-9]'),
                                                                              ''),
                                                                      _productsCon
                                                                          .categoryList[
                                                                              _selectedCategory]
                                                                          .items[
                                                                              indexT]
                                                                          .items[
                                                                              index]
                                                                          .title
                                                                    ],
                                                                  );
                                                                },
                                                                categoryName: _productsCon
                                                                    .categoryList[
                                                                        _selectedCategory]
                                                                    .items[
                                                                        indexT]
                                                                    .items[
                                                                        index]
                                                                    .title,
                                                                categoryImage:
                                                                    "https://rukminim1.flixcart.com/image/312/312/xif0q/refrigerator-new/o/z/x/rdc215bfbexb-basg-140-4-2022-42-voltas-beko-67-8-60-original-imagkf3wgjpuwzgg.jpeg?q=70",
                                                                totalWidth:
                                                                    60.w,
                                                                txtSize: 10.sp,
                                                                txtWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              );
                                                            },
                                                          ),

                                                        /* //when is empty
                                                        if (_productsCon
                                                            .categoryList[
                                                                _selectedCategory]
                                                            .items[indexT]
                                                            .items
                                                            .isEmpty)
                                                        Center(
                                                            child: Text(
                                                          AppLocalizations.of(
                                                                  context)!
                                                              .cat_empty,
                                                        )),*/
                                                      ],
                                                    )
                                                  : Container(),
                                              addH(10.h),
                                              Divider(
                                                height: 1.h,
                                                color: ConstantColors.lightGray,
                                              )
                                            ],
                                          );
                                        });
                                  }
                                }
                              }),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                );
              }
            }
          }),
        ),
      ),
    );
  }
}
