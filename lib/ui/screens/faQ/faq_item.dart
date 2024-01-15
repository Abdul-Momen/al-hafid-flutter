import 'package:alhafidh/constants/color.dart';
import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/helper/helper.dart';
import 'package:alhafidh/states/models/faq_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaqItem extends StatefulWidget {
  final Faq faq;

  const FaqItem({
    Key? key,
    required this.faq,
  }) : super(key: key);

  @override
  State<FaqItem> createState() => _FaqItemState();
}

class _FaqItemState extends State<FaqItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        addH(15.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: Text(
                widget.faq.title,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: ConstantStrings.kFontFamily,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (widget.faq.visible) {
                  setState(() {
                    widget.faq.visible = false;
                  });
                } else {
                  setState(() {
                    widget.faq.visible = true;
                  });
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: widget.faq.visible
                    ? const Icon(
                        Icons.keyboard_arrow_down_outlined,
                      )
                    : const Icon(
                        Icons.keyboard_arrow_right_outlined,
                      ),
              ),
            ),
          ],
        ),
        Visibility(
            visible: widget.faq.visible,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.faq.subtitle,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.normal,
                    fontFamily: ConstantStrings.kFontFamily,
                    color: Colors.grey
                  ),
                ),
              ],
            )),
        addH(15.h),
        Divider(
          color: ConstantColors.lightGray,
          height: 1.5,
        )
      ],
    );
  }
}
