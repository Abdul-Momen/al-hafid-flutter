import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeLogo extends StatelessWidget {
  final double? h;
  final double? w;
  const HomeLogo({Key? key, this.h,this.w}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w??182.w,
      height: h??34.h,
      child: Center(
        child: Image.asset(
          'assets/images/splash_logo.png',
        ),
      ),
    );
  }
}
