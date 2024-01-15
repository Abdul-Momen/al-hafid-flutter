import 'package:alhafidh/constants/color.dart';
import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/helper/helper.dart';
import 'package:alhafidh/states/controller/order.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/states/utils/methods.dart';
import 'package:alhafidh/ui/screens/login/login.dart';
import 'package:alhafidh/ui/widgets/custom_app_bar.dart';
import 'package:alhafidh/ui/widgets/custom_btn.dart';
import 'package:alhafidh/ui/widgets/custom_field.dart';
import 'package:alhafidh/ui/widgets/custom_title.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddGuestAddressScreen extends StatefulWidget {
  static String routeName = '/contactInfo';

  const AddGuestAddressScreen({Key? key}) : super(key: key);

  @override
  State<AddGuestAddressScreen> createState() => _ContactInfoScreenState();
}

class _ContactInfoScreenState extends State<AddGuestAddressScreen> {

  final OrderController _orderController = Get.find<OrderController>();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _fNameCon = TextEditingController();
  final TextEditingController _lNameCon = TextEditingController();
  final TextEditingController _addressCon = TextEditingController();
  final TextEditingController _cityCon = TextEditingController();
  final TextEditingController _postCodeCon = TextEditingController();
  final TextEditingController _phoneCon = TextEditingController();
//  final TextEditingController _extraDirectionsCon = TextEditingController();


  bool _emailNewsAndOffer = false;
  bool _saveInfo = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      appBar: const CustomAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomTitle(
                  title: AppLocalizations.of(context)!.contact_information),
              // Sign Up Text
              Align(
                alignment: Alignment.topRight,
                child: RichText(
                  text: TextSpan(
                    text: AppLocalizations.of(context)!.already_have_Ac,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: ConstantStrings.kAppRobotoFont,
                      color: Colors.grey.shade600,
                    ),
                    children: [
                      TextSpan(
                        text: AppLocalizations.of(context)!.logIn,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.toNamed(LoginScreen.routeName),
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 14.sp,
                          fontFamily: ConstantStrings.kAppRobotoFont,
                          color: ConstantColors.lightRed,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              addH(10.h),
              CustomField(
                textCon: _emailCon,
                // prefixIcon: 'assets/svg/address_title.svg',
                hintText: AppLocalizations.of(context)!.enter_your_email,
                brdrClr: ConstantColors.whiteGray,
              ),
              addH(10.h),

              // Email me with news and offers
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 300.w,
                    height: 22.h,
                    child: Row(
                      children: [
                        Checkbox(
                          value: _emailNewsAndOffer,
                          onChanged: (value) =>
                              setState(() => _emailNewsAndOffer = value!),
                          splashRadius: 0,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context)!
                              .email_me_with_news_offers,
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontFamily: ConstantStrings.kAppRobotoFont,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              CustomTitle(
                  title: AppLocalizations.of(context)!.shipping_address),
              addH(10.h),
              // First Name
              CustomField(
                textCon: _fNameCon,
                // prefixIcon: 'assets/svg/address_title.svg',
                hintText: AppLocalizations.of(context)!.first_name,
                brdrClr: ConstantColors.whiteGray,
              ),
              addH(10.h),
              // Last Name
              CustomField(
                textCon: _lNameCon,
                // prefixIcon: 'assets/svg/address_title.svg',
                hintText: AppLocalizations.of(context)!.last_name,
                brdrClr: ConstantColors.whiteGray,
              ),
              addH(10.h),

              // Address title
              CustomField(
                textCon: _addressCon,
                // prefixIcon: 'assets/svg/address_title.svg',
                hintText: AppLocalizations.of(context)!.address,
                brdrClr: ConstantColors.whiteGray,
              ),
              addH(10.h),

              // Address title
              CustomField(
                textCon: _cityCon,
                // prefixIcon: 'assets/svg/address_title.svg',
                hintText: AppLocalizations.of(context)!.city,
                brdrClr: ConstantColors.whiteGray,
              ),
              addH(10.h),
    /*          // Phone number
              CustomField(
                textCon: _postCodeCon,
                // prefixIcon: 'assets/sv/phone_num.svg',
                hintText: AppLocalizations.of(context)!.postal_Code,
                brdrClr: ConstantColors.whiteGray,
              ),
              addH(10.h),*/
              // Villa
              CustomField(
                textCon: _phoneCon,
                //  prefixIcon: 'assets/svgs/villa_number.svg',
                hintText: AppLocalizations.of(context)!.phone,
                brdrClr: ConstantColors.whiteGray,
                inputType: TextInputType.number,
              ),
              addH(16.h),

              //Save this information for next time
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 300.w,
                    height: 22.h,
                    child: Row(
                      children: [
                        Checkbox(
                          value: _saveInfo,
                          onChanged: (value) =>
                              setState(() => _saveInfo = value!),
                          splashRadius: 0,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context)!.save_this_information,
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontFamily: ConstantStrings.kAppRobotoFont,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              addH(10.h),
              // Save Button
              Center(
                child: CustomBtn(
                  btnSize: Size(330.w, 50.h),
                  onPressedFn: () {
                    if (_emailCon.text.isEmpty) {
                      Methods.showSnackbar(
                        msg: AppLocalizations.of(context)!.input +
                            " " +
                            AppLocalizations.of(context)!.email,
                        position: SnackPosition.TOP,
                      );
                      return;
                    }

                    if (_fNameCon.text.isEmpty) {
                      Methods.showSnackbar(
                        msg: AppLocalizations.of(context)!.input +
                            " " +
                            AppLocalizations.of(context)!.first_name,
                        position: SnackPosition.TOP,
                      );
                      return;
                    }


                    if (_lNameCon.text.isEmpty) {
                      Methods.showSnackbar(
                        msg: AppLocalizations.of(context)!.input +
                            " " +
                            AppLocalizations.of(context)!.last_name,
                        position: SnackPosition.TOP,
                      );
                      return;
                    }


                    if (_addressCon.text.isEmpty) {
                      Methods.showSnackbar(
                        msg: AppLocalizations.of(context)!.input +
                            " " +
                            AppLocalizations.of(context)!.address,
                        position: SnackPosition.TOP,
                      );
                      return;
                    }

                    if (_cityCon.text.isEmpty) {
                      Methods.showSnackbar(
                        msg: AppLocalizations.of(context)!.input +
                            " " +
                            AppLocalizations.of(context)!.city,
                        position: SnackPosition.TOP,
                      );
                      return;
                    }
                    if (_phoneCon.text.isEmpty) {
                      Methods.showSnackbar(
                        msg: AppLocalizations.of(context)!.input +
                            " " +
                            AppLocalizations.of(context)!.phone,
                        position: SnackPosition.TOP,
                      );
                      return;
                    }
                  /*  if (!_emailCon.text.isEmail) {
                      Methods.showSnackbar(
                        msg: ConstantStrings.kValidEmail,
                        position: SnackPosition.TOP,
                      );
                      return;
                    }
*/
                    //save guest user email in local
                    Preference.setGuestEmail(_emailCon.text);

                    _orderController.setGuestShippingAddress(
                      email: _emailCon.text,
                      lastName: _lNameCon.text,
                      firstName: _fNameCon.text,
                      address1: _addressCon.text,
                      province: '',
                      country: 'Iraq',
                      zip: '10010',
                      city: _cityCon.text,
                      checkoutId: '',
                      phone: _phoneCon.text,
                    );

                    /*Get.defaultDialog(
                      title: 'Processing...',
                      content: Obx(
                        () {
                          if (_orderController
                              .setGuestShipAddressLoading.value) {
                            return SizedBox(
                              height: 100.h,
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          } else {
                            Future.delayed(
                              const Duration(seconds: 1),
                              () {
                                Get.back();

                              },
                            );

                            return Center(
                              child: Text(
                                "Successfully ",
                              ),
                            );
                          }
                        },
                      ),
                    );*/
                  },
                  btnTxt: AppLocalizations.of(context)!.continue_to_shipping,
                ),
              ),
              addH(45.h),
            ],
          ),
        ),
      ),
    );
  }
}
