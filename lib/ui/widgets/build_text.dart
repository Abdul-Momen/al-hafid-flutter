import 'package:alhafidh/constants/string.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildText extends StatelessWidget {
  final String text;
  Color? txtClr;
  int? maximumLines;
  double? fontSize;
  FontWeight? fontWeight;
  String? fontFamily;
  TextDecoration? textDecoration ;
  BuildText({
    Key? key,
    required this.text,
    this.txtClr,
    this.maximumLines,
    this.fontSize,
    this.fontFamily,
    this.textDecoration,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      maxLines: maximumLines,
      minFontSize: 8,
      textAlign: TextAlign.start,
      style: TextStyle(
        decoration:textDecoration??TextDecoration.none,
        overflow: TextOverflow.ellipsis,
        fontSize: fontSize ?? 10.sp,
        fontWeight: fontWeight??FontWeight.w500,
        fontFamily: fontFamily ?? ConstantStrings.kAppRobotoBold,
        color: txtClr,
      ),
    );
  }
}
