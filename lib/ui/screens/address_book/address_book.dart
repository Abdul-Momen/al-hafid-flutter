import 'package:alhafidh/constants/color.dart';
import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/helper/helper.dart';
import 'package:alhafidh/states/controller/address.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/states/models/customer_model.dart';
import 'package:alhafidh/ui/screens/add_address/add_address.dart';
import 'package:alhafidh/ui/screens/address_book/address_item.dart';

import 'package:alhafidh/ui/widgets/custom_app_bar.dart';
import 'package:alhafidh/ui/widgets/custom_login_check.dart';
import 'package:alhafidh/ui/widgets/custom_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddressBookScreen extends StatefulWidget {
  static String routeName = '/addresssbook';

  const AddressBookScreen({Key? key}) : super(key: key);

  @override
  State<AddressBookScreen> createState() => _AddressBookScreenState();
}

class _AddressBookScreenState extends State<AddressBookScreen> {
  final AddressController _addressCon = Get.find<AddressController>();
  CustomerModel? userModel;

  @override
  void initState() {
    if (Preference.getLoggedInFlag()) {
      userModel = Preference.getUserDetails();
      if (userModel != null) {
        if (_addressCon.addressList.isEmpty) {
          _addressCon.getAddresses(
            //filter string to int
            customerID: int.parse(
                userModel!.customer.id.replaceAll(RegExp(r'[^0-9]'), '')),
          );
        }
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Preference.getLoggedInFlag()
            ? Column(
                children: [
                  // Title
                  CustomTitle(
                    title: AppLocalizations.of(context)!.address_Book,
                    suffixIcon: 'assets/svg/search_suffix.svg',
                    // suffixOnTapFn: () => Get.toNamed(SearchScreen.routeName),
                  ),
                  // Address List Title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.all_Address,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: ConstantStrings.kFontFamily,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Add Address Btn
                      InkWell(
                        onTap: () {
                          Get.toNamed(AddAddress.routeName)!.then(
                            (value) => _addressCon.getAddresses(
                              customerID: int.parse(userModel!.customer.id
                                  .replaceAll(RegExp(r'[^0-9]'), '')),
                            ),
                          );
                        },
                        child: Container(
                          width: 135.w,
                          height: 36.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: ConstantColors.lightRed,
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)!.add_New_Address,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: ConstantStrings.kFontFamily,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  addH(10.h),
                  // Address List
                  Obx(() {
                    if (_addressCon.addressLoading.value) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 300),
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (_addressCon.addressList.isEmpty) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 300),
                          child: Text(
                            AppLocalizations.of(context)!.address_not_found,
                          ),
                        );
                      } else {
                        return Expanded(
                          child: RefreshIndicator(
                            onRefresh: () async => _addressCon.getAddresses(
                              customerID: int.parse(userModel!.customer.id
                                  .replaceAll(RegExp(r'[^0-9]'), '')),
                            ),
                            child: ListView.builder(
                              itemCount: _addressCon.addressList.length,
                              itemBuilder: (context, index) {
                                return AddressItem(
                                  addressCon: _addressCon,
                                  uID: int.parse(userModel!.customer.id
                                      .replaceAll(RegExp(r'[^0-9]'), '')),
                                  aModel: _addressCon.addressList[index],
                                );
                              },
                            ),
                          ),
                        );
                      }
                    }
                  }),
                ],
              )
            : const CustomLoginCheck(),
      ),
    );
  }
}
