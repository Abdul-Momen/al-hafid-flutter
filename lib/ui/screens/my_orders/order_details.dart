import 'package:alhafidh/states/controller/products.dart';
import 'package:alhafidh/states/models/order_model.dart';
import 'package:alhafidh/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../constants/color.dart';
import '../../../constants/string.dart';
import '../../../helper/helper.dart';
import '../../widgets/custom_title.dart';

class OrderDetails extends StatefulWidget {
  static String routeName = '/ordersDetails';

  const OrderDetails({Key? key}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  Order? orderDetails;
  final ProductsController _productsCon = Get.find<ProductsController>();

  @override
  void initState() {
    // TODO: implement initState
    if (Get.arguments != null) {
      orderDetails = Get.arguments[0];
    }
    super.initState();
  }
  final value = new NumberFormat("#,##0", "en_US");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addH(10.h),
              CustomTitle(
                title: AppLocalizations.of(context)!.order_Details,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 12, bottom: 12, left: 20, right: 12),
                  child: Column(
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
                            "#${orderDetails!.orderNumber}",
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
                            AppLocalizations.of(context)!.order_Status,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: ConstantStrings.kFontFamily,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            orderDetails!.financialStatus.toString() == 'paid'
                                ? "Completed"
                                : orderDetails!.financialStatus.toString(),
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
                            AppLocalizations.of(context)!.placed_On,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: ConstantStrings.kFontFamily,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            DateFormat('dd-MM-yyyy').format(DateTime.parse(
                                orderDetails!.createdAt.toString())),
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
                ),
              ),
              addH(20.h),

              ///need load listview
              // Cart Items
              SizedBox(
                height: 297.h,
                child: ListView.builder(
                  itemCount: orderDetails!.lineItems.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 12, bottom: 12, left: 20, right: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              orderDetails!.lineItems[index].name,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: ConstantStrings.kFontFamily,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'SKU: ',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: ConstantStrings.kFontFamily,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  orderDetails!.lineItems[index].sku.toString(),
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
                                 AppLocalizations.of(context)!.price,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: ConstantStrings.kFontFamily,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  " ${AppLocalizations.of(context)!.iqd} ${value.format(double.parse(orderDetails!.lineItems[index].price) * _productsCon.exchangeRate.value)}",

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
                                  AppLocalizations.of(context)!.quantity,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: ConstantStrings.kFontFamily,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  orderDetails!.lineItems[index].quantity
                                      .toString(),
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
                      ),
                    );
                  },
                ),
              ),
              addH(10.h),
            ],
          ),
        ),
      ),
      bottomSheet: SizedBox(
        height: 300.h,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.note,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: ConstantStrings.kFontFamily,
                  fontWeight: FontWeight.bold,
                ),
              ),
              addH(4.h),
              Text(
                orderDetails!.note.toString(),
                style: TextStyle(
                  fontSize: 11.sp,
                  fontFamily: ConstantStrings.kFontFamily,
                  fontWeight: FontWeight.normal,
                ),
              ),
              addH(20.h),
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
                    " IQD ${value.format(double.parse(orderDetails!.subtotalPrice) * _productsCon.exchangeRate.value)}",
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
                    " ${AppLocalizations.of(context)!.iqd} ${value.format(double.parse(orderDetails!.totalShippingPriceSet.presentmentMoney.amount) * _productsCon.exchangeRate.value)}",
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
                    " ${AppLocalizations.of(context)!.iqd} ${value.format(double.parse(orderDetails!.totalPrice) * _productsCon.exchangeRate.value)}",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: ConstantStrings.kAppRobotoFont,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              /* addH(30.h),
              CustomBtn(
                onPressedFn: () {
                  //redirect home page
                  Get.offAllNamed(
                    HomeScreen.routeName,
                    arguments: [
                      '0',
                    ],
                  );
                },
                btnTxt: 'Continue Shopping',
                btnSize: Size(double.maxFinite, 50.h),
              )*/
            ],
          ),
        ),
      ),
    );
  }
}
