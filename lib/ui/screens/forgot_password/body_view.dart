import 'package:alhafidh/constants/color.dart';
import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/helper/helper.dart';
import 'package:alhafidh/ui/widgets/custom_btn.dart';
import 'package:alhafidh/ui/widgets/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BodyView extends StatelessWidget {
  final String pageTitle;
  final String icon;
  final String txt;
  final Widget child;
  final VoidCallback btnFn;
  final String btnTxt;
  const BodyView({
    Key? key,
    required this.pageTitle,
    required this.icon,
    required this.txt,
    required this.child,
    required this.btnFn,
    required this.btnTxt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTitle(title: pageTitle),
        addH(42.h),
        // logo
        Container(
          height: 205.h,
          width: 205.w,
          decoration: BoxDecoration(
            color: ConstantColors.k0F98FF,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(
              icon,
              fit: BoxFit.fill,
            ),
          ),
        ),
        addH(40.h),
        Text(
          txt,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.sp,
            fontFamily: ConstantStrings.kFontFamily,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        addH(30.h),
        child,
        addH(40.h),
        // send custom btn
        if(btnTxt!='')
        CustomBtn(
          onPressedFn: btnFn,
          btnTxt: btnTxt,
          btnSize: Size(255.w, 45.h),
        ),
      ],
    );
  }
}
