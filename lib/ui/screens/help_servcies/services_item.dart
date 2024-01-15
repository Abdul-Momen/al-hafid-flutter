import 'package:alhafidh/constants/color.dart';
import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/helper/helper.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServicesItem extends StatelessWidget {
  final String img;
  final String name;
  final String dtls;
  final String btnTxt;
  final VoidCallback onclik;

  const ServicesItem({
    Key? key,
    required this.img,
    required this.name,
    required this.dtls,
    required this.btnTxt,
    required this.onclik,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: ConstantColors.lightGray,
                  width: 1,
                ),
              ),
              width: 40.w,
              height: 40.h,
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Image.asset(
                  img,
                ),
              ),
            ),
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 13.sp,
              fontFamily: ConstantStrings.kFontFamily,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
           dtls ,
            style: TextStyle(
                fontSize: 10.sp,
                fontFamily: ConstantStrings.kFontFamily,
                fontWeight: FontWeight.normal,
                color: Colors.grey.shade700),
          ),
          addH(5.h),
          if(btnTxt!='')
            InkWell(
            onTap: onclik,
            child: Text(
             btnTxt,
              style: TextStyle(
                  fontSize: 11.sp,
                  fontFamily: ConstantStrings.kFontFamily,
                  fontWeight: FontWeight.bold,
                  color: ConstantColors.lightRed),
            ),
          ),
        ],
      ),
    );
  }
}
