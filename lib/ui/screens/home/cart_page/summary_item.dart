import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/string.dart';

class SummaryItem extends StatelessWidget {
  final String title;
  final String price;
  const SummaryItem({
    Key? key,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontFamily: ConstantStrings.kAppRobotoFont,
          ),
        ),
        const Spacer(),
        Text(
          price,
          style: TextStyle(
            fontSize: 14.sp,
            fontFamily: ConstantStrings.kAppRobotoFont,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
