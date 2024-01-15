import 'package:alhafidh/constants/color.dart';
import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/helper/helper.dart';
import 'package:alhafidh/ui/screens/login/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomLoginCheck extends StatelessWidget {
  const CustomLoginCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.you_must_login,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: ConstantColors.lightRed,
            ),
          ),
          addH(10.h),
          // Sign Up Text
          RichText(
            text: TextSpan(
              text: AppLocalizations.of(context)!.already_have_Ac,
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: ConstantStrings.kAppRobotoFont,
                color: Colors.grey.shade600,
              ),
              children: [
                TextSpan(
                  text: AppLocalizations.of(context)!.logIn,
                  recognizer: TapGestureRecognizer()
                    ..onTap =
                        () => Get.toNamed(LoginScreen.routeName),
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 14.sp,
                    fontFamily: ConstantStrings.kAppRobotoFont,
                    color: ConstantColors.lightRed,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
