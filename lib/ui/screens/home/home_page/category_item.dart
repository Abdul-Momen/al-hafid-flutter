import 'package:alhafidh/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/string.dart';

class CategoryItem extends StatelessWidget {
  final String img;
  final String name;
  final VoidCallback onTapFn;

  const CategoryItem({
    Key? key,
    required this.img,
    required this.name,
    required this.onTapFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        height: 121.h,
        width: 90.w,
        decoration: BoxDecoration(
          border: Border.all(
            color: ConstantColors.lightGray, // red as border color
          ),
        ),
        child: InkWell(
          onTap: onTapFn,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(3.0.h),
                child: Image.asset(
                  img,
                  height: 50.h,
                ),
              ),
              Center(
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: ConstantStrings.kAppRobotoFont,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}