import 'package:alhafidh/constants/color.dart';
import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/helper/helper.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatingItem extends StatelessWidget {
  final String name, subTxt, date;
  final bool dividerFlag;
  final double totalRating;

  const RatingItem({
    Key? key,
    required this.name,
    required this.subTxt,
    required this.date,
    required this.dividerFlag,
    required this.totalRating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // adding some properties
            showModalBottomSheet(
              isScrollControlled: true,

              context: context,
              // color is applied to main screen when modal bottom screen is displayed
              barrierColor: Colors.black.withOpacity(0.5),
              //background color for modal bottom screen
              backgroundColor: Colors.white,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              //elevates modal bottom screen
              elevation: 10,
              // gives rounded corner to modal bottom screen
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),

              builder: (BuildContext context) {
                // UDE : SizedBox instead of Container for whitespaces
                return SizedBox(
                  height: 300.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        addH(20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RatingBar.builder(
                              initialRating: totalRating,
                              minRating: 1,
                              allowHalfRating: true,
                              itemSize: 30,
                              unratedColor: ConstantColors.lightRed,
                              itemBuilder: (_, value) {
                                return Icon(
                                  value < totalRating
                                      ? Icons.star
                                      : Icons.star_outline,
                                  color: ConstantColors.lightRed,
                                );
                              },
                              onRatingUpdate: (value) {},
                            ),
                            InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Icon(
                                  Icons.dangerous_outlined,
                                  color: ConstantColors.lightRed,
                                )),
                          ],
                        ),
                        addH(10.h),
                        Text(
                          '$name - $date',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade900,
                            fontFamily: ConstantStrings.kFontFamily,
                          ),
                        ),
                        addH(10.h),
                        SingleChildScrollView(
                          child: AutoSizeText(
                            subTxt,
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.grey.shade800,
                              fontFamily: ConstantStrings.kFontFamily,
                            ),
                          ),
                        ),
                        /*Text(
                          subTxt,
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.grey.shade700,
                            fontFamily: ConstantStrings.kFontFamily,
                          ),
                        )*/
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 230.w,
                    child: Text(
                      '$name - $date',
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade900,
                        fontFamily: ConstantStrings.kFontFamily,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200.w,
                    child: Text(
                      subTxt,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.grey.shade800,
                        fontFamily: ConstantStrings.kFontFamily,
                      ),
                    ),
                  )
                ],
              ),
              Center(
                child: RatingBar.builder(
                  initialRating: totalRating,
                  minRating: 1,
                  allowHalfRating: true,
                  itemSize: 20,
                  unratedColor: ConstantColors.lightRed,
                  itemBuilder: (_, value) {
                    return Icon(
                      value < totalRating ? Icons.star : Icons.star_outline,
                      color: ConstantColors.lightRed,
                    );
                  },
                  onRatingUpdate: (value) {},
                ),
              ),
            ],
          ),
        ),
        if (dividerFlag)
          Divider(
            thickness: 1,
            color: Colors.grey.shade300,
          ),
      ],
    );
  }
}
