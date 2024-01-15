import 'package:alhafidh/constants/color.dart';
import 'package:alhafidh/ui/screens/home/home.dart';
import 'package:alhafidh/ui/screens/home/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  final Size preferredSize;
  final VoidCallback? onBack;

  const CustomAppbar({
    Key? key,
    this.onBack,
  })  : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ConstantColors.lightRed,
      elevation: 0,
      // Drawer
      leading: InkWell(
        onTap:widget.onBack?? () {
          Get.back();
        },
        child: SizedBox(
          width: 22.w,
          height: 20.h,
          child: Center(
            child: SvgPicture.asset(
              'assets/svg/back.svg',
              color: Colors.white,
            ),
          ),
        ),
      ),
      centerTitle: true,
      // Logo
      title: const HomeLogo(),
      // Notification Icon
      actions: [
        Container(
          width: 54.w,
          height: 54.h,
          margin: EdgeInsets.only(
            right: 20.w,
          ),
          decoration: BoxDecoration(
            color: ConstantColors.lightRed,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: ConstantColors.lightRed,
              width: 1,
            ),
          ),
          child: Center(
            child: InkWell(
              onTap: () {
                //go to cart
                Get.toNamed(HomeScreen.routeName, arguments: [
                  '3',
                ]);
              },
              child: Icon(Icons.shopping_bag_outlined,
                  size: 25.h, color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
