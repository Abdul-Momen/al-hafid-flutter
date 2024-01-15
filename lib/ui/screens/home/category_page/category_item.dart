import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/color.dart';

class CategoryItem extends StatefulWidget {
  final int indexValue;
  final VoidCallback onTapFn;
  final String categoryName;
  final String categoryImage;
  double? totalWidth;
  double? txtSize;
  FontWeight? txtWeight;

  CategoryItem({
    Key? key,
    required this.indexValue,
    required this.onTapFn,
    required this.categoryName,
    required this.categoryImage,
    this.totalWidth,
    this.txtSize,
    this.txtWeight,
  }) : super(key: key);

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: widget.onTapFn,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                color: ConstantColors.lightGray,
                width: 1,
              ),),
          height:30.h,
          width: 91.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /*   SizedBox(
                width: 70.w,
                height: 60.h,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/category_bg.svg',
                      color: indexValue % 2 != 0 ? ConstantColors.lightRed : null,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CustomImg(
                        imgUrl: categoryImage,
                        imgFit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              addH(5.h),*/
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3.0),
                child: Text(
                  Preference.getIsArabicFlag()?ConstantStrings.menuItemList[0][widget.categoryName]??widget.categoryName:widget.categoryName,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontFamily: ConstantStrings.kAppRobotoFont,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
