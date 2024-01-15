import 'package:alhafidh/states/controller/order.dart';
import 'package:alhafidh/states/models/get_shipping_rate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import '../../../constants/color.dart';
import '../../../constants/string.dart';
import '../../../helper/helper.dart';


class ShippingRateBody extends StatefulWidget {
  final OrderController orderController;
  final void Function(ShippingRate) getSelectedRate;

  const ShippingRateBody(
      {Key? key, required this.getSelectedRate, required this.orderController})
      : super(key: key);

  @override
  State<ShippingRateBody> createState() => _ShippingRateState();
}

class _ShippingRateState extends State<ShippingRateBody> {
  int selectedShippingOption = 0;
  bool isSelected = true;

  //for price formatting
  final value =   NumberFormat("#,##0", "en_US");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.choose_Shipping_Rate,
          style: TextStyle(
            fontSize: 18.sp,
            fontFamily: ConstantStrings.kFontFamily,
            fontWeight: FontWeight.bold,
          ),
        ),
        addH(15.h),
        Container(
          height: 1,
          width: double.maxFinite,
          color: ConstantColors.whiteGray,
        ),
        addH(15.h),
        Obx(
          () {
            if (widget.orderController.getShippingRateLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (widget.orderController.shippingRateList.isEmpty) {
                return Center(
                  child: Text(
                    AppLocalizations.of(context)!.no_Data_Found,
                  ),
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: widget.orderController.shippingRateList
                      .map(
                        (e) => Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Radio(
                                      fillColor: MaterialStateProperty
                                          .resolveWith<Color>(
                                              (Set<MaterialState> states) {
                                        return ConstantColors.lightRed;
                                      }),
                                      value: widget
                                          .orderController.shippingRateList
                                          .indexOf(e),
                                      groupValue: selectedShippingOption,
                                      onChanged: (value) => setState(
                                        () => selectedShippingOption =
                                            value as int,
                                      ),
                                    ),
                                    Text(
                                      e.title.toString(),
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                    // Radio button
                                  ],
                                ),
                                Text(
                                  ' ${AppLocalizations.of(context)!.iqd} ${e.price.amount}',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 1,
                              width: double.maxFinite,
                              color: ConstantColors.whiteGray,
                            )
                          ],
                        ),
                      )
                      .toList(),
                );
              }
            }
          },
        )
      ],
    );
  }
}
