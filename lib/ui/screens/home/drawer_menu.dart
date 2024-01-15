import 'package:alhafidh/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerMenu extends StatelessWidget {
  final VoidCallback onTapFn;
  final String title;
  final String icon;

  const DrawerMenu({
    Key? key,
    required this.onTapFn,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTapFn,
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, bottom: 7.h),
        child: Row(
          children: [
            SizedBox(
              width: 20.w,
              height: 20.h,
              child: Center(
                child: SvgPicture.asset(
                  icon,
                  color: Colors.black,
                ),
              ),
            ),
            addW(10.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
