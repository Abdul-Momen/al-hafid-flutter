import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/helper/helper.dart';
import 'package:alhafidh/states/controller/section.dart';
import 'package:alhafidh/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:fwfh_webview/fwfh_webview.dart';
import 'package:get/get.dart';


class MediaCenterScreen extends StatefulWidget {
  static String routeName = '/mediacenter';

  const MediaCenterScreen({Key? key}) : super(key: key);

  @override
  State<MediaCenterScreen> createState() => _MediaCenterScreenState();
}

class _MediaCenterScreenState extends State<MediaCenterScreen> {
  final SectionController _secCon = Get.find<SectionController>();

  @override
  void initState() {
    _secCon.getMediaCenter();
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
              AppLocalizations.of(context)!.mediaCenter,
              style: TextStyle(
                fontSize: 20.sp,
                fontFamily: ConstantStrings.kFontFamily,
                fontWeight: FontWeight.bold,
              ),
            ),
            addH(15.h),
            Obx(() {
              if (_secCon.mediaCenterLoading.value) {
                return Padding(
                  padding: EdgeInsets.only(top: 100.h),
                  child: Center(child: const CircularProgressIndicator()),
                );
              } else {
                if (_secCon.mediaCenter == null) {
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
                      _secCon.mediaCenter!.page.bodyHtml,
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
