
import 'package:alhafidh/constants/color.dart';
import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  String? suffixIcon;
  double? siffixSize;
  bool? isBack;
  VoidCallback? suffixOnTapFn;
  VoidCallback? onBackTapFn;
  CustomTitle({
    Key? key,
    required this.title,
    this.suffixIcon,
    this.suffixOnTapFn,
    this.onBackTapFn,
    this.siffixSize,
    this.isBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          addH(15.h),
          // Title
          Row(
            children: [
              if(isBack==true)
              InkWell(
                onTap: onBackTapFn,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: SizedBox(
                  width: 28.w,
                  height: 28.h,
                  child: const Center(
                    child: Icon(Icons.keyboard_backspace),
                  ),
                ),
              ),
              addW(5.w),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontFamily: ConstantStrings.kAppRobotoFont,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (suffixIcon != null) const Spacer(),
              if (suffixIcon != null)
                InkWell(
                  onTap: suffixOnTapFn,
                  splashColor: Colors.transparent,
                  highlightColor: ConstantColors.grayBlack,
                  child: SizedBox(
                    child: Center(
                      child: SvgPicture.asset(
                        suffixIcon!,
                        color: Colors.black,
                        width: siffixSize ?? 28.w,
                        height: siffixSize ?? 28.h,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          addH(15.h),
        ],
      ),
    );
  }
}
