import 'package:alhafidh/constants/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterTitle extends StatelessWidget {
  final String title;
  String? suffixTxt;
  IconData? suffixIcon;
  double? suffixIconSize;
  FilterTitle({
    Key? key,
    required this.title,
    this.suffixTxt,
    this.suffixIcon,
    this.suffixIconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontFamily: ConstantStrings.kFontFamily,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        Text(
          suffixTxt ?? '',
          style: TextStyle(
            fontSize: 16.sp,
            fontFamily: ConstantStrings.kFontFamily,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}
