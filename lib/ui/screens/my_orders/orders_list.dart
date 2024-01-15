import 'package:alhafidh/helper/helper.dart';
import 'package:alhafidh/states/controller/products.dart';
import 'package:alhafidh/states/models/order_model.dart';
import 'package:alhafidh/ui/screens/my_orders/order_details.dart';
import 'package:alhafidh/ui/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../constants/string.dart';

class OrdersList extends StatelessWidget {
  final Order order;
  final ProductsController pCon;

  const OrdersList({
    Key? key,
    required this.order,
    required this.pCon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = NumberFormat("#,##0", "en_US");

    return Card(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 12, bottom: 12, left: 20, right: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.order_ID,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: ConstantStrings.kFontFamily,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      '#${order.orderNumber}',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: ConstantStrings.kFontFamily,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                addH(4.h),
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.date,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: ConstantStrings.kFontFamily,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      DateFormat('dd-MM-yyyy')
                          .format(DateTime.parse(order.createdAt.toString())),
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: ConstantStrings.kFontFamily,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                addH(4.h),
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.payment_Status,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: ConstantStrings.kFontFamily,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      order.financialStatus.toString() == 'paid'
                          ? AppLocalizations.of(context)!.paid
                          : order.financialStatus.toString() == 'voided'
                              ? AppLocalizations.of(context)!.cancel
                              : order.financialStatus.toString() == 'pending'
                              ? AppLocalizations.of(context)!.pending
                              : order.financialStatus.toString(),
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: ConstantStrings.kFontFamily,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                addH(4.h),
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.total,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: ConstantStrings.kFontFamily,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      " ${AppLocalizations.of(context)!.iqd} ${value.format(calculateRoundPrice(inputNum: double.parse(order.subtotalPrice) * pCon.exchangeRate.value))}",
                      // '\$${order.subtotalPrice}',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: ConstantStrings.kFontFamily,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            CustomBtn(
              onPressedFn: () {
                //go to orders details
                Get.toNamed(OrderDetails.routeName, arguments: [order]);
              },
              btnTxt: AppLocalizations.of(context)!.order_Details,
              txtSize: 12.sp,
              btnSize: Size(105.w, 25.h),
            ),
          ],
        ),
      ),
    );
  }
}
