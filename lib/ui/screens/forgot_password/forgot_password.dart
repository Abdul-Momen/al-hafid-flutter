import 'package:alhafidh/constants/color.dart';
import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/helper/helper.dart';
import 'package:alhafidh/states/controller/auth.dart';
import 'package:alhafidh/ui/screens/forgot_password/body_view.dart';
import 'package:alhafidh/ui/screens/login/login.dart';
import 'package:alhafidh/ui/widgets/custom_app_bar.dart';
import 'package:alhafidh/ui/widgets/custom_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static String routeName = '/forgot_password';

  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passCon = TextEditingController();
  final TextEditingController _confirmPassCon = TextEditingController();
  final AuthController _authCon = Get.find<AuthController>();

  bool _isSent = false;
  bool _isVarified = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: SingleChildScrollView(
            child: _isSent
                ? _isVarified
                    ? getThirdView()
                    : getLastView()
                : getFirstView(),
          ),
        ),
      ),
    );
  }

  Widget getFirstView() {
    return BodyView(
      pageTitle: AppLocalizations.of(context)!.forgot_Password,
      icon: 'assets/svg/lock.svg',
      txt: AppLocalizations.of(context)!.enter_email_to,
      btnFn: () {
        _authCon.resetPassword(email: _emailCon.text);
        Get.defaultDialog(
          title: AppLocalizations.of(context)!.sending,
          content: Obx(
            () {
              if (_authCon.forgetPassLoading.value) {
                return SizedBox(
                  height: 90.h,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                if (_authCon.isSentEmail.value) {
                  Future.delayed(
                    const Duration(seconds: 1),
                    () {
                      setState(() {
                        _isSent = true;
                        Get.back();
                      });
                    },
                  );
                  return SizedBox(
                    height: 90.h,
                    width: double.infinity,
                    child: Center(
                      child:
                          Text(AppLocalizations.of(context)!.sent_successful),
                    ),
                  );
                } else {
                  return Center(
                    child: Text(
                      AppLocalizations.of(context)!.no_Data_Found,
                    ),
                  );
                }
              }
            },
          ),
        );
      },
      btnTxt: AppLocalizations.of(context)!.send,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          addH(40.h),
          fieldTitle(AppLocalizations.of(context)!.email_Address),
          addH(10.h),
          CustomField(
            textCon: _emailCon,
            hintText: AppLocalizations.of(context)!.enter_your_email,
          ),
        ],
      ),
    );
  }

  Widget getSecondView() {
    return BodyView(
      pageTitle: 'Verify Your Email',
      icon: 'assets/svg/email.svg',
      txt: 'Please Enter The 4 Digit Code Sent To\n${_emailCon.text}',
      btnFn: () => setState(() => _isVarified = true),
      btnTxt: 'Verify',
      child: Column(
        children: [
          SizedBox(
            width: 260.w,
            height: 65.h,
            child: PinCodeTextField(
              appContext: context,
              length: 4,
              textStyle: TextStyle(
                fontSize: 40.sp,
                fontFamily: ConstantStrings.kFontFamily,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.underline,
                fieldOuterPadding: EdgeInsets.symmetric(horizontal: 5.w),
                fieldHeight: 60.h,
                fieldWidth: 55.w,
                selectedColor: ConstantColors.k06C8FF,
                inactiveColor: ConstantColors.k06C8FF,
                activeColor: ConstantColors.k06C8FF,
                borderWidth: 2.w,
              ),
              onChanged: (value) {},
            ),
          ),
          addH(10.h),
          InkWell(
            onTap: () {
              // TODO: re-send otp code request to server
            },
            child: Text(
              'Resend Code',
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
                fontFamily: ConstantStrings.kFontFamily,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getLastView() {
    return BodyView(
      pageTitle: AppLocalizations.of(context)!.check_your_email,
      icon: 'assets/svg/email.svg',
      txt:
          '${AppLocalizations.of(context)!.reset_password_link}\n${_emailCon.text}',
      btnFn: () => setState(() {
        //_isVarified = true;
        Get.toNamed(LoginScreen.routeName);
      }),
      btnTxt: AppLocalizations.of(context)!.logIn,
      child: Column(
        children: [
          /*  SizedBox(
            width: 260.w,
            height: 65.h,
            child: PinCodeTextField(
              appContext: context,
              length: 4,
              textStyle: TextStyle(
                fontSize: 40.sp,
                fontFamily: ConstantStrings.kFontFamily,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.underline,
                fieldOuterPadding: EdgeInsets.symmetric(horizontal: 5.w),
                fieldHeight: 60.h,
                fieldWidth: 55.w,
                selectedColor: ConstantColors.k06C8FF,
                inactiveColor: ConstantColors.k06C8FF,
                activeColor: ConstantColors.k06C8FF,
                borderWidth: 2.w,
              ),
              onChanged: (value) {},
            ),
          ),
          addH(10.h),
          InkWell(
            onTap: () {
              // TODO: re-send otp code request to server
            },
            child: Text(
              'Resend Code',
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
                fontFamily: ConstantStrings.kFontFamily,
              ),
            ),
          )*/
        ],
      ),
    );
  }

  Widget getThirdView() {
    return BodyView(
      pageTitle: 'Create New Password',
      icon: 'assets/svg/unlock.svg',
      txt: 'You Password Must be Different\nfrom Previously Used Password',
      btnFn: () => Get.toNamed(LoginScreen.routeName),
      btnTxt: 'Save',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          fieldTitle('New Password'),
          addH(10.h),
          CustomField(
            textCon: _passCon,
            hintText: 'Enter New Password',
            isPassField: true,
          ),
          addH(20.h),
          fieldTitle('New Password'),
          addH(10.h),
          CustomField(
            textCon: _passCon,
            hintText: 'Enter New Password',
            isPassField: true,
          ),
        ],
      ),
    );
  }

  Widget fieldTitle(String txt) {
    return Text(
      txt,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: Colors.grey.shade700,
        fontFamily: ConstantStrings.kFontFamily,
      ),
    );
  }
}
