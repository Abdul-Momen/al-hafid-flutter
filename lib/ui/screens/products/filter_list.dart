import 'package:alhafidh/constants/color.dart';
import 'package:alhafidh/states/models/filter_all_option_response_model.dart';
import 'package:alhafidh/ui/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterList extends StatefulWidget {
  final List<Value>? filterList;
  const FilterList({
    Key? key,
    required this.filterList,
  }) : super(key: key);

  @override
  State<FilterList> createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40.h,
      child: ListView.builder(
        itemCount:  widget.filterList!.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: CustomBtn(
              onPressedFn: () => setState(
                () => selectedItem = index,
              ),
              btnTxt: widget.filterList![index].key.toString(),
              txtSize: 14.sp,
              txtWeight: FontWeight.w600,
              btnColor: selectedItem == index
                  ? ConstantColors.lightRed
                  : Colors.white,
              txtColor: selectedItem == index ? Colors.white : Colors.black,
              btnBorderColor: ConstantColors.grayBlack,
              btnSize: Size(120.w, 45.h),
              btnIcon: 'assets/svg/reset.svg',
            ),
          );
        },
      ),
    );
  }
}
