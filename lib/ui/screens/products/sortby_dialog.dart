import 'package:alhafidh/helper/helper.dart';
import 'package:alhafidh/states/controller/products.dart';
import 'package:alhafidh/ui/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SortByDialog extends StatefulWidget {
  //final List<dynamic>? sortByList;
  final ProductsController productsCon;
  final int collectionId;

  const SortByDialog({
    Key? key,
    // required this.sortByList,
    required this.productsCon,
    required this.collectionId,
  }) : super(key: key);

  @override
  State<SortByDialog> createState() => _SortByDialogState();
}

class _SortByDialogState extends State<SortByDialog> {
  List<String> sortByListID = [
    'best-selling',
    'manual',
    'price-ascending',
    'price-descending',
  ];

  int sortByIndex = 0;
  String sortTxt = '';

  @override
  Widget build(BuildContext context) {
    List<String> sortByList = [
      AppLocalizations.of(context)!.best_selling,
      AppLocalizations.of(context)!.featured,
      AppLocalizations.of(context)!.price_L_to_H,
      AppLocalizations.of(context)!.price_H_to_L,
    ];
    return AlertDialog(
      alignment: Alignment.bottomCenter,
      insetPadding: const EdgeInsets.all(0),
      titlePadding: EdgeInsets.symmetric(horizontal: 10.w),
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      content: Container(
        width: 428.w,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.r),
            topRight: Radius.circular(15.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            addH(10.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
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
                addW(20.w),
                Text(
                  AppLocalizations.of(context)!.sort_by.toUpperCase(),
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
            addH(15.h),
            Column(
              children: sortByList
                  .map(
                    (e) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          e,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),

                        // Radio button
                        Radio(
                          value: sortByList.indexOf(e),
                          groupValue: sortByIndex,
                          onChanged: (value) => setState(
                            () {
                              sortByIndex = value as int;
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
            Center(
              child: CustomBtn(
                onPressedFn: () {
                  setState(() {
                    widget.productsCon.getFilterAllProducts(
                        collectionId: widget.collectionId,
                        sortBy: sortByListID[sortByIndex]);
                    Get.back();
                  });
                },
                btnTxt: AppLocalizations.of(context)!.apply,
                btnSize: Size(185.w, 45.h),
              ),
            ),
          ],
        ),
      ),
    );
  }
}