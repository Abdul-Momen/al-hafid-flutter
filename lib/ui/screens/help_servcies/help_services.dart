import 'package:alhafidh/constants/color.dart';
import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/helper/helper.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/ui/screens/faQ/faq.dart';
import 'package:alhafidh/ui/screens/help_servcies/services_item.dart';
import 'package:alhafidh/ui/screens/store_locator/store_locator.dart';
import 'package:alhafidh/ui/screens/warrenty_screen/warranty_screen.dart';
import 'package:alhafidh/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpAndServices extends StatefulWidget {
  static String routeName = '/helpservices';

  const HelpAndServices({Key? key}) : super(key: key);

  @override
  State<HelpAndServices> createState() => _HelpAndServicesState();
}

class _HelpAndServicesState extends State<HelpAndServices> {
  List<String> serImages = [
    'assets/images/alhafid_sr.png',
    'assets/images/free_deli.png',
    'assets/images/online_pay.png',
    'assets/images/instalation.png',
    'assets/images/warranty.png',
    'assets/images/faq.png',
    'assets/images/store_locator.png',
  ];

  @override
  Widget build(BuildContext context) {
    List<String> serName = [
      AppLocalizations.of(context)!.service1_name,
      AppLocalizations.of(context)!.service2_name,
      AppLocalizations.of(context)!.service3_name,
      AppLocalizations.of(context)!.service4_name,
      AppLocalizations.of(context)!.service5_name,
      AppLocalizations.of(context)!.service6_name,
      AppLocalizations.of(context)!.service7_name,
    ];

    List<String> serDts = [
      AppLocalizations.of(context)!.service1_des,
      AppLocalizations.of(context)!.service2_des,
      AppLocalizations.of(context)!.service3_des,
      AppLocalizations.of(context)!.service4_des,
      AppLocalizations.of(context)!.service5_des,
      AppLocalizations.of(context)!.service6_des,
      AppLocalizations.of(context)!.service7_des,
    ];

    List<String> serTxt = [
      AppLocalizations.of(context)!.service1_btn,
      '',
      '',
      '',
      AppLocalizations.of(context)!.service5_btn,
      AppLocalizations.of(context)!.service6_btn,
      AppLocalizations.of(context)!.service7_btn,
    ];

    return Scaffold(
      appBar: CustomAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            addH(15.h),
            Text(
              AppLocalizations.of(context)!.help_Services,
              style: TextStyle(
                fontSize: 20.sp,
                fontFamily: ConstantStrings.kFontFamily,
                fontWeight: FontWeight.bold,
              ),
            ),
            addH(15.h),
            SizedBox(
              height: 650.h,
              width: double.infinity,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 14.0,
                //shrinkWrap: true,
                children: List.generate(
                  7,
                  (index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: ConstantColors.lightGray,
                          width: 1,
                        ),
                      ),
                      child: ServicesItem(
                        img: serImages[index],
                        name: serName[index],
                        dtls: serDts[index],
                        btnTxt: serTxt[index],
                        onclik: () {
                          setState(() {
                            if (index == 0) {
                              if(Preference.getIsArabicFlag()){
                                _launchURL('https://alhafidh.com/pages/service-request');
                              }else {
                                _launchURL('https://alhafidh.com/en/pages/service-request');
                              }
                            } else if (index == 4) {
                              Get.toNamed(WarrantyScreen.routeName);
                            } else if (index == 5) {
                              Get.toNamed(FaQ.routeName);
                            } else if (index == 6) {
                              Get.toNamed(StoreLocatorScreen.routeName);
                            }
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _launchURL(String urls) async {
    final Uri url = Uri.parse(urls);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $urls');
    }
  }
}
