import 'package:alhafidh/constants/color.dart';
import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/helper/helper.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/ui/screens/products/filter_title.dart';
import 'package:alhafidh/ui/widgets/custom_btn.dart';
import 'package:alhafidh/ui/widgets/custom_hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../states/controller/products.dart';

class FilterDialog extends StatefulWidget {
  final ProductsController productsCon;
  final int collectionId;

  const FilterDialog({
    Key? key,
    required this.productsCon,
    required this.collectionId,
  }) : super(key: key);

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  int selectedCategory = 0;
  int reviewIndex = 0;
  double start = 30.0;
  double end = 50.0;
  bool value = false;

  final List<String> _selectedVendors = [];
  final List<String> _selectedTvType = [];
  final List<String> _selectedDisplaySize = [];
  final List<String> _selectedStock = [];
  final List<String> _selectedProductType = [];
  final List<String> _selectedColor = [];
  final List<String> _selectedCfCapacity = [];


  final List<String> _selectedWashingType = [];
  final List<String> _selectedCoolingCapacity = [];
  final List<String> _selectedDoorStyle = [];
  final List<String> _selectedCompressorType = [];
  final List<String> _selectedCapacityTypeL = [];


  @override
  void initState() {
    widget.productsCon
        .getFilterAllOptionData(collectionId: widget.collectionId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.bottomCenter,
      insetPadding: const EdgeInsets.all(0),
      titlePadding: EdgeInsets.symmetric(horizontal: 10.w),
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      content: Container(
        height: 600.h,
        width: 428.w,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.r),
            topRight: Radius.circular(15.r),
          ),
        ),
        child: Obx(() {
          if (widget.productsCon.filterAllOptionDataLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (widget.productsCon.filterAllOptionResponseModel == null) {
              return Center(
                child: Text(
                  AppLocalizations.of(context)!.no_Data_Found,
                ),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // back, title, reset
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 18,
                              color: Colors.grey.shade800,
                            ),
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context)!.filter,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: ConstantStrings.kFontFamily,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        CustomBtn(
                          onPressedFn: () {
                            Get.back();
                          },
                          btnTxt: AppLocalizations.of(context)!.reset,
                          txtSize: 14.sp,
                          txtWeight: FontWeight.w600,
                          btnColor: Colors.white,
                          txtColor: Colors.black,
                          btnBorderColor: Colors.transparent,
                          btnSize: Size(95.w, 45.h),
                          btnIcon: 'assets/svgs/reset.svg',
                        ),
                      ],
                    ),
                    addH(10.h),

                    // category, view all
                    if (widget.productsCon.vendorList[0].values!.length >= 2)
                      Column(
                        children: [
                          FilterTitle(
                            title: AppLocalizations.of(context)!.vendor,
                          ),
                          addH(10.h),
                          //category list
                          SizedBox(
                            height: 20,
                            width: Get.width,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  widget.productsCon.vendorList[0].values!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  children: [
                                    Checkbox(
                                      activeColor: ConstantColors.lightRed,
                                      checkColor: Colors.white,
                                      value: widget.productsCon.vendorList[0]
                                              .values![index].isSelected ??
                                          false,
                                      onChanged: (bool? valueC) {
                                        setState(() {
                                          widget
                                              .productsCon
                                              .vendorList[0]
                                              .values![index]
                                              .isSelected = valueC!;
                                          if (widget.productsCon.vendorList[0]
                                                  .values![index].isSelected ==
                                              true) {
                                            _selectedVendors.add(widget
                                                .productsCon
                                                .vendorList[0]
                                                .values![index]
                                                .key
                                                .toString());
                                            //print(_selectedVendors);
                                          } else {
                                            _selectedVendors.remove(widget
                                                .productsCon
                                                .vendorList[0]
                                                .values![index]
                                                .key
                                                .toString());
                                           // print(_selectedVendors.toString());
                                          }
                                        });
                                      },
                                    ),
                                    Text(
                                      Preference.getIsArabicFlag()
                                          ? ConstantStrings.filterItemList[0][
                                                  widget.productsCon.vendorList[0]
                                                      .values![index].key
                                                      .toString()] ??
                                              widget.productsCon.vendorList[0]
                                                  .values![index].key
                                                  .toString()
                                          : widget.productsCon.vendorList[0]
                                              .values![index].key
                                              .toString(),
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: ConstantStrings.kFontFamily,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),

                    //product type
                    if (widget.productsCon.typeList[0].values!.length >= 2)
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          addH(15.h),
                          FilterTitle(
                            title: AppLocalizations.of(context)!.product_type,
                          ),
                          addH(10.h),
                          SizedBox(
                            height: 20,
                            width: Get.width,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  widget.productsCon.typeList[0].values!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  children: [
                                    Checkbox(
                                      activeColor: ConstantColors.lightRed,
                                      checkColor: Colors.white,
                                      value: widget.productsCon.typeList[0]
                                              .values![index].isSelected ??
                                          false,
                                      onChanged: (bool? valueC) {
                                        setState(() {
                                          widget
                                              .productsCon
                                              .typeList[0]
                                              .values![index]
                                              .isSelected = valueC!;

                                          if (widget.productsCon.typeList[0]
                                                  .values![index].isSelected ==
                                              true) {
                                            _selectedProductType.add(widget
                                                .productsCon
                                                .typeList[0]
                                                .values![index]
                                                .key
                                                .toString());
                                            //print(_selectedProductType);
                                          } else {
                                            _selectedProductType.remove(widget
                                                .productsCon
                                                .typeList[0]
                                                .values![index]
                                                .key
                                                .toString());
                                           // print(_selectedProductType.toString());
                                          }
                                        });
                                      },
                                    ),
                                    Text(
                                      Preference.getIsArabicFlag()
                                          ? ConstantStrings.filterItemList[0][
                                                  widget.productsCon.typeList[0]
                                                      .values![index].key
                                                      .toString()] ??
                                              widget.productsCon.typeList[0]
                                                  .values![index].key
                                                  .toString()
                                          : widget.productsCon.typeList[0]
                                              .values![index].key
                                              .toString(),
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: ConstantStrings.kFontFamily,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                          addH(15.h),
                        ],
                      ),

                    //Tv type
                    if (widget.productsCon.tvTypeList[0].values!.length >= 2)
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          addH(15.h),
                          FilterTitle(
                            title: AppLocalizations.of(context)!.tv_type,
                          ),
                          addH(10.h),
                          SizedBox(
                            height: 20,
                            width: Get.width,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  widget.productsCon.tvTypeList[0].values!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  children: [
                                    Checkbox(
                                      activeColor: ConstantColors.lightRed,
                                      checkColor: Colors.white,
                                      value: widget.productsCon.tvTypeList[0]
                                              .values![index].isSelected ??
                                          false,
                                      onChanged: (bool? valueC) {
                                        setState(() {
                                          widget
                                              .productsCon
                                              .tvTypeList[0]
                                              .values![index]
                                              .isSelected = valueC!;

                                          if (widget.productsCon.tvTypeList[0]
                                                  .values![index].isSelected ==
                                              true) {
                                            _selectedTvType.add(widget.productsCon
                                                .tvTypeList[0].values![index].key
                                                .toString());
                                            print(_selectedTvType);
                                          } else {
                                            _selectedTvType.remove(widget
                                                .productsCon
                                                .tvTypeList[0]
                                                .values![index]
                                                .key
                                                .toString());
                                            print(_selectedTvType.toString());
                                          }
                                        });
                                      },
                                    ),
                                    Text(
                                      Preference.getIsArabicFlag()
                                          ? ConstantStrings.filterItemList[0][
                                                  widget.productsCon.tvTypeList[0]
                                                      .values![index].key
                                                      .toString()] ??
                                              widget.productsCon.tvTypeList[0]
                                                  .values![index].key
                                                  .toString()
                                          : widget.productsCon.tvTypeList[0]
                                              .values![index].key
                                              .toString(),
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: ConstantStrings.kFontFamily,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                          addH(15.h),
                        ],
                      ),

                    //Display Sizes
                    if (widget.productsCon.displaySizeList[0].values!.length >= 2)
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FilterTitle(
                            title: AppLocalizations.of(context)!.display_sizes,
                          ),
                          addH(10.h),
                          SizedBox(
                            height: 20,
                            width: Get.width,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget
                                  .productsCon.displaySizeList[0].values!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  children: [
                                    Checkbox(
                                      activeColor: ConstantColors.lightRed,
                                      checkColor: Colors.white,
                                      value: widget.productsCon.displaySizeList[0]
                                              .values![index].isSelected ??
                                          false,
                                      onChanged: (bool? valueC) {
                                        setState(() {
                                          widget
                                              .productsCon
                                              .displaySizeList[0]
                                              .values![index]
                                              .isSelected = valueC!;

                                          if (widget
                                                  .productsCon
                                                  .displaySizeList[0]
                                                  .values![index]
                                                  .isSelected ==
                                              true) {
                                            _selectedDisplaySize.add(widget
                                                .productsCon
                                                .displaySizeList[0]
                                                .values![index]
                                                .key
                                                .toString());
                                            print(_selectedDisplaySize);
                                          } else {
                                            _selectedDisplaySize.remove(widget
                                                .productsCon
                                                .displaySizeList[0]
                                                .values![index]
                                                .key
                                                .toString());
                                            print(
                                                _selectedDisplaySize.toString());
                                          }
                                        });
                                      },
                                    ),
                                    Text(
                                      Preference.getIsArabicFlag()
                                          ? ConstantStrings.filterItemList[0][
                                                  widget
                                                      .productsCon
                                                      .displaySizeList[0]
                                                      .values![index]
                                                      .key
                                                      .toString()] ??
                                              widget
                                                  .productsCon
                                                  .displaySizeList[0]
                                                  .values![index]
                                                  .key
                                                  .toString()
                                          : widget.productsCon.displaySizeList[0]
                                              .values![index].key
                                              .toString(),
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: ConstantStrings.kFontFamily,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                          addH(15.h),
                        ],
                      ),


                    /*   //price
                    Column(
                      children: [
                        // price range
                        FilterTitle(
                          title: 'PRICE',
                          suffixTxt:
                          'AED ${start.toStringAsFixed(2)} - AED ${end.toStringAsFixed(2)}',
                        ),
                        addH(10.h),
                        // price range slider
                        SizedBox(
                          height: 50.h,
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RangeSlider(
                                values: RangeValues(start, end),
                                labels: RangeLabels(start.toString(), end.toString()),
                                onChanged: (value) {
                                  setState(() {
                                    start = value.start;
                                    end = value.end;
                                  });
                                },
                                activeColor: ConstantColors.lightRed,
                                inactiveColor: ConstantColors.lightGray,
                                min: 10.0,
                                max: 80.0,
                              ),
                            ],
                          ),
                        ),
                        addH(30.h),
                      ],
                    ),*/

                    //color filter
                    if (widget.productsCon.colorList[0].values!.length >= 2)
                      Column(
                        children: [
                          // Customer Review
                          FilterTitle(
                            title: AppLocalizations.of(context)!.color,
                          ),
                          addH(10.h),
                          SizedBox(
                            height: 36,
                            width: Get.width,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  widget.productsCon.colorList[0].values!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  children: [
                                    Checkbox(
                                      activeColor: ConstantColors.lightRed,
                                      checkColor: Colors.white,
                                      value: widget.productsCon.colorList[0]
                                              .values![index].isSelected ??
                                          false,
                                      onChanged: (bool? valueC) {
                                        setState(() {
                                          widget
                                              .productsCon
                                              .colorList[0]
                                              .values![index]
                                              .isSelected = valueC!;

                                          //save list
                                          if (widget.productsCon.colorList[0]
                                                  .values![index].isSelected ==
                                              true) {
                                            _selectedColor.add(widget
                                                .productsCon
                                                .colorList[0]
                                                .values![index]
                                                .isSelected
                                                .toString());
                                            print(_selectedColor);
                                          } else {
                                            //remove from list
                                            _selectedColor.remove(widget
                                                .productsCon
                                                .colorList[0]
                                                .values![index]
                                                .key
                                                .toString());
                                            print(_selectedColor.toString());
                                          }
                                        });
                                      },
                                    ),
                                    Container(
                                      height: 30.h,
                                      width: 30.w,
                                      margin: const EdgeInsets.only(right: 8.0),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: ConstantColors.whiteGray,
                                          style: BorderStyle.solid,
                                          width: 1.0,
                                        ),
                                        color: getColorFromHex(
                                            ConstantColors.colorList[0][widget
                                                .productsCon
                                                .colorList[0]
                                                .values![index]
                                                .key]),
                                        borderRadius: BorderRadius.circular(50.0),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          addH(15.h),
                        ],
                      ),

                    //cf Capacity
                    if (widget.productsCon.cfCapacityList[0].values!.length >= 2)
                      Column(
                        children: [
                          // Customer Review
                          FilterTitle(
                            title: AppLocalizations.of(context)!.cf_capacity,
                          ),
                          addH(10.h),
                          SizedBox(
                            height: 20,
                            width: Get.width,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget
                                  .productsCon.cfCapacityList[0].values!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  children: [
                                    Checkbox(
                                      activeColor: ConstantColors.lightRed,
                                      checkColor: Colors.white,
                                      value: widget.productsCon.cfCapacityList[0]
                                              .values![index].isSelected ??
                                          false,
                                      onChanged: (bool? valueC) {
                                        setState(() {
                                          widget
                                              .productsCon
                                              .cfCapacityList[0]
                                              .values![index]
                                              .isSelected = valueC!;

                                          //save list
                                          if (widget.productsCon.cfCapacityList[0]
                                                  .values![index].isSelected ==
                                              true) {
                                            _selectedCfCapacity.add(widget
                                                .productsCon
                                                .cfCapacityList[0]
                                                .values![index]
                                                .key
                                                .toString());
                                            print(_selectedCfCapacity);
                                          } else {
                                            //remove from list
                                            _selectedCfCapacity.remove(widget
                                                .productsCon
                                                .cfCapacityList[0]
                                                .values![index]
                                                .key
                                                .toString());
                                            print(_selectedCfCapacity.toString());
                                          }
                                        });
                                      },
                                    ),
                                    Text(
                                      Preference.getIsArabicFlag()
                                          ? ConstantStrings.filterItemList[0][
                                                  widget
                                                      .productsCon
                                                      .cfCapacityList[0]
                                                      .values![index]
                                                      .key
                                                      .toString()] ??
                                              widget.productsCon.cfCapacityList[0]
                                                  .values![index].key
                                                  .toString()
                                          : widget.productsCon.cfCapacityList[0]
                                              .values![index].key
                                              .toString(),
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: ConstantStrings.kFontFamily,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                          addH(15.h),
                        ],
                      ),


                    //dor style
                    if (widget.productsCon.doorStyleList[0].values!.length >= 2)
                      Column(
                        children: [
                          // Customer Review
                          FilterTitle(
                            title: AppLocalizations.of(context)!.door_style,
                          ),
                          addH(10.h),
                          SizedBox(
                            height: 20,
                            width: Get.width,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget
                                  .productsCon.doorStyleList[0].values!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  children: [
                                    Checkbox(
                                      activeColor: ConstantColors.lightRed,
                                      checkColor: Colors.white,
                                      value: widget.productsCon.doorStyleList[0]
                                              .values![index].isSelected ??
                                          false,
                                      onChanged: (bool? valueC) {
                                        setState(() {
                                          widget
                                              .productsCon
                                              .doorStyleList[0]
                                              .values![index]
                                              .isSelected = valueC!;

                                          //save list
                                          if (widget.productsCon.doorStyleList[0]
                                                  .values![index].isSelected ==
                                              true) {
                                            _selectedDoorStyle.add(widget
                                                .productsCon
                                                .doorStyleList[0]
                                                .values![index]
                                                .key
                                                .toString());
                                            print(_selectedDoorStyle);
                                          } else {
                                            //remove from list
                                            _selectedDoorStyle.remove(widget
                                                .productsCon
                                                .doorStyleList[0]
                                                .values![index]
                                                .key
                                                .toString());
                                            print(_selectedDoorStyle.toString());
                                          }
                                        });
                                      },
                                    ),
                                    Text(
                                      Preference.getIsArabicFlag()
                                          ? ConstantStrings.filterItemList[0][
                                                  widget
                                                      .productsCon
                                                      .doorStyleList[0]
                                                      .values![index]
                                                      .key
                                                      .toString()] ??
                                              widget.productsCon.doorStyleList[0]
                                                  .values![index].key
                                                  .toString()
                                          : widget.productsCon.doorStyleList[0]
                                              .values![index].key
                                              .toString(),
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: ConstantStrings.kFontFamily,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                          addH(15.h),
                        ],
                      ),

                   //COOLING CAPACITY
                    if (widget.productsCon.coolingCapacityList[0].values!.length >= 2)
                      Column(
                        children: [
                          // Customer Review
                          FilterTitle(
                            title: AppLocalizations.of(context)!.colling_capacity,

                          ),
                          addH(10.h),
                          SizedBox(
                            height: 20,
                            width: Get.width,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget
                                  .productsCon.coolingCapacityList[0].values!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  children: [
                                    Checkbox(
                                      activeColor: ConstantColors.lightRed,
                                      checkColor: Colors.white,
                                      value: widget.productsCon.coolingCapacityList[0]
                                              .values![index].isSelected ??
                                          false,
                                      onChanged: (bool? valueC) {
                                        setState(() {
                                          widget
                                              .productsCon
                                              .coolingCapacityList[0]
                                              .values![index]
                                              .isSelected = valueC!;

                                          //save list
                                          if (widget.productsCon.coolingCapacityList[0]
                                                  .values![index].isSelected ==
                                              true) {
                                            _selectedCoolingCapacity.add(widget
                                                .productsCon
                                                .coolingCapacityList[0]
                                                .values![index]
                                                .key
                                                .toString());
                                          } else {
                                            //remove from list
                                            _selectedCoolingCapacity.remove(widget
                                                .productsCon
                                                .coolingCapacityList[0]
                                                .values![index]
                                                .key
                                                .toString());
                                          }
                                        });
                                      },
                                    ),
                                    Text(
                                      Preference.getIsArabicFlag()
                                          ? ConstantStrings.filterItemList[0][
                                                  widget
                                                      .productsCon
                                                      .coolingCapacityList[0]
                                                      .values![index]
                                                      .key
                                                      .toString()] ??
                                              widget.productsCon.coolingCapacityList[0]
                                                  .values![index].key
                                                  .toString()
                                          : widget.productsCon.coolingCapacityList[0]
                                              .values![index].key
                                              .toString(),
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: ConstantStrings.kFontFamily,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                          addH(15.h),
                        ],
                      ),

/*                    //Capacity
                    if (widget.productsCon.capacityTypeList[0].values!.length >= 2)
                      Column(
                        children: [
                          // Customer Review
                          FilterTitle(
                          //  title: AppLocalizations.of(context)!.cf_capacity,
                            title: 'Capacity',
                          ),
                          addH(10.h),
                          SizedBox(
                            height: 20,
                            width: Get.width,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget
                                  .productsCon.capacityTypeList[0].values!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  children: [
                                    Checkbox(
                                      activeColor: ConstantColors.lightRed,
                                      checkColor: Colors.white,
                                      value: widget.productsCon.capacityTypeList[0]
                                              .values![index].isSelected ??
                                          false,
                                      onChanged: (bool? valueC) {
                                        setState(() {
                                          widget
                                              .productsCon
                                              .capacityTypeList[0]
                                              .values![index]
                                              .isSelected = valueC!;

                                          //save list
                                          if (widget.productsCon.capacityTypeList[0]
                                                  .values![index].isSelected ==
                                              true) {
                                            _selectedCapacityTypeL.add(widget
                                                .productsCon
                                                .capacityTypeList[0]
                                                .values![index]
                                                .key
                                                .toString());
                                          } else {
                                            //remove from list
                                            _selectedCapacityTypeL.remove(widget
                                                .productsCon
                                                .capacityTypeList[0]
                                                .values![index]
                                                .key
                                                .toString());
                                          }
                                        });
                                      },
                                    ),
                                    Text(
                                      Preference.getIsArabicFlag()
                                          ? ConstantStrings.filterItemList[0][
                                                  widget
                                                      .productsCon
                                                      .capacityTypeList[0]
                                                      .values![index]
                                                      .key
                                                      .toString()] ??
                                              widget.productsCon.capacityTypeList[0]
                                                  .values![index].key
                                                  .toString()
                                          : widget.productsCon.capacityTypeList[0]
                                              .values![index].key
                                              .toString(),
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: ConstantStrings.kFontFamily,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                          addH(15.h),
                        ],
                      ),*/


                  // WashingType
                    if (widget.productsCon.washingTypeList[0].values!.length >= 2)
                      Column(
                        children: [
                          // Customer Review
                          FilterTitle(
                            title: AppLocalizations.of(context)!.washing_type,
                          ),
                          addH(10.h),
                          SizedBox(
                            height: 20,
                            width: Get.width,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget
                                  .productsCon.washingTypeList[0].values!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  children: [
                                    Checkbox(
                                      activeColor: ConstantColors.lightRed,
                                      checkColor: Colors.white,
                                      value: widget.productsCon.washingTypeList[0]
                                              .values![index].isSelected ??
                                          false,
                                      onChanged: (bool? valueC) {
                                        setState(() {
                                          widget
                                              .productsCon
                                              .washingTypeList[0]
                                              .values![index]
                                              .isSelected = valueC!;

                                          //save list
                                          if (widget.productsCon.washingTypeList[0]
                                                  .values![index].isSelected ==
                                              true) {
                                            _selectedWashingType.add(widget
                                                .productsCon
                                                .washingTypeList[0]
                                                .values![index]
                                                .key
                                                .toString());
                                          } else {
                                            //remove from list
                                            _selectedWashingType.remove(widget
                                                .productsCon
                                                .washingTypeList[0]
                                                .values![index]
                                                .key
                                                .toString());
                                          }
                                        });
                                      },
                                    ),
                                    Text(
                                      Preference.getIsArabicFlag()
                                          ? ConstantStrings.filterItemList[0][
                                                  widget
                                                      .productsCon
                                                      .washingTypeList[0]
                                                      .values![index]
                                                      .key
                                                      .toString()] ??
                                              widget.productsCon.washingTypeList[0]
                                                  .values![index].key
                                                  .toString()
                                          : widget.productsCon.washingTypeList[0]
                                              .values![index].key
                                              .toString(),
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: ConstantStrings.kFontFamily,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                          addH(15.h),
                        ],
                      ),

                 //CompressorType
                    if (widget.productsCon.compressorTypeList[0].values!.length >= 2)
                      Column(
                        children: [
                          // Customer Review
                          FilterTitle(
                            title: AppLocalizations.of(context)!.compressorType,
                          ),
                          addH(10.h),
                          SizedBox(
                            height: 20,
                            width: Get.width,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget
                                  .productsCon.compressorTypeList[0].values!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  children: [
                                    Checkbox(
                                      activeColor: ConstantColors.lightRed,
                                      checkColor: Colors.white,
                                      value: widget.productsCon.compressorTypeList[0]
                                              .values![index].isSelected ??
                                          false,
                                      onChanged: (bool? valueC) {
                                        setState(() {
                                          widget
                                              .productsCon
                                              .compressorTypeList[0]
                                              .values![index]
                                              .isSelected = valueC!;

                                          //save list
                                          if (widget.productsCon.compressorTypeList[0]
                                                  .values![index].isSelected ==
                                              true) {
                                            _selectedCompressorType.add(widget
                                                .productsCon
                                                .compressorTypeList[0]
                                                .values![index]
                                                .key
                                                .toString());
                                          } else {
                                            //remove from list
                                            _selectedCompressorType.remove(widget
                                                .productsCon
                                                .compressorTypeList[0]
                                                .values![index]
                                                .key
                                                .toString());
                                          }
                                        });
                                      },
                                    ),
                                    Text(
                                      Preference.getIsArabicFlag()
                                          ? ConstantStrings.filterItemList[0][
                                                  widget
                                                      .productsCon
                                                      .compressorTypeList[0]
                                                      .values![index]
                                                      .key
                                                      .toString()] ??
                                              widget.productsCon.compressorTypeList[0]
                                                  .values![index].key
                                                  .toString()
                                          : widget.productsCon.compressorTypeList[0]
                                              .values![index].key
                                              .toString(),
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: ConstantStrings.kFontFamily,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                          addH(15.h),
                        ],
                      ),

                    // Stock
                    FilterTitle(
                      title: AppLocalizations.of(context)!.stock_status,
                    ),
                    addH(10.h),
                    SizedBox(
                      height: 36.h,
                      width: Get.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.productsCon.stockList[0].values!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              Checkbox(
                                activeColor: ConstantColors.lightRed,
                                checkColor: Colors.white,
                                value: widget.productsCon.stockList[0]
                                        .values![index].isSelected ??
                                    false,
                                onChanged: (bool? valueC) {
                                  setState(() {
                                    widget.productsCon.stockList[0].values![index]
                                        .isSelected = valueC!;

                                    //save list
                                    if (widget.productsCon.stockList[0]
                                            .values![index].isSelected ==
                                        true) {
                                      _selectedStock.add(widget.productsCon
                                          .stockList[0].values![index].key
                                          .toString());
                                      print(_selectedStock);
                                    } else {
                                      //remove from list
                                      _selectedStock.remove(widget.productsCon
                                          .stockList[0].values![index].key
                                          .toString());
                                      print(_selectedStock.toString());
                                    }
                                  });
                                },
                              ),
                              Text(
                                Preference.getIsArabicFlag()
                                    ? ConstantStrings.filterItemList[0][widget
                                            .productsCon
                                            .stockList[0]
                                            .values![index]
                                            .key
                                            .toString()] ??
                                        widget.productsCon.stockList[0]
                                            .values![index].key
                                            .toString()
                                    : widget.productsCon.stockList[0]
                                        .values![index].key
                                        .toString(),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: ConstantStrings.kFontFamily,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ),

                    addH(15.h),
                    // Apply Button
                    Center(
                      child: CustomBtn(
                        onPressedFn: () {
                          setState(() {
                            widget.productsCon.getFilterAllProducts(
                              collectionId: widget.collectionId,
                              vendorList: _selectedVendors,
                              selectedTvType: _selectedTvType,
                              selectedCfCapacity: _selectedCfCapacity,
                              selectedColor: _selectedColor,
                              selectedProductType: _selectedProductType,
                              selectedStock: _selectedStock,
                              selectedDisplaySize: _selectedDisplaySize,
                              selectedWashingType: _selectedWashingType,
                              selectedCompressorType: _selectedCompressorType,
                              selectedDoorStyle: _selectedDoorStyle,
                              selectedCoolingCapacity: _selectedCoolingCapacity,
                            );
                            Get.back();
                          });
                        },
                        btnTxt: AppLocalizations.of(context)!.apply,
                        btnSize: Size(Get.width, 52.h),
                      ),
                    ),
                  ],
                ),
              );
            }
          }
        }),
      ),
    );
  }
}
