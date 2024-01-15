import 'package:alhafidh/constants/color.dart';
import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/helper/helper.dart';
import 'package:alhafidh/states/controller/address.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/states/models/address_model.dart';
import 'package:alhafidh/states/models/customer_model.dart';
import 'package:alhafidh/ui/screens/address_book/address_book.dart';
import 'package:alhafidh/ui/screens/address_book/address_item.dart';
import 'package:alhafidh/ui/screens/checkout/custom_checkbox.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShippingAddressBody extends StatefulWidget {
  final AddressController addressCon;
  final void Function(Address) getSelectedAddress;
  final void Function(DateTime) scheduleDeliveryFn;

  const ShippingAddressBody({
    Key? key,
    required this.addressCon,
    required this.getSelectedAddress,
    required this.scheduleDeliveryFn,
  }) : super(key: key);

  @override
  State<ShippingAddressBody> createState() => _ShippingAddressBodyState();
}

class _ShippingAddressBodyState extends State<ShippingAddressBody> {
  final bool _sameAddressFlag = true;
  //bool _scheduleFlag = false;
  int _selectedAddressIndex = 0;

  CustomerModel? _uModel;
 // DateTime _scheduleDate = DateTime.now().add(const Duration(days: 3));

  @override
  void initState() {
    _uModel = Preference.getUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Shipping Address
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.shipping_address,
              style: TextStyle(
                fontSize: 18.sp,
                fontFamily: ConstantStrings.kFontFamily,
                fontWeight: FontWeight.bold,
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(AddressBookScreen.routeName);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: ConstantColors.lightRed,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    AppLocalizations.of(context)!.add_edit_address,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: ConstantStrings.kFontFamily,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        addH(20.h),
        // Address List
        SizedBox(
          width: double.infinity,
          height: 380.h,
          child: Obx(
            () {
              if (widget.addressCon.addressLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (widget.addressCon.defaultAddressList.isEmpty) {
                  return Center(
                    child: Text(
                      AppLocalizations.of(context)!.address_not_found,
                    ),
                  );
                } else {
                  return ListView.builder(
                    primary: false,
                    itemCount: widget.addressCon.defaultAddressList.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 388.w,
                        height: 130.h,
                        child: Stack(
                          alignment: AlignmentDirectional.centerStart,
                          children: [
                            AddressItem(
                              addressCon: widget.addressCon,
                              uID: 1234,
                              aModel:
                                  widget.addressCon.defaultAddressList[index],
                              suffixText: AppLocalizations.of(context)!.change,
                            ),
                            Container(
                              width: 40.w,
                              height: 40.h,
                              margin: EdgeInsets.only(bottom: 30.h, left: 5.w),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Checkbox(
                                value: _selectedAddressIndex == index,
                                onChanged: (value) {
                                  setState(
                                    () => _selectedAddressIndex = index,
                                  );
                                  widget.getSelectedAddress(
                                    widget.addressCon.defaultAddressList[
                                        _selectedAddressIndex],
                                  );
                                },
                                shape: const CircleBorder(),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              }
            },
          ),
        ),

        // My billing address same as shipping address
        SizedBox(
          height: 60.h,
          child: CustomCheckbox(
            initialValue: _sameAddressFlag,
            onChangedFn: (value) {
              //setState(() => _sameAddressFlag = value!);
            },
            title: AppLocalizations.of(context)!.my_billing_address,
          ),
        ),
        addH(10.h),
      ],
    );
  }
}


