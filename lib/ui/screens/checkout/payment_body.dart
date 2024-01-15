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

class PaymentBody extends StatefulWidget {
  final OrderController orderController;
  final ProductsController productCon;
  final void Function(int?) onChange;

  const PaymentBody(
      {Key? key,
      required this.orderController,
      required this.onChange,
      required this.productCon})
      : super(key: key);

  @override
  State<PaymentBody> createState() => _PaymentBodyState();
}

class _PaymentBodyState extends State<PaymentBody> {
  int selectedPaymentOption = 0;

  //for price formatting
  final value = NumberFormat("#,##0", "en_US");

  TextEditingController controller = TextEditingController();

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

         double disPrice= double.parse(widget.orderController.setShippingRateObj!.checkoutShippingLineUpdate.checkout.subtotalPrice.amount) - widget.orderController.discountPrice.value;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: ConstantColors.lightGray)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: SizedBox(
                          width: 180.w,
                          child: TextField(
                              controller: controller,
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
                        onPressed: () {
                          if (widget.orderController.isDiscounted.value) {
                            //removed discount
                            widget.orderController.removeDiscountCode(
                                checkoutId: widget
                                    .orderController.cartCheckoutId.value);
                          } else {
                            if(controller.text.isEmpty){
                              Get.snackbar("Discount code is empty", 'Enter your discount code');
                              return;
                            }
                            //apply discount
                            widget.orderController.applyDiscountCode(
                                code: controller.text,
                                checkoutId: widget
                                    .orderController.cartCheckoutId.value);
                          }
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: ConstantColors.lightRed,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(6.0),
                            ),
                          ),
                          padding: const EdgeInsets.only(
                              top: 11.0, bottom: 11.0, left: 33.0, right: 33.0),
                          child: Text(
                            widget.orderController.isDiscounted.value
                                ? AppLocalizations.of(context)!.remove
                                : AppLocalizations.of(context)!.apply,
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
                      '${AppLocalizations.of(context)!.iqd} ${value.format(calculateRoundPrice(inputNum:  double.parse(widget.orderController.setShippingRateObj!.checkoutShippingLineUpdate.checkout.subtotalPrice.amount)*widget.productCon.exchangeRate.value))}',
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
                      '${AppLocalizations.of(context)!.iqd} $shippingRate',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: ConstantStrings.kAppRobotoFont,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                addH(10.h),
                if (widget.orderController.isDiscounted.value)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.discount_v,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: ConstantStrings.kAppRobotoFont,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        '${AppLocalizations.of(context)!.iqd} ${value.format(calculateRoundPrice(inputNum: double.parse(widget.orderController.discountPrice.value.toString())*widget.productCon.exchangeRate.value)-calculateRoundPrice(inputNum:  double.parse(widget.orderController.setShippingRateObj!.checkoutShippingLineUpdate.checkout.subtotalPrice.amount)*widget.productCon.exchangeRate.value)).replaceAll(RegExp('-'), '')}',
                        //'- \$${value.format(disPrice)}',
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
                    if (widget.orderController.isDiscounted.value)
                      Text(
                        '${AppLocalizations.of(context)!.iqd} ${value.format(calculateRoundPrice(inputNum: double.parse(widget.orderController.discountPrice.value.toString())*widget.productCon.exchangeRate.value))}',
                       // '${AppLocalizations.of(context)!.iqd} ${value.format(calculateRoundPrice(inputNum: double.parse(widget.orderController.discountPrice.value.toString())*widget.productCon.exchangeRate.value))}',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: ConstantStrings.kAppRobotoFont,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    if (!widget.orderController.isDiscounted.value)
                      Text(
                        '${AppLocalizations.of(context)!.iqd} ${value.format(calculateRoundPrice(inputNum: double.parse(widget.orderController.setShippingRateObj!.checkoutShippingLineUpdate.checkout.totalPrice.amount)*widget.productCon.exchangeRate.value)) }',
                     //   '\$ ${value.format(double.parse(widget.orderController.setShippingRateObj!.checkoutShippingLineUpdate.checkout.totalPrice.amount)) }',
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
            ),
          );
        }
      }
    });
  }
}
