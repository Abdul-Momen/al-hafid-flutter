import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/states/controller/auth.dart';
import 'package:alhafidh/states/utils/methods.dart';
import 'package:alhafidh/ui/screens/login/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../constants/color.dart';
import '../../../helper/helper.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/custom_field.dart';
import '../../widgets/custom_header.dart';

class RegisterScreen extends StatefulWidget {
  static String routeName = '/register';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final AuthController _authCon = Get.find<AuthController>();


  bool checkFlag = false;
  bool _isRegistering = false;


  final TextEditingController _fNameCon = TextEditingController();
  final TextEditingController _lNameCon = TextEditingController();
  final TextEditingController _mobileNoCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();
  final TextEditingController _confirmPasswordCon = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Login Header
             CustomHeader(
              title: AppLocalizations.of(context)!.register,
            ),
            addH(16.h),
            // Email Field

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.first_name,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: ConstantStrings.kAppRobotoBold,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  addH(10.h),
                  CustomField(
                    textCon: _fNameCon,
                    hintText: AppLocalizations.of(context)!.first_name,
                    inputType: TextInputType.name,
                    txtSize: 12.sp,
                  ),
                  addH(5.h),

                  Text(
                    AppLocalizations.of(context)!.last_name,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: ConstantStrings.kAppRobotoBold,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  addH(10.h),
                  CustomField(
                    textCon: _lNameCon,
                    hintText:AppLocalizations.of(context)!.last_name,
                    inputType: TextInputType.name,
                    txtSize: 12.sp,
                  ),
                  addH(5.h),

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
                    hintText: AppLocalizations.of(context)!.enter_your_email,
                    inputType: TextInputType.emailAddress,
                    txtSize: 12.sp,
                  ),
                  //
                  // addH(5.h),
                  //
                  // Text(
                  //   'Phone Number',
                  //   style: TextStyle(
                  //     fontSize: 15.sp,
                  //     fontFamily: ConstantStrings.kAppRobotoBold,
                  //     fontWeight: FontWeight.bold,
                  //     color: Colors.black,
                  //   ),
                  // ),
                  // addH(10.h),
                  // CustomField(
                  //   textCon: _mobileNoCon,
                  //   hintText: 'Your Number',
                  //   inputType: TextInputType.number,
                  //   txtSize: 12.sp,
                  // ),
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
                    textCon: _passwordCon,
                    hintText: AppLocalizations.of(context)!.enter_your_password,
                    isPassField: true,
                    txtSize: 12.sp,
                  ),

                  addH(5.h),

                  Text(
                    AppLocalizations.of(context)!.confirm_Password,
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
                    textCon: _confirmPasswordCon,
                    hintText: AppLocalizations.of(context)!.enter_confirm_Password,
                    isPassField: true,
                    txtSize: 12.sp,
                  ),
                ],
              ),
            ),

            addH(16.h),

            //register Button
            CustomBtn(
              onPressedFn: () async {
                // Get.toNamed(LoginScreen.routeName);
                if (_fNameCon.text.isEmpty ||
                    _lNameCon.text.isEmpty ||
                   // _mobileNoCon.text.isEmpty ||
                    _emailCon.text.isEmpty ||
                    _passwordCon.text.isEmpty ||
                    _confirmPasswordCon.text.isEmpty) {
                  Methods.showSnackbar(
                    msg: ConstantStrings.kEmptyFields,
                  );
                  return;
                }
                if (!_emailCon.text.isEmail) {
                  Methods.showSnackbar(msg: ConstantStrings.kValidEmail);
                  return;
                }
                if (_passwordCon.text.length < 6 ||
                    _confirmPasswordCon.text.length < 6) {
                  Methods.showSnackbar(
                    msg: ConstantStrings.kPasswordLength,
                  );
                  return;
                }
                if (_passwordCon.text != _confirmPasswordCon.text) {
                  Methods.showSnackbar(
                    msg: AppLocalizations.of(context)!.passwords_do_not_match,
                  );
                  return;
                }

                //pass data
                bool regFlag = await _authCon.register(
                  fName: _fNameCon.text,
                  lName: _lNameCon.text,
                  phoneNum: _mobileNoCon.text,
                  email: _emailCon.text,
                  password:  _passwordCon.text,
                  cPassword: _confirmPasswordCon.text,
                );

                if (regFlag) {
                  Methods.showSnackbar(
                    icon: Icons.check,
                    iconClr: Colors.green,
                    title: AppLocalizations.of(context)!.registration_Completed,
                    msg:  AppLocalizations.of(context)!.now_you_can_login,
                  );
                  Future.delayed(
                    const Duration(seconds: 2),
                        () => Get.offAllNamed(
                      LoginScreen.routeName,
                    ),
                  );
                } else {
                  Methods.showSnackbar(
                    msg: _authCon.resMgs,
                  );
                  return;
                }
              },
              btnTxt: _isRegistering ? AppLocalizations.of(context)!.processing : AppLocalizations.of(context)!.register,
              btnColor: ConstantColors.lightRed,
              txtColor: ConstantColors.white,
              btnSize: Size(350.w, 50.h),
            ),

            addH(30.h),
            // Sign Up Text
            RichText(
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
            addH(35.h),
          ],
        ),
      ),
    );
  }
}
