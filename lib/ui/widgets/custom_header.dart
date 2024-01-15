import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../helper/helper.dart';

class CustomHeader extends StatelessWidget {
  final String title;

  const CustomHeader({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // header
        SizedBox(
          height: 300.h,
          width: double.infinity,
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: 320.h,
                child: Image.asset(
                  'assets/images/header_bg.png',
                  fit: BoxFit.cover,
                ),
              ),
              if(Preference.getIsArabicFlag()!=true)
              Positioned(
                top: 30.h,
                left: 10.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: ()=>Get.back(),
                      child: SvgPicture.asset(
                        'assets/svg/back.svg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    addW(50.w),
                    Image.asset(
                      'assets/images/splash_logo.png',
                      width: 150.w,
                      height: 65.h,
                    ),
                  ],
                ),
              ),
              if(Preference.getIsArabicFlag()==true)
              Positioned(
                top: 30.h,
                right: 10.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: ()=>Get.back(),
                      child: SvgPicture.asset(
                        'assets/svg/back.svg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    addW(50.w),
                    Image.asset(
                      'assets/images/splash_logo.png',
                      width: 150.w,
                      height: 65.h,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 120.h,
                left: 120.w,
                child: Text(
                AppLocalizations.of(context)!.welcome,
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontFamily: ConstantStrings.kFontRobotoLight,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0.w),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24.sp,
              fontFamily: ConstantStrings.kAppRobotoBold,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
