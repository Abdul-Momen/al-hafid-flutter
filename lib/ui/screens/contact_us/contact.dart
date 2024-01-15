import 'dart:io';

import 'package:alhafidh/constants/color.dart';
import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/helper/helper.dart';
import 'package:alhafidh/states/utils/methods.dart';
import 'package:alhafidh/ui/widgets/custom_app_bar.dart';
import 'package:alhafidh/ui/widgets/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ContactUs extends StatefulWidget {
  static String routeName = '/contact';

  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Column(
        children: [
          CustomTitle(title: AppLocalizations.of(context)!.contact_Us),
          Stack(
            children: [
              Center(
                  child: Image.asset(
                    'assets/images/contact_bg.png',
                    height: 90,
                    width: 90,
                  )),
              const Positioned(
                top: 0,
                bottom: 0,
                right: 0,
                left: 0,
                child: Center(child: Icon(Icons.call)),
              )
            ],
          ),
          addH(10.h),
          Center(
            child: Text(
              AppLocalizations.of(context)!.for_inquiries_regarding,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 19.sp,
                fontWeight: FontWeight.bold,
                fontFamily: ConstantStrings.kAppRobotoFont,
              ),
            ),
          ),
          addH(20.h),
          CustomContainer(
            img: Icons.call_rounded,
            topTxt:   AppLocalizations.of(context)!.call_our_call,
            txt: '80006686 (TOLL FREE)',
            onTap: () async {
              final Uri launchUri = Uri(
                scheme: 'tel',
                path: '80006686',
              );
              if (!await launchUrl(launchUri)) {
                throw 'Could not launch $launchUri';
              }
            },),
          addH(20.h),
          CustomContainer(
            img: Icons.email_rounded,
            topTxt: AppLocalizations.of(context)!.email_us_at,
            txt: 'info@alhafidh.com',
            onTap: () async {
              final Uri params = Uri(
                scheme: 'mailto',
                path: 'info@alhafidh.com',
                query: 'Alhafid', // <--- add subject and body here
              );

              var url = params;
              if (!await launchUrl(url)) {
                throw 'Could not launch $url';
              }
            },),
          addH(20.h),
          CustomContainer(
            img: Icons.call,
            topTxt: AppLocalizations.of(context)!.contact_us_on_WhatsApp,
            txt: '009647730888333',
            onTap: () async{
              const url =
                  "https://api.whatsapp.com/send/?phone=9647730888333&text=Hi+ALHAFIDH&type=phone_number&app_absent=0";
              if (await canLaunch(url)) {
              await launch(url);
              } else {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
              throw 'Could not launch $url';
              }
             // openWhatsapp(context: context);
            },),
          addH(20.h),
          CustomContainer(
            img: Icons.location_on_sharp,
            topTxt: AppLocalizations.of(context)!.location,
            txt: AppLocalizations.of(context)!.alhafidh_location,
            tC: Colors.black,
            fSize: 12.sp,
            onTap: () {

            },
          ),
          addH(20.h),
          //footer image
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
              footerImg(
                  'assets/svg/ytb.svg', "https://www.youtube.com/alhafidhgtd"),
              footerImg('assets/svg/ln.svg',
                  "https://www.linkedin.com/company/al-hafidh-group-trading/"),
            ],
          ),
        ],
      ),
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

  //for open w
  openWhatsapp({required BuildContext context}) async {
    String whatsapp = '9647730888333';
    String whatsappURlAndroid = "https://api.whatsapp.com/send/?phone=9647730888333&text=Hi+ALHAFIDH&type=phone_number&app_absent=0";
    String whatsappURLIos =
        "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
    if (Platform.isIOS) {
      if (await canLaunchUrl(Uri.parse(whatsappURLIos))) {
        await launchUrl(Uri.parse(whatsappURLIos));
      } else {
        Methods.showSnackbar(msg: "whatsapp no installed");
      }
    } else {
      if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
        await launchUrl(Uri.parse(whatsappURlAndroid));
      } else {
        Methods.showSnackbar(msg: "whatsapp no installed");
      }
    }}

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
        launch(url); // Launch web view if app  is not installed!
      }
    }

    Widget CustomContainer({
      required IconData img,
      required String topTxt,
      required String txt,
      double? fSize,
      Color? tC,
      required VoidCallback onTap,
    }) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0.w),
        child: Container(
          height: 70.h,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black38),
          ),
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Stack(
                    children: [
                      Center(
                          child: Image.asset(
                            'assets/images/contact_bg.png',
                            height: 40,
                            width: 40,
                          )),
                      Positioned(
                        top: 0,
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Center(child: Icon(img)),
                      )
                    ],
                  ),

                  addW(10.w),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        topTxt,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: ConstantStrings.kAppFontPoppins,
                        ),
                      ),
                      Container(
                        width: 200.w,
                        child: Text(
                          txt,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: fSize ?? 15.sp,
                            fontFamily: ConstantStrings.kAppFontPoppins,
                            color: tC ?? ConstantColors.lightRed,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }


  }
