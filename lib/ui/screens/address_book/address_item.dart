import 'package:alhafidh/constants/color.dart';
import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/helper/helper.dart';
import 'package:alhafidh/states/controller/address.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/states/models/address_model.dart';
import 'package:alhafidh/ui/screens/add_address/add_address.dart';
import 'package:alhafidh/ui/screens/address_book/address_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddressItem extends StatelessWidget {
  final AddressController addressCon;
  final int uID;
  final Address aModel;
  String? suffixText;

  AddressItem({
    Key? key,
    required this.addressCon,
    required this.uID,
    required this.aModel,
    this.suffixText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 388.w,
      height: 110.h,
      margin: EdgeInsets.only(bottom: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: aModel.addressDefault
              ? ConstantColors.lightRed
              : ConstantColors.grayBlack,
          width: aModel.addressDefault ? 2 : 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Address Icon
              SizedBox(
                width: 40.w,
                child: Center(
                  child: SvgPicture.asset(
                    'assets/svg/address_icon.svg',
                  ),
                ),
              ),
              addW(10.w),
              // Address Text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 270.w,
                    height: 20.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Address Title
                        Text(
                          '${aModel.firstName} ${aModel.lastName}',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontFamily: ConstantStrings.kFontFamily,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        // Edit & Delete Icon
                        SizedBox(
                          width: suffixText == null ? 55.w : 60.w,
                          height: 20.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  if (suffixText == null) {
                                    Get.toNamed(
                                      AddAddress.routeName,
                                      arguments: aModel,
                                    )!
                                        .then(
                                      (value) => addressCon.getAddresses(
                                        customerID: uID,
                                      ),
                                    );
                                  } else {
                                    Get.toNamed(AddressBookScreen.routeName);
                                  }
                                },
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: SvgPicture.asset(
                                  'assets/svg/edit.svg',
                                ),
                              ),
                              if (suffixText == null)
                                InkWell(
                                  onTap: () {
                                    addressCon.deleteAddress(
                                      customerToken:
                                          Preference.getCToken().toString(),
                                      addressId: aModel.id,
                                    );
                                    Get.defaultDialog(
                                      title: AppLocalizations.of(context)!
                                          .deleting,
                                      content: Obx(
                                        () {
                                          if (addressCon
                                              .deleteAddressLoading.value) {
                                            return SizedBox(
                                              height: 100.h,
                                              child: const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            );
                                          } else {
                                            Future.delayed(
                                              const Duration(seconds: 1),
                                              () {
                                                Get.back();
                                                addressCon.addressList.remove(
                                                  aModel,
                                                );
                                              },
                                            );
                                            return Center(
                                              child: Text(
                                                AppLocalizations.of(context)!
                                                    .deleted,
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    );
                                  },
                                  child: SvgPicture.asset(
                                    'assets/svg/delete.svg',
                                  ),
                                ),
                              if (suffixText != null)
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(AddressBookScreen.routeName);
                                  },
                                  child: Text(
                                    suffixText!,
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 13.sp,
                                      fontFamily: ConstantStrings.kFontFamily,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  addH(4.h),
                  Text(
                    "${aModel.address1} ${aModel.address2}",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.sp,
                      fontFamily: ConstantStrings.kFontFamily,
                    ),
                  ),
                  addH(4.h),
                  Text(
                    '${AppLocalizations.of(context)!.phone}: ${aModel.phone}',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: ConstantStrings.kFontFamily,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          addH(3.h),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                if (!aModel.addressDefault) {
                  addressCon.setDefaultAddress(
                    customerToken: Preference.getCToken().toString(),
                    addressId: aModel.id,
                  );
                  Get.defaultDialog(
                    title: AppLocalizations.of(context)!.setting,
                    content: Obx(
                      () {
                        if (addressCon.setDefaultAddressLoading.value) {
                          return const SizedBox.shrink();
                        } else {
                          Future.delayed(
                            const Duration(seconds: 0),
                            () {
                              addressCon.getAddresses(customerID: uID);
                              Get.back();
                            },
                          );
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(
                      color: ConstantColors.lightRed,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      aModel.addressDefault
                          ? AppLocalizations.of(context)!.default_txt
                          : AppLocalizations.of(context)!.setDefault,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontFamily: ConstantStrings.kFontFamily,
                        color: ConstantColors.lightRed,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
