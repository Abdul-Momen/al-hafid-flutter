import 'package:alhafidh/ui/widgets/custom_img.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSlider extends StatelessWidget {
  final VoidCallback onTapFn;
  final String imgUrl;
  const HomeSlider({
    Key? key,
    required this.onTapFn,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFn,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: CustomImg(
          imgUrl: imgUrl,
          imgHeight: 158.h,
          imgFit: BoxFit.fill,
        ),
      ),
    );
  }
}
