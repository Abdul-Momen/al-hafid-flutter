import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/helper/helper.dart';
import 'package:alhafidh/ui/screens/home/home.dart';
import 'package:alhafidh/ui/widgets/custom_app_bar.dart';
import 'package:alhafidh/ui/widgets/custom_btn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThankyouScreen extends StatelessWidget {
  static String routeName = '/thankyou';

  const ThankyouScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String invoiceNo = Get.arguments[0] ?? 0;
    return Scaffold(
      appBar: CustomAppbar(
        onBack: () {
          Get.offAndToNamed(HomeScreen.routeName);
        },
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/svg/check.svg',
                height: 80.h,
                width: 80.w,
              ),
              Text(
                AppLocalizations.of(context)!.thank_you,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 55.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: ConstantStrings.kAppRobotoFont,
                ),
              ),
              addH(40.h),
              // invoice number
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.order_num,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 14.sp,
                      fontFamily: ConstantStrings.kAppRobotoFont,
                    ),
                  ),
                  addW(5.w),
                  Text(
                    invoiceNo,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: ConstantStrings.kAppRobotoBold,
                    ),
                  ),
                ],
              ),
              addH(40.h),
              // track your order custom btn & continue shopping custom btn
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // CustomBtn(
                  //   onPressedFn: () {},
                  //   btnTxt: 'Track Your Order',
                  //   btnSize: Size(185.w, 45.h),
                  //   btnColor: Colors.white,
                  //   txtColor: Colors.black,
                  //   txtWeight: FontWeight.normal,
                  // ),
                  CustomBtn(
                    onPressedFn: () => Get.offAndToNamed(HomeScreen.routeName),
                    btnTxt: AppLocalizations.of(context)!.continue_shopping,
                    btnSize: Size(185.w, 45.h),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
