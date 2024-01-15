import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandCard extends StatelessWidget {
  final VoidCallback onTapFn;
  final String? imgUrl;
  const BrandCard({
    Key? key,
    required this.onTapFn,
     this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFn,
      child: Container(
        width: 70.w,
        margin: EdgeInsets.only(right: 10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.w),
          // color: ConstantColors.kF3F3F3,
          color: Colors.white,
          // border: Border.all(
          //   //color: ConstantColors.kD4EAFC,
          //   width: 1.w,
          // ),
        ),
        child: const Center(
          child:Text('Alhafidh'),
        ),
      ),
    );
  }
}
