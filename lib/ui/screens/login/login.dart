import 'package:alhafidh/constants/color.dart';
import 'package:alhafidh/states/controller/auth.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/states/utils/methods.dart';
import 'package:alhafidh/ui/screens/forgot_password/forgot_password.dart';
import 'package:alhafidh/ui/screens/home/home.dart';
import 'package:alhafidh/ui/widgets/custom_btn.dart';
import 'package:alhafidh/ui/widgets/custom_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../constants/string.dart';
import '../../../helper/helper.dart';
import '../../widgets/custom_header.dart';
import '../register/register.dart';



class LoginScreen extends StatefulWidget {
  static String routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController _authCon = Get.find<AuthController>();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passCon = TextEditingController();

  bool _rememberMe = false;
  bool _loggingIn = false;

@override
  void initState() {
  _rememberMe = Preference.getRememberMeFlag();
  if (_rememberMe) {
    _emailCon.text = Preference.getLoginEmail();
    _passCon.text = Preference.getLoginPass();
  }

  _authCon.isLoggingIn.listen((value) {
    if (!value && _authCon.isLoggedIn.value) {
      //Get.offAllNamed(HomeScreen.routeName);
      // Get.offAllNamed(
      //   CheckoutScreen.routeName,
      // );
    }
  }); 
  super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Login Header
            CustomHeader(
              title:AppLocalizations.of(context)!.logIn,
            ),
            addH(16.h),
            // Email Field

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.email_Address,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: ConstantStrings.kAppRobotoBold,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  addH(10.h),
                  CustomField(
                    textCon: _emailCon,
                    hintText:  AppLocalizations.of(context)!.enter_your_email,
                    inputType: TextInputType.emailAddress,
                    txtSize: 13.sp,
                  ),
                  addH(5.h),
                  Text(
                    AppLocalizations.of(context)!.password,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: ConstantStrings.kAppRobotoBold,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  addH(10.h),
                  // Password Field
                  CustomField(
                    textCon: _passCon,
                    hintText:  AppLocalizations.of(context)!.enter_your_password,
                    isPassField: true,
                    txtSize: 13.sp,

                  ),
                ],
              ),
            ),

            addH(16.h),
            // Forgot Password
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 165.w,
                    height: 22.h,
                    child: Row(
                      children: [
                        Checkbox(
                          value: _rememberMe,
                          onChanged: (value) =>
                              setState(() => _rememberMe = value!),
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
                          AppLocalizations.of(context)!.stay_logged_in,
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontFamily: ConstantStrings.kAppRobotoFont,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(ForgotPasswordScreen.routeName,);
                    },
                    child: Text(
                      AppLocalizations.of(context)!.forgot_Password,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontFamily: ConstantStrings.kAppRobotoFont,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            addH(50.h),

            //Login Button
            CustomBtn(
              onPressedFn: () {
              /*Get.offAllNamed(
                  CheckoutScreen.routeName,
                );*/
                if (_emailCon.text.isEmpty || _passCon.text.isEmpty) {
                  Methods.showSnackbar(msg: ConstantStrings.kEmptyFields);
                  return;
                }
                if (!_emailCon.text.isEmail) {
                  Methods.showSnackbar(
                    msg: ConstantStrings.kValidEmail,
                  );
                  return;
                }
                if (_passCon.text.length < 6) {
                  Methods.showSnackbar(
                    msg: ConstantStrings.kPasswordLength,
                  );
                  return;
                }
                Preference.setLoginEmail(_emailCon.text);
                Preference.setLoginPass(_passCon.text);

                if (_rememberMe) {
                  Preference.setRememberMeFlag(true);
                  Preference.setLoginEmail(_emailCon.text);
                  Preference.setLoginPass(_passCon.text);
                } else {
                  Preference.setLoginEmail(_emailCon.text);
                  Preference.setLoginPass(_passCon.text);
                  Preference.setRememberMeFlag(false);
                }
                setState(() => _loggingIn = true);
                _authCon.loginUser(
                  email: _emailCon.text,
                  password: _passCon.text,
                );

                Get.defaultDialog(
                  title: AppLocalizations.of(context)!.logging,
                  content: Obx(
                    () {
                      if (_authCon.isLoggingIn.value) {
                        return SizedBox(
                          height: 110.h,
                          child: Column(
                            children: [
                              Center(
                                child: Image.asset(
                                  'assets/images/alhafidh_icon_white.png',
                                  width: 70.w,
                                  height: 70.h,
                                ),
                              ),
                              const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ],
                          ),
                        );
                      } else {
                        Future.delayed(
                          const Duration(seconds: 1),
                          () => setState(() => _loggingIn = false),
                        );
                        if (_authCon.isLoggedIn.value) {
                          Future.delayed(
                            const Duration(seconds: 2),
                            () {
                              setState(() {
                                Get.back();
                                Get.offAllNamed(HomeScreen.routeName);
                              });
                            },
                          );
                          return SizedBox(
                            height: 100.h,
                            width: double.infinity,
                            child: Column(
                              children: [
                                Center(
                                  child: Image.asset(
                                    'assets/images/alhafidh_icon_white.png',
                                    width: 70.w,
                                    height: 70.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                 Center(
                                  child: Text(AppLocalizations.of(context)!.login_Successful),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return  Center(
                            child: Text(AppLocalizations.of(context)!.email_Password_incorrect),
                          );
                        }
                      }
                    },
                  ),
                );
              },
              btnTxt: _loggingIn ? AppLocalizations.of(context)!.processing : AppLocalizations.of(context)!.logIn,
              btnColor: ConstantColors.lightRed,
              txtColor: ConstantColors.white,
              btnSize: Size(350.w,50.h),
            ),

            addH(70.h),
            // Sign Up Text
            RichText(
              text: TextSpan(
                text: AppLocalizations.of(context)!.dont_have_ac,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: ConstantStrings.kAppRobotoFont,
                  color: Colors.grey.shade600,
                ),
                children: [
                  TextSpan(
                    text: AppLocalizations.of(context)!.register,
                     recognizer: TapGestureRecognizer()
                       ..onTap = () => Get.toNamed(RegisterScreen.routeName),
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
            addH(35.h),
          ],
        ),
      ),
    );
  }
}
