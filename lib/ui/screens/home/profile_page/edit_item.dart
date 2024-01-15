
import 'package:alhafidh/constants/color.dart';
import 'package:alhafidh/constants/string.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_field.dart';

class EditItem extends StatelessWidget {
  final TextEditingController editingCon;
  final String title;
  bool? passField;
  TextInputType? inputType;
  EditItem({
    Key? key,
    required this.editingCon,
    required this.title,
    this.passField,
    this.inputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80.h,
      padding: EdgeInsets.symmetric(vertical: 5.h),
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(
          color: ConstantColors.blackShade,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 13.sp,
                fontFamily: ConstantStrings.kAppRobotoFont,
              ),
            ),
            CustomField(
              height: 40.h,
              textCon: editingCon,
              hintText: '',
              brdrClr: Colors.transparent,
              txtFontWeight: FontWeight.w600,
              isPassField: passField,
              inputType:inputType ,
            ),
          ],
        ),
      ),
    );
  }
}