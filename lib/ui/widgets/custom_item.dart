import 'package:alhafidh/constants/color.dart';
import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/states/controller/products.dart';
import 'package:alhafidh/ui/widgets/custom_img.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../helper/helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomItem extends StatefulWidget {
  final String imgLink;
  final int pId;
  final String productName;
  final String price;
  final VoidCallback deleteIconFn;
  final Widget child;

  const CustomItem({
    Key? key,
    required this.deleteIconFn,
    required this.imgLink,
    required this.productName,
    required this.price,
    required this.child,
    required this.pId,
  }) : super(key: key);

  @override
  State<CustomItem> createState() => _CustomItemState();
}

class _CustomItemState extends State<CustomItem> {
 // final ProductsController _productsCon = Get.find<ProductsController>();

  @override
  void initState() {
    // TODO: implement initState
    print("init Print = ${widget.pId}");
  //  _productsCon.getTranProductAr(widget.pId.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //for title tr arabic
    return Container(
      width: 348.w,
      height: 100.h,
      margin: EdgeInsets.only(bottom: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(
          color: ConstantColors.whiteGray,
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Container(
            width: 90.w,
            height: 90.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: CustomImg(
              imgUrl: widget.imgLink,
              imgFit: BoxFit.fill,
            ),
          ),
          addW(10.h),
          // Details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Title

              SizedBox(
                width: 210.w,
                child: Text(
                 // _productsCon.translateProductDtlist[0].value ??
                      widget.productName,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: ConstantStrings.kAppRobotoFont,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              // Price
              /* Text(
                'Price: \$$price',
                style: TextStyle(
                  fontSize: 12.sp,
                ),
              ),*/
              Text(
               AppLocalizations.of(context)!.price+ ":"+AppLocalizations.of(context)!.iqd +" " + widget.price,
                style: TextStyle(
                  fontSize: 12.sp,
                ),
              ),
              widget.child,
            ],
          ),
          const Spacer(),
          // Delete
          InkWell(
            onTap: widget.deleteIconFn,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              width: 20.w,
              height: 20.h,
              margin: EdgeInsets.only(right: 10.w, top: 15.h),
              child: Center(
                child: SvgPicture.asset(
                  'assets/svg/delete.svg',
                  color: ConstantColors.lightRed,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
