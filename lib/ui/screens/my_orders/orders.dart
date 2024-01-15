import 'package:alhafidh/constants/color.dart';
import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/helper/helper.dart';
import 'package:alhafidh/states/controller/order.dart';
import 'package:alhafidh/states/controller/products.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/states/models/customer_model.dart';
import 'package:alhafidh/ui/widgets/custom_app_bar.dart';
import 'package:alhafidh/ui/widgets/custom_login_check.dart';
import 'package:alhafidh/ui/widgets/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import 'orders_list.dart';

class Orders extends StatefulWidget {
  static String routeName = '/orders';

  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  final OrderController _orderCon = Get.find<OrderController>();
  final ProductsController _productsCon = Get.find<ProductsController>();

  CustomerModel? userModel;
  int _selectedBtnIndex = 0;

  @override
  void initState() {
    if (Preference.getLoggedInFlag()) {
      userModel = Preference.getUserDetails();
      if (userModel != null) {
        _orderCon.getMyOrders(cEmail: userModel!.customer.email);
      }
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
          padding: const EdgeInsets.all(20.0),
          child: Preference.getLoggedInFlag()
              ? Column(
                  children: [
                    CustomTitle(title: AppLocalizations.of(context)!.my_Orders),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectedBtnIndex = 0;
                            });
                          },
                          child: Container(
                            color: _selectedBtnIndex == 0
                                ? ConstantColors.lightRed
                                : Colors.white,
                            height: 40.h,
                            width: 80.w,
                            child: Center(
                              child: Text(
                                AppLocalizations.of(context)!.pending,
                                style: TextStyle(
                                    color: _selectedBtnIndex == 0
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectedBtnIndex = 1;
                            });
                          },
                          child: Container(
                            color: _selectedBtnIndex == 1
                                ? ConstantColors.lightRed
                                : Colors.white,
                            height: 40.h,
                            width: 80.w,
                            child: Center(
                              child: Text(
                                AppLocalizations.of(context)!.processing_o,
                                style: TextStyle(
                                    color: _selectedBtnIndex == 1
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectedBtnIndex = 2;
                            });
                          },
                          child: Container(
                            color: _selectedBtnIndex == 2
                                ? ConstantColors.lightRed
                                : Colors.white,
                            height: 40.h,
                            width: 80.w,
                            child: Center(
                              child: Text(
                                AppLocalizations.of(context)!.cancel,
                                style: TextStyle(
                                    color: _selectedBtnIndex == 2
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectedBtnIndex = 3;
                            });
                          },
                          child: Container(
                            color: _selectedBtnIndex == 3
                                ? ConstantColors.lightRed
                                : Colors.white,
                            height: 40.h,
                            width: 80.w,
                            child: Center(
                              child: Text(
                                AppLocalizations.of(context)!.delivered,
                                style: TextStyle(
                                    color: _selectedBtnIndex == 3
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    addH(10.h),
                    getOrderList(),
                  ],
                )
              : const CustomLoginCheck(),
        ),
      ),
    );
  }

  Widget getOrderList() {
    switch (_selectedBtnIndex) {
      case 0:
        return Obx(() {
          if (_orderCon.myOrdersLoading.value) {
            return Padding(
              padding: EdgeInsets.only(top: 300.h),
              child: const CircularProgressIndicator(),
            );
          } else {
            if (_orderCon.pendingOrders.isEmpty) {
              return Padding(
                padding: EdgeInsets.only(top: 300.h),
                child: Text(
                  AppLocalizations.of(context)!.no_Data_Found,
                ),
              );
            } else {
              return Expanded(
                child: ListView.builder(
                    itemCount: _orderCon.pendingOrders.length,
                    itemBuilder: (BuildContext context, int index) {
                      return OrdersList(
                        order: _orderCon.pendingOrders[index],
                        pCon: _productsCon,
                      );
                    }),
              );
            }
          }
        });
      case 1:
        return Obx(() {
          if (_orderCon.myOrdersLoading.value) {
            return Padding(
              padding: EdgeInsets.only(top: 300.h),
              child: const CircularProgressIndicator(),
            );
          } else {
            if (_orderCon.processingOrders.isEmpty) {
              return Padding(
                padding: EdgeInsets.only(top: 300.h),
                child: Text(
                  AppLocalizations.of(context)!.no_Data_Found,
                ),
              );
            } else {
              return Expanded(
                child: ListView.builder(
                    itemCount: _orderCon.processingOrders.length,
                    itemBuilder: (BuildContext context, int index) {
                      return OrdersList(
                        order: _orderCon.processingOrders[index],
                        pCon: _productsCon,
                      );
                    }),
              );
            }
          }
        });
      case 2:
        return Obx(() {
          if (_orderCon.myOrdersLoading.value) {
            return Padding(
              padding: EdgeInsets.only(top: 300.h),
              child: const CircularProgressIndicator(),
            );
          } else {
            if (_orderCon.cancelOrders.isEmpty) {
              return Padding(
                padding: EdgeInsets.only(top: 300.h),
                child: Text(
                  AppLocalizations.of(context)!.no_Data_Found,
                ),
              );
            } else {
              return Expanded(
                child: ListView.builder(
                    itemCount: _orderCon.cancelOrders.length,
                    itemBuilder: (BuildContext context, int index) {
                      return OrdersList(
                        order: _orderCon.cancelOrders[index],
                        pCon: _productsCon,
                      );
                    }),
              );
            }
          }
        });
      case 3:
        return Obx(() {
          if (_orderCon.myOrdersLoading.value) {
            return Padding(
              padding: EdgeInsets.only(top: 300.h),
              child: const CircularProgressIndicator(),
            );
          } else {
            if (_orderCon.fulfilOrders.isEmpty) {
              return Padding(
                padding: EdgeInsets.only(top: 300.h),
                child: Text(
                  AppLocalizations.of(context)!.no_Data_Found,
                ),
              );
            } else {
              return Expanded(
                child: ListView.builder(
                    itemCount: _orderCon.fulfilOrders.length,
                    itemBuilder: (BuildContext context, int index) {
                      return OrdersList(
                        order: _orderCon.fulfilOrders[index],
                        pCon: _productsCon,
                      );
                    }),
              );
            }
          }
        });
      default:
        return Text(
          ConstantStrings.kWentWrong,
        );
    }
  }
}
