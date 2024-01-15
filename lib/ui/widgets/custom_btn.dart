import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/color.dart';
import '../../constants/string.dart';
import '../../helper/helper.dart';

class CustomBtn extends StatelessWidget {
  final VoidCallback onPressedFn;
  final String btnTxt;
  double? txtSize;
  FontWeight? txtWeight;
  Size? btnSize;
  Color? btnColor;
  Color? txtColor;
  Color? btnBorderColor;
  String? btnIcon;
  CustomBtn({
    Key? key,
    required this.onPressedFn,
    required this.btnTxt,
    this.txtSize,
    this.txtWeight,
    this.btnSize,
    this.btnColor,
    this.txtColor,
    this.btnBorderColor,
    this.btnIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressedFn,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        fixedSize: MaterialStateProperty.all(
          btnSize ?? Size(255.w, 50.h),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          btnColor ?? ConstantColors.lightRed,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(
              color: btnBorderColor ?? ConstantColors.lightRed,
              width: 1.0,
            ),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (btnIcon != null)
            SvgPicture.asset(
              btnIcon!,
              fit: BoxFit.fill,
            ),
          if (btnIcon != null) addW(5.w),
          Text(
            btnTxt,
            style: TextStyle(
              color: txtColor,
              fontSize: txtSize ?? 15.sp,
              fontFamily: ConstantStrings.kAppRobotoFont,
              fontWeight: txtWeight ?? FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
