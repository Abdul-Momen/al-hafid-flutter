

import 'package:alhafidh/helper/helper.dart';
import 'package:alhafidh/states/controller/home.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/ui/screens/home/home.dart';
import 'package:alhafidh/ui/widgets/custom_img.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:onboarding/onboarding.dart';
import '../../../constants/color.dart';
import '../../../constants/string.dart';

class OnboardingScreen extends StatefulWidget {
  static String routeName = '/onbording';

  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final HomeController _homeCon = Get.find<HomeController>();

  late Material materialButton;
  late int index;

  //init state
  @override
  void initState() {
    super.initState();
    if (_homeCon.firstImage == null) {
      _homeCon.getOnboardFristImage();
      _homeCon.getOnboardSecondImage();
    }
    materialButton = _skipButton();
    index = 0;
  }

  //for skip button
  Material _skipButton({void Function(int)? setIndex}) {
    return Material(
      color: ConstantColors.lightRed,
      child: InkWell(
        borderRadius: defaultSkipButtonBorderRadius,
        onTap: () {
          if (setIndex != null) {
            index = 1;
            setIndex(1);
          }
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFFF05A22),
              style: BorderStyle.solid,
              width: 1.0,
            ),
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: const Padding(
            padding: defaultProceedButtonPadding,
            child: Text(
              'Skip',
              style: defaultProceedButtonTextStyle,
            ),
          ),
        ),
      ),
    );
  }

  //for home button
  Material get _signupButton {
    return Material(
      color: ConstantColors.lightRed,
      child: InkWell(
        borderRadius: defaultProceedButtonBorderRadius,
        onTap: () {
          Preference.setIsFristOnbordingFlag(true);
          Get.offAllNamed(
            HomeScreen.routeName,
            arguments: [
              '0',
            ],
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: const Padding(
            padding: defaultProceedButtonPadding,
            child: Text(
              'Home',
              style: defaultProceedButtonTextStyle,
            ),
          ),
        ),
      ),
    );
  }

  //build fun
  @override
  Widget build(BuildContext context) {
    //boarding pages
    final onboardingPagesList = [
      //page one
      PageModel(
        widget: DecoratedBox(
          decoration: BoxDecoration(
            color: ConstantColors.white,
            border: Border.all(
              width: 0.0,
              color: Colors.white,
            ),
          ),
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Center(
              child: Obx(() {
                if (_homeCon.onBoardingFirstLoading.value) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 300.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  if (_homeCon.firstImage!.asset.publicUrl.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 300.0),
                        child: Text(ConstantStrings.kWentWrong),
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: 640.h,
                      width: 375.w,
                      child: Column(
                        children: [
                          CustomImg(
                            imgUrl: _homeCon.firstImage!.asset.publicUrl,
                            imgWidth: 350.w,
                            imgHeight: 600.h,
                          ),
 Padding(
                            padding: EdgeInsets.symmetric(horizontal: 45.0.w),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Lorem ipsum dolor sit amet consectetur.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: ConstantStrings.kAppRobotoBold,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.0.w, vertical: 20.0.h),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Blandit netus aliquam est adipiscing ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: ConstantStrings.kAppRobotoFont,
                                  fontSize: 14.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),

                        ],
                      ),
                    );
                  }
                }
              }),
            ),
          ),
        ),
      ),

      //page two
      PageModel(
        widget: DecoratedBox(
          decoration: BoxDecoration(
            color: ConstantColors.white,
            border: Border.all(
              width: 0.0,
              color: Colors.white,
            ),
          ),
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Center(
              child: Obx(() {
                if (_homeCon.onBoardingSecondLoading.value) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 300.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  if (_homeCon.secondImage!.asset.publicUrl.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 300.0),
                        child: Text(ConstantStrings.kWentWrong),
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: 740.h,
                      width: 375.w,
                      child: Column(
                        children: [
                          CustomImg(
                            imgUrl: _homeCon.secondImage!.asset.publicUrl,
                            imgWidth: 350.w,
                            imgHeight: 700.h,
                          ),
                          Padding(
                    padding: EdgeInsets.symmetric(horizontal: 45.0.w),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Lorem ipsum dolor sit amet consectetur.',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: ConstantStrings.kAppRobotoBold,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 15.0.w, vertical: 20.0.h),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Blandit netus aliquam est adipiscing ',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: ConstantStrings.kAppRobotoFont,
                          fontSize: 14.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                        ],
                      ),
                    );
                  }
                }
              }),
            ),
          ),
        ),
      ),
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Onboarding(
          pages: onboardingPagesList,
          onPageChange: (int pageIndex) {
            index = pageIndex;
          },
          startPageIndex: 0,
          footerBuilder: (context, dragDistance, pagesLength, setIndex) {
            return SizedBox(
              height: 170.h,
              width: 375.w,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage('assets/images/on_bording_footer.png'),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: EdgeInsets.all(65.0.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIndicator(
                        netDragPercent: dragDistance,
                        pagesLength: pagesLength,
                        indicator: Indicator(
                          indicatorDesign: IndicatorDesign.line(
                            lineDesign: LineDesign(
                              lineType: DesignType.line_uniform,
                            ),
                          ),
                        ),
                      ),
                      index == pagesLength - 1
                          ? _signupButton
                          : _skipButton(setIndex: setIndex)
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
