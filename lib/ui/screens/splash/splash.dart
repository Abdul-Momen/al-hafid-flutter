import 'package:alhafidh/constants/color.dart';
import 'package:alhafidh/states/controller/home.dart';
import 'package:alhafidh/states/controller/products.dart';
import 'package:alhafidh/ui/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../onbording/onbording.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/splash';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final HomeController _homeCon = Get.find<HomeController>();
  final ProductsController _productsCon = Get.find<ProductsController>();
  bool newUser = false;

  @override
  void initState() {
    super.initState();
    _productsCon.getExchangeRate();
    _homeCon.getOnboardFristImage();
    _homeCon.getOnboardSecondImage();
    navigating();
  }

  navigating() {
    //delay 2 seconds
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ConstantColors.lightRed,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() {
                if (_productsCon.exchangeLoading.value) {
                } else {
                  Future.delayed(
                    const Duration(seconds: 2),
                    //go home page
                    () {
                      if (_productsCon.exchangeLoading.value) {
                      } else {
                        if (_productsCon.isOnBoard.value) {
                          Get.offAndToNamed(Onbording.routeName);
                        } else {
                          Get.offAllNamed(
                            HomeScreen.routeName,
                            arguments: [
                              '0',
                            ],
                          );
                        }
                      }
                    },
                  );
                }
                return SizedBox.shrink();
              }),
              Image.asset(
                'assets/images/splash_logo.png',
                width: 200.w,
                height: 245.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
