import 'package:alhafidh/constants/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class QuantityEdit extends StatelessWidget {
  final int quantity;
  final VoidCallback decreaseFn, increaseFn;
  const QuantityEdit({
    Key? key,
    required this.quantity,
    required this.decreaseFn,
    required this.increaseFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 30.h,
      child: Row(
        children: [
          // Remove Icon
          InkWell(
            onTap: decreaseFn,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              width: 30.w,
              height: 30.h,
              decoration: BoxDecoration(
                color: quantity == 1 ? Colors.grey : null,
                border: Border.all(
                  color: ConstantColors.whiteGray,
                  width: 1,
                ),
              ),
              child: Icon(
                Icons.remove,
                color: quantity == 1 ? Colors.grey.shade400 : Colors.black,
                size: 15,
              ),
            ),
          ),
          // Quantity
          Container(
            width: quantity > 99 ? 50.w : 30.w,
            height: 30.h,
            decoration: BoxDecoration(
              border: Border.all(
                color: ConstantColors.whiteGray,
                width: 1,
              ),
            ),
            child: Center(
              child: Text(
                '$quantity',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          // Add Icon
          InkWell(
            onTap: increaseFn,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              width: 30.w,
              height: 30.h,
              decoration: BoxDecoration(
                border: Border.all(
                  color: ConstantColors.whiteGray,
                  width: 1,
                ),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.black,
                size: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
