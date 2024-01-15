import 'package:alhafidh/constants/color.dart';
import 'package:alhafidh/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomDD extends StatelessWidget {
  final dynamic givenValue;
  final String hintTxt;
  final List<DropdownMenuItem<dynamic>>? items;
  final Function(dynamic) onChangedFn;
  const CustomDD({
    Key? key,
    required this.givenValue,
    required this.hintTxt,
    required this.items,
    required this.onChangedFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 388.w,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: ConstantColors.k06C8FF,
          width: 1,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<dynamic>(
          hint: Row(
            children: [
              addW(15.w),
              SvgPicture.asset(
                'assets/svg/location.svg',
              ),
              addW(20.w),
              Text(
                hintTxt,
                style: TextStyle(
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
          value: givenValue,
          isExpanded: true,
          icon: const Icon(Icons.arrow_drop_down),
          items: items,
          onChanged: onChangedFn,
        ),
      ),
    );
  }
}
