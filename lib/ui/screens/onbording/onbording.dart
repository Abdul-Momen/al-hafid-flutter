import 'package:alhafidh/constants/color.dart';
import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/helper/helper.dart';
import 'package:alhafidh/states/controller/home.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/ui/screens/home/home.dart';
import 'package:alhafidh/ui/widgets/custom_img.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Onbording extends StatefulWidget {
  static String routeName = '/onbording';

  const Onbording({super.key});

  @override
  State<Onbording> createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  PageController _pageController = PageController();

  final HomeController _homeCon = Get.find<HomeController>();

  @override
  void initState() {
    // TODO: implement initState
    if (_homeCon.firstImage == null) {
      _homeCon.getOnboardFristImage();
    }
    if (_homeCon.secondImage == null) {
      _homeCon.getOnboardSecondImage();
    }
    super.initState();
  }

  int _currentIndex = 0;
  final _totalDots = 2;
  double _currentPosition = 0.0;

  double _validPosition(double position) {
    if (position >= _totalDots) return 0;
    if (position < 0) return _totalDots - 1.0;
    return position;
  }

  @override
  Widget build(BuildContext context) {
    String getPrettyCurrPosition() {
      return (_currentIndex + 1.0).toStringAsPrecision(3);
    }

    void _updatePosition(double position) {
      setState(() => _currentPosition = _validPosition(position));
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white,
              child: _currentIndex == 0
                  ? Obx(() {
                      if (_homeCon.onBoardingFirstLoading.value) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else {
                        if (_homeCon.firstImage!.asset.publicUrl.isEmpty) {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(ConstantStrings.kWentWrong),
                            ),
                          );
                        } else {
                          return SizedBox(
                            height: 1040.h,
                            width: 375.w,
                            child: CustomImg(
                              imgUrl: _homeCon.firstImage!.asset.publicUrl,
                              imgWidth: 350.w,
                              imgHeight: 1000.h,
                            ),
                          );
                        }
                      }
                    })
                  : Obx(() {
                      if (_homeCon.onBoardingSecondLoading.value) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 30.0),
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else {
                        if (_homeCon.secondImage!.asset.publicUrl.isEmpty) {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: Text(ConstantStrings.kWentWrong),
                            ),
                          );
                        } else {
                          return SizedBox(
                            height: double.infinity,
                            width: double.infinity,
                            child: CustomImg(
                              imgUrl: _homeCon.secondImage!.asset.publicUrl,
                              imgWidth: double.infinity.w,
                              imgHeight: double.infinity,
                              imgFit: BoxFit.fill,
                            ),
                          );
                        }
                      }
                    }),
            ),
            Positioned(
              bottom: 20,
              right: 10,
              left: 10,
              child: Row(
                children: [
                  if(_currentIndex == 0)
                    SizedBox(width: 95.w),
                  if(_currentIndex == 1)
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          if (_currentIndex == 0) {
                            return;
                          } else {
                            _currentIndex--;
                            _currentPosition--;
                          }
                        });
                      },
                      child: Container(
                        width: 80.w,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            AppLocalizations.of(context)!.previous,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ConstantColors.lightRed,
                              fontFamily: ConstantStrings.kAppRobotoBold,
                              fontSize: 15.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  DotsIndicator(
                    ///for dynamic
                    dotsCount: 2,
                    position: _currentPosition,
                    decorator: DotsDecorator(
                      color: ConstantColors.lightRed,
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 9.0),
                      activeColor: ConstantColors.lightRed,
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {});

                        if (_currentIndex == 1) {
                          return;
                        } else {
                          _currentIndex++;
                        }
                        if (_currentPosition == 1) {
                          return;
                        } else {
                          _currentPosition++;
                        }
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                          ),
                        ),
                        height: 60,
                        child: Align(
                          alignment: Alignment.center,
                          child: _currentIndex == 1
                              ? InkWell(
                                  onTap: () {
                                    ///Preference.setIsFristOnbordingFlag(true);
                                    Get.offAllNamed(
                                      HomeScreen.routeName,
                                      arguments: [
                                        '0',
                                      ],
                                    );
                                  },
                                  child: Container(
                                    width: 80.w,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        AppLocalizations.of(context)!.home,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: ConstantColors.lightRed,
                                          fontFamily:
                                              ConstantStrings.kAppRobotoBold,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(
                                  width: 80.w,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      AppLocalizations.of(context)!.next,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: ConstantColors.lightRed,
                                        fontFamily:
                                            ConstantStrings.kAppRobotoBold,
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            addH(20.h),
          ],
        ),
      ),
    );
  }
}
