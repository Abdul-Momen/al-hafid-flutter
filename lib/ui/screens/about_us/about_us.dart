import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/helper/helper.dart';
import 'package:alhafidh/states/controller/section.dart';
import 'package:alhafidh/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:fwfh_webview/fwfh_webview.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutUs extends StatefulWidget {
  static String routeName = '/aboutus';

  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  final SectionController _secCon = Get.find<SectionController>();

  @override
  void initState() {
    _secCon.getAboutUs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            addH(20.h),
            Text(
              AppLocalizations.of(context)!.aboutAlhafidh,
              style: TextStyle(
                fontSize: 20.sp,
                fontFamily: ConstantStrings.kFontFamily,
                fontWeight: FontWeight.bold,
              ),
            ),
            addH(15.h),
            Obx(() {
              if (_secCon.aboutUsLoading.value) {
                return Padding(
                  padding: EdgeInsets.only(top: 100.h),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                if (_secCon.aboutUs == null) {
                  return Padding(
                    padding: EdgeInsets.only(top: 100.h),
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context)!.no_Data_Found,
                      ),
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: HtmlWidget(
                      _secCon.aboutUs!.page.bodyHtml,
                      factoryBuilder: () => MyWidgetFactory(),
                      customStylesBuilder: (element) {
                        if (element.classes.contains('table')) {
                          return {'color': 'red'};
                        }
                        return null;
                      },
                    ),
                  );
                }
              }
            }),
          ],
        ),
      ),
    );
  }
}

class MyWidgetFactory extends WidgetFactory with WebViewFactory {}
