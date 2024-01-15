
import 'package:alhafidh/constants/color.dart';
import 'package:alhafidh/constants/string.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final bool initialValue;
  final Function(bool?) onChangedFn;
  final String title;
  const CustomCheckbox({
    Key? key,
    required this.initialValue,
    required this.onChangedFn,
    required this.title,
  }) : super(key: key);

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: widget.initialValue,
          splashRadius: 0,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onChanged: (value) => setState(
            () {
              widget.onChangedFn(value);
            },
          ),
          side: BorderSide(
            color: ConstantColors.lightRed,
            width: 2.w,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        Text(
          widget.title,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 14.sp,
            fontFamily: ConstantStrings.kFontFamily,
          ),
        ),
      ],
    );
  }
}
