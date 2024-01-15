import 'package:alhafidh/constants/color.dart';
import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/helper/helper.dart';
import 'package:alhafidh/states/controller/order.dart';
import 'package:alhafidh/states/controller/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class PaymentBodys extends StatefulWidget {
  final OrderController orderController;
  final ProductsController productCon;
  final void Function(int?) onChange;

  const PaymentBodys(
      {Key? key,
      required this.orderController,
      required this.onChange,
      required this.productCon})
      : super(key: key);

  @override
  State<PaymentBodys> createState() => _PaymentBodysState();
}

class _PaymentBodysState extends State<PaymentBodys> {
  int selectedPaymentOption = 0;

  //for price formatting
  final value = NumberFormat("#,##0", "en_US");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> paymentOptions = [
      AppLocalizations.of(context)!.credit_card_wallet,
      AppLocalizations.of(context)!.cash_on_delivery,
    ];

    return Obx(() {
      if (widget.orderController.setShippingRateLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        if (widget.orderController.setShippingRateObj == null) {
          return Center(
            child: Text(
              AppLocalizations.of(context)!.no_Data_Found,
            ),
          );
        } else {
          double sr = double.parse(widget.orderController.setShippingRateObj!
                  .checkoutShippingLineUpdate.checkout.totalPrice.amount) -
              double.parse(widget.orderController.setShippingRateObj!
                  .checkoutShippingLineUpdate.checkout.subtotalPrice.amount);
          String shippingRate = sr.toStringAsFixed(2);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                  color: ConstantColors.lightGray,
                )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: SizedBox(
                        width: 180.w,
                        child: TextField(
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: ConstantStrings.kAppRobotoFont,
                              fontWeight: FontWeight.normal,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText:
                                  AppLocalizations.of(context)!.discount_code,
                            )),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Container(
                        color: ConstantColors.lightRed,
                        padding: const EdgeInsets.only(
                            top: 11.0, bottom: 11.0, left: 33.0, right: 33.0),
                        child: Text(
                          AppLocalizations.of(context)!.apply,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontFamily: ConstantStrings.kAppRobotoFont,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              addH(15.h),
              Text(
                AppLocalizations.of(context)!.summary,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: ConstantStrings.kAppRobotoFont,
                  fontWeight: FontWeight.bold,
                ),
              ),
              addH(15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.sub_total,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: ConstantStrings.kAppRobotoFont,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    'IQD ${value.format(double.parse(widget.orderController.setShippingRateObj!.checkoutShippingLineUpdate.checkout.subtotalPrice.amount) * widget.productCon.exchangeRate.value)}',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: ConstantStrings.kAppRobotoFont,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              addH(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.shipping,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: ConstantStrings.kAppRobotoFont,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    'IQD $shippingRate',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: ConstantStrings.kAppRobotoFont,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              addH(15.h),
              Container(
                height: 1,
                width: double.maxFinite,
                color: ConstantColors.whiteGray,
              ),
              addH(15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.order_total,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: ConstantStrings.kAppRobotoFont,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    'IQD ${value.format(double.parse(widget.orderController.setShippingRateObj!.checkoutShippingLineUpdate.checkout.totalPrice.amount) * widget.productCon.exchangeRate.value)}',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: ConstantStrings.kAppRobotoFont,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              addH(30.h),
              Text(
                AppLocalizations.of(context)!.payment_method,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontFamily: ConstantStrings.kFontFamily,
                  fontWeight: FontWeight.bold,
                ),
              ),
              addH(20.h),
              Column(
                children: paymentOptions
                    .map(
                      (e) => Column(
                        children: [
                          Row(
                            children: [
                              Radio(
                                value: paymentOptions.indexOf(e),
                                groupValue: selectedPaymentOption,
                                onChanged: (value) {
                                  setState(
                                    () {
                                      widget.onChange(value);
                                      selectedPaymentOption = value as int;
                                    },
                                  );
                                },
                              ),

                              Flexible(
                                child: Text(
                                  e,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              // Radio button
                            ],
                          ),
                          Container(
                            height: 1,
                            width: double.maxFinite,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    )
                    .toList(),
              ),
            ],
          );
        }
      }
    });
  }
}
