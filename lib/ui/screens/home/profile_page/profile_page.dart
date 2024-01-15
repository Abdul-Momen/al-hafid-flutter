import 'package:alhafidh/constants/color.dart';
import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/helper/helper.dart';
import 'package:alhafidh/states/controller/home.dart';
import 'package:alhafidh/states/controller/order.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/states/models/customer_model.dart';
import 'package:alhafidh/ui/screens/home/profile_page/edit_view.dart';
import 'package:alhafidh/ui/screens/home/profile_page/general_view.dart';
import 'package:alhafidh/ui/screens/login/login.dart';
import 'package:alhafidh/ui/widgets/custom_btn.dart';
import 'package:alhafidh/ui/widgets/custom_login_check.dart';
import 'package:alhafidh/ui/widgets/custom_title.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  final HomeController homeController;
  final VoidCallback backFn;

  const ProfilePage({
    Key? key,
    required this.backFn,
    required this.homeController,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfilePage> {
  bool _showEditView = false;
  CustomerModel? uModel;
  bool isLoggedId = false;
  final OrderController _orderCon = Get.find<OrderController>();

  @override
  void initState() {
    isLoggedId = Preference.getLoggedInFlag();
    //get preference to user details
    if (isLoggedId) {
      uModel = Preference.getUserDetails();
    }

    if (uModel != null) {
      _orderCon.getMyOrders(cEmail: uModel!.customer.email);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: isLoggedId == true
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      if (uModel == null)
                        Center(
                            child: Text(AppLocalizations.of(context)!
                                .customer_info_em)),
                      if (uModel != null)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            addH(20.h),
                            CustomTitle(
                              onBackTapFn: widget.backFn,
                              isBack: true,
                              title: AppLocalizations.of(context)!.my_profile,
                              suffixIcon: _showEditView
                                  ? 'assets/svg/edit.svg'
                                  : 'assets/svg/edit.svg',
                              siffixSize: _showEditView ? 18 : 25,
                              suffixOnTapFn: () => setState(
                                () {
                                  _showEditView = !_showEditView;
                                  if (_showEditView) {
                                  } else {}
                                },
                              ),
                            ),
                            // dp
                            Center(
                              child: Container(
                                width: 80.w,
                                height: 80.h,
                                padding: const EdgeInsets.all(1),
                                margin: EdgeInsets.only(bottom: 10.h),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.black, width: 1.w),
                                ),
                                child: Center(
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/images/profile_img.png',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // user name
                            if (!_showEditView)
                              Column(
                                children: [
                                  Center(
                                    child: Text(
                                      "${uModel!.customer.firstName} ${uModel!.customer.lastName}",
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily:
                                            ConstantStrings.kAppRobotoFont,
                                      ),
                                    ),
                                  ),
                                  //   addH(10.h),
                                  /* Center(
                                    child: Text(
                                          "Your Points Balance: ${uModel!.customer.lastName}",
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: ConstantStrings.kAppRobotoFont,
                                      ),
                                    ),
                                  ),*/
                                ],
                              ),
                            _showEditView
                                ? EditView(
                                    userModel: uModel!,
                                  )
                                : GeneralView(
                                    uModel: uModel!,
                                  ),
                          ],
                        )
                    ],
                  ),
                )
              : const CustomLoginCheck(),
        ),
      ),
      bottomSheet: isLoggedId == true
          ? Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 28.0),
                child: SizedBox(
                    height: 50.h,
                    child: Center(
                        child: CustomBtn(
                      btnColor: Colors.red,
                      onPressedFn: () {
                        if (_orderCon.myOrdersIsEmpty.value) {
                          Get.dialog(
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Material(
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 10),
                                            Text(
                                              AppLocalizations.of(context)!
                                                  .warning,
                                              textAlign: TextAlign.center,
                                            ),
                                            const SizedBox(height: 15),
                                            Text(
                                              AppLocalizations.of(context)!
                                                  .do_you_r,
                                              textAlign: TextAlign.center,
                                            ),
                                            const SizedBox(height: 20),
                                            //Buttons
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      minimumSize:
                                                          const Size(0, 45),
                                                      primary: ConstantColors
                                                          .grayBlack,
                                                      onPrimary: const Color(
                                                          0xFFFFFFFF),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                    child: Text(
                                                      AppLocalizations.of(
                                                              context)!
                                                          .cancel,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Expanded(
                                                  child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      minimumSize:
                                                          const Size(0, 45),
                                                      primary: Colors.red,
                                                      onPrimary: const Color(
                                                          0xFFFFFFFF),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      print('c id+ ' +
                                                          uModel!.customer.id
                                                              .replaceAll(
                                                                  new RegExp(
                                                                      r'[^0-9]'),
                                                                  ''));
                                                      widget.homeController
                                                          .deleteAccount(
                                                              int.parse(uModel!
                                                                  .customer.id
                                                                  .replaceAll(
                                                                      new RegExp(
                                                                          r'[^0-9]'),
                                                                      '')));
                                                      Get.defaultDialog(
                                                        title:
                                                            AppLocalizations.of(
                                                                    context)!
                                                                .processing,
                                                        content: Obx(
                                                          () {
                                                            if (widget
                                                                .homeController
                                                                .deleteAccountLoading
                                                                .value) {
                                                              return SizedBox(
                                                                height: 100.h,
                                                                child:
                                                                    const Center(
                                                                  child:
                                                                      CircularProgressIndicator(),
                                                                ),
                                                              );
                                                            } else {
                                                              //go next page
                                                              Future.delayed(
                                                                const Duration(
                                                                    seconds: 0),
                                                                () {
                                                                  setState(() {
                                                                    Get.back();
                                                                    Get.back();
                                                                    Get.offAndToNamed(
                                                                        LoginScreen
                                                                            .routeName);
                                                                    Preference
                                                                        .logOut();
                                                                  });
                                                                },
                                                              );
                                                              return Text(
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .account_deleted);
                                                            }
                                                          },
                                                        ),
                                                      );
                                                    },
                                                    child: Text(
                                                      AppLocalizations.of(
                                                              context)!
                                                          .yes,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          Get.defaultDialog(
                              title: AppLocalizations.of(context)!.warning,
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        AppLocalizations.of(context)!.if_you_w),
                                    InkWell(
                                      onTap: () {
                                        // launchEmailSubmission();
                                      },
                                      child: const Text(
                                        'alhafidhecommerce@gmail.com',
                                        style:
                                            TextStyle(color: Colors.blueAccent),
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                        }
                      },
                      btnTxt: AppLocalizations.of(context)!.delete_account,
                    ))),
              ),
            )
          : SizedBox.shrink(),
    );
  }
}
