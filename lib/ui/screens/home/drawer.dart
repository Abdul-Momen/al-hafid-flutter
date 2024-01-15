import 'package:alhafidh/constants/color.dart';
import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/helper/helper.dart';
import 'package:alhafidh/l10n/l10n.dart';
import 'package:alhafidh/states/GraphqlConfig/graphql_provider.dart';
import 'package:alhafidh/states/controller/home.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/ui/screens/about_us/about_us.dart';
import 'package:alhafidh/ui/screens/address_book/address_book.dart';
import 'package:alhafidh/ui/screens/contact_us/contact.dart';
import 'package:alhafidh/ui/screens/faQ/faq.dart';
import 'package:alhafidh/ui/screens/help_servcies/help_services.dart';
import 'package:alhafidh/ui/screens/home/drawer_menu.dart';
import 'package:alhafidh/ui/screens/home/logo.dart';
import 'package:alhafidh/ui/screens/login/login.dart';
import 'package:alhafidh/ui/screens/media_center/media_center.dart';
import 'package:alhafidh/ui/screens/my_orders/orders.dart';
import 'package:alhafidh/ui/screens/service_locator/service_locator.dart';
import 'package:alhafidh/ui/screens/store_locator/store_locator.dart';
import 'package:alhafidh/ui/screens/wishlist/wishlist.dart';
import 'package:alhafidh/ui/widgets/custom_btn.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeDrawer extends StatefulWidget {
  final void Function(int) navigatingFn;

  //final BuildContext context;
  // final UserModel userDetails;

  HomeDrawer({
    Key? key,
    //required this.userDetails,
    required this.navigatingFn,
    // required this.context,
  }) : super(key: key);

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  //check is frist time
  int _selectedBtnIndex = Preference.getIsArabicFlag() ? 0 : 1;

  final HomeController _homeCon = Get.find();

  @override
  Widget build(BuildContext context) {
    final List<String> _menuIcons = [
      // section 1
      'assets/svg/home.svg',
      'assets/svg/categories.svg',
      'assets/svg/services.svg',
      //'assets/svg/notifications.svg',
      'assets/svg/store_locator.svg',
      'assets/svg/store_locator.svg',
      'assets/svg/contact_us.svg',
      'assets/svg/contact_us.svg',
      // section 2
      'assets/svg/my_account.svg',
      'assets/svg/address_book.svg',
      'assets/svg/wishlist.svg',
      'assets/svg/orders.svg',
      'assets/svg/logout.svg',
    ];

    final List<String> _menuTitle = [
      // section 1
      AppLocalizations.of(context)!.home,
      AppLocalizations.of(context)!.categories,
      AppLocalizations.of(context)!.help_Services,
      // AppLocalizations.of(context)!.notifications,
      AppLocalizations.of(context)!.service_Center_lo,
      AppLocalizations.of(context)!.store_Locator,
      AppLocalizations.of(context)!.contact_Us,
      AppLocalizations.of(context)!.fAQ,
      // section 2
      AppLocalizations.of(context)!.myAccount,
      AppLocalizations.of(context)!.address_Book,
      AppLocalizations.of(context)!.wishlist,
      AppLocalizations.of(context)!.my_Orders,
      if (Preference.getLoggedInFlag()) AppLocalizations.of(context)!.log_Out,
      if (!Preference.getLoggedInFlag()) AppLocalizations.of(context)!.logIn,
    ];

    final List<VoidCallback> _menuOnTapFns = [
      // section 1
      () {},
      () {},
      () => Get.toNamed(HelpAndServices.routeName),
      // () => Get.toNamed(NotificationScreen.routeName),
      () => Get.toNamed(ServiceLocatorScreen.routeName),
      () => Get.toNamed(StoreLocatorScreen.routeName),
      () => Get.toNamed(ContactUs.routeName),
      () => Get.toNamed(FaQ.routeName),

      // section 2
      () {},
      () => Get.toNamed(AddressBookScreen.routeName),
      () => Get.toNamed(Wishlist.routeName),
      () => Get.toNamed(Orders.routeName),
      if (Preference.getLoggedInFlag())
        () => AwesomeDialog(
              context: Get.context!,
              dialogType: DialogType.WARNING,
              animType: AnimType.BOTTOMSLIDE,
              title: AppLocalizations.of(context)!.log_Out,
              desc: AppLocalizations.of(context)!.are_you_logout,
              btnCancelOnPress: () {},
              btnOkOnPress: () {
                Get.offAndToNamed(LoginScreen.routeName);
                Preference.logOut();
              },
            ).show(),
      if (!Preference.getLoggedInFlag())
        () => Get.toNamed(LoginScreen.routeName),
    ];

    _menuOnTapFns[0] = () => widget.navigatingFn(0);
    _menuOnTapFns[1] = () => widget.navigatingFn(1);
    _menuOnTapFns[7] = () => widget.navigatingFn(2);

    rebuildAllChildren(context);

    return Drawer(
      width: 300.w,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: ConstantColors.lightRed,
          width: 1,
        ),
        borderRadius: Preference.getIsArabicFlag()?BorderRadius.only(
          topLeft: Radius.circular(65.r),
          bottomLeft: Radius.circular(55.r),
        ): BorderRadius.only(
          topRight: Radius.circular(65.r),
          bottomRight: Radius.circular(55.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drawer Header
          SizedBox(
            height: 100.h,
            width: double.infinity,
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/drawer_bg.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                // Logo
                Center(
                    child: HomeLogo(
                  h: 30.h,
                )),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(right: 15.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Drawer Header button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Translation custom btn
                    CustomBtn(
                      onPressedFn: () {
                        setState(() {
                          _selectedBtnIndex = 0;
                          Get.updateLocale(L10n.all[0]);
                          Preference.setIsArabicFlag(true);

                          GraphqlClass.prinstLnConde();


                          //get Band Product
                          _homeCon.getBrandProducts(190864523323);

                          //get special products
                          _homeCon.getSpecialProducts(195594190907);

                          //get new arrival
                          _homeCon.getNewArrivalProducts(279780884539);

                          //get best seller
                          _homeCon.getBestSellerProducts(194856681531,true);

                          //get all product
                          _homeCon.getAllProducts(264319205435,true);
                        });
                      },
                      btnTxt: AppLocalizations.of(context)!.arabic_lan,
                      btnSize: Size(100.w, 30.h),
                      txtSize: 11.sp,
                      btnBorderColor: ConstantColors.k0F98FF,
                      txtColor: _selectedBtnIndex == 0
                          ? ConstantColors.white
                          : Colors.black,
                      btnColor: _selectedBtnIndex == 0
                          ? ConstantColors.lightRed
                          : Colors.white,
                    ),

                    // Translation custom btn
                    CustomBtn(
                      onPressedFn: () {
                        setState(() {
                          _selectedBtnIndex = 1;
                          Get.updateLocale(L10n.all[1]);
                          Preference.setIsArabicFlag(false);
                          GraphqlClass.prinstLnConde();

                          //get Band Product
                          _homeCon.getBrandProducts(190864523323);

                          //get special products
                          _homeCon.getSpecialProducts(195594190907);

                          //get new arrival
                          _homeCon.getNewArrivalProducts(279780884539);

                          //get best seller
                          _homeCon.getBestSellerProducts(194856681531,true);

                          //get all product
                          _homeCon.getAllProducts(264319205435,true);
                        });
                      },
                      txtSize: 11.sp,
                      btnTxt: AppLocalizations.of(context)!.english_lan,
                      btnSize: Size(100.w, 30.h),
                      btnBorderColor: ConstantColors.k0F98FF,
                      txtColor: _selectedBtnIndex == 1
                          ? ConstantColors.white
                          : Colors.black,
                      btnColor: _selectedBtnIndex == 1
                          ? ConstantColors.lightRed
                          : Colors.white,
                    ),
                  ],
                ),

                // Store title
                buildMenuTitle(AppLocalizations.of(context)!.menu_Store),

                // Menu Section 1
                SizedBox(
                  height: 270.h,
                  child: ListView.builder(
                    itemCount: 7,
                    itemBuilder: (_, index) {
                      return DrawerMenu(
                        onTapFn: _menuOnTapFns[index],
                        title: _menuTitle[index],
                        icon: _menuIcons[index],
                      );
                    },
                  ),
                ),

                // Divider
                buildDivider(),

                // Account title
                buildMenuTitle(AppLocalizations.of(context)!.menu_Account),

                // Menu Section 2
                SizedBox(
                  height: 215.h,
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (_, index) {
                      return DrawerMenu(
                        onTapFn: _menuOnTapFns[7 + index],
                        title: _menuTitle[7 + index],
                        icon: _menuIcons[7 + index],
                      );
                    },
                  ),
                ),

                //footer image
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    footerImg('assets/svg/fb.svg',
                        'https://www.facebook.com/alhafidh.iraq'),
                    Container(
                      width: 30.w,
                      height: 30.h,
                      margin: EdgeInsets.only(right: 10.w, top: 15.h),
                      child: InkWell(
                        onTap: () {
                          _launchSocialMediaAppIfInstalled(
                              url: 'https://www.instagram.com/alhafidh.iraq');
                        },
                        child: Center(
                          child: Image.asset(
                            'assets/images/instra.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    footerImg('assets/svg/ytb.svg',
                        "https://www.youtube.com/alhafidhgtd"),
                    footerImg('assets/svg/ln.svg',
                        "https://www.linkedin.com/company/al-hafidh-group-trading/"),
                  ],
                ),

                addH(10.h),

                //
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        Get.toNamed(AboutUs.routeName);
                      },
                      child:  Text(
                        AppLocalizations.of(context)!.aboutUs,
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    addW(20.w),
                    InkWell(
                      onTap: (){
                        Get.toNamed(MediaCenterScreen.routeName);
                      },
                      child:  Text(
                        AppLocalizations.of(context)!.mediaCenter,
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider() {
    return Divider(
      color: Colors.grey,
      thickness: 0.2,
      indent: 15.w,
      endIndent: 15.w,
    );
  }

  Widget footerImg(String svgImg, String url) {
    return Container(
      width: 30.w,
      height: 30.h,
      margin: EdgeInsets.only(right: 10.w, top: 15.h),
      child: InkWell(
        onTap: () {
          _launchSocialMediaAppIfInstalled(url: url);
        },
        child: Center(
          child: SvgPicture.asset(
            svgImg,
            height: 30.h,
            width: 30.w,
            allowDrawingOutsideViewBox: true,
          ),
        ),
      ),
    );
  }

  Future<void> _launchSocialMediaAppIfInstalled({
    required String url,
  }) async {
    try {
      bool launched = await launch(url,
          forceSafariVC: false); // Launch the app if installed!
      if (!launched) {
        launch(url); // Launch web view if app is not installed!
      }
    } catch (e) {
      launch(url); // Launch web view if app is not installed!
    }
  }

  _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget buildMenuTitle(
    String title,
  ) {
    return Padding(
      padding: EdgeInsets.only(left: 18.w),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          fontFamily: ConstantStrings.kAppRobotoBold,
          color: ConstantColors.lightRed,
        ),
      ),
    );
  }

  void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }
}
