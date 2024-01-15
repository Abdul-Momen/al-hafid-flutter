import 'package:alhafidh/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customTxt( txt:'15P Free Standingn Dishwasher',fontSize: 16.sp),
          addH(5.h),
          customTxt( txt:'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Volutpat fermentum blandit id ultricies lacus, mi. Egestas at mi gravida vitae.',fontSize: 10.sp),
          addH(5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customTxt( txt:'DWHA-FS1453SS',fontSize: 10.sp),
              customTxt( txt: '1 hr ago',fontSize: 10.sp),
            ],
          )
        ],
      ),
    );
  }

  Widget customTxt({required String txt, double? fontSize}) {
    return Text(
      txt,
      style: TextStyle(color: Colors.black, fontSize: fontSize??12.sp),
    );
  }
}
