import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/helper/helper.dart';
import 'package:alhafidh/states/controller/section.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:fwfh_webview/fwfh_webview.dart';
import 'package:get/get.dart';

class WarrantyScreen extends StatefulWidget {
  static String routeName = '/warranty';

  const WarrantyScreen({Key? key}) : super(key: key);

  @override
  State<WarrantyScreen> createState() => _WarrantyScreenState();
}

class _WarrantyScreenState extends State<WarrantyScreen> {
  final SectionController _secCon = Get.find<SectionController>();

  @override
  void initState() {
    // TODO: implement initState
    if(Preference.getIsArabicFlag()){
      _secCon.getWarrantyServices(id: '89691193403');
    }else{
      _secCon.getWarrantyServices(id: '59223900219');
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement initState
    if(Preference.getIsArabicFlag()){
      _secCon.getWarrantyServices(id: '89691193403');
    }else{
      _secCon.getWarrantyServices(id: '59223900219');
    }
    return Scaffold(
      appBar: CustomAppbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            addH(20.h),
            Text(
              AppLocalizations.of(context)!.warranty_Policy,
              style: TextStyle(
                fontSize: 20.sp,
                fontFamily: ConstantStrings.kFontFamily,
                fontWeight: FontWeight.bold,
              ),
            ),
            addH(15.h),
            Obx(() {
              if (_secCon.warrantyLoading.value) {
                return Padding(
                  padding: EdgeInsets.only(top: 100.h),
                  child: Center(child: const CircularProgressIndicator()),
                );
              } else {
                if (_secCon.warranty == null) {
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
                      _secCon.warranty!.page.bodyHtml,
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
/*
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: HtmlWidget(
                ConstantStrings.web,
                factoryBuilder: () => MyWidgetFactory(),
                customStylesBuilder: (element) {
                  if (element.classes.contains('table')) {
                    return {'color': 'red'};
                  }
                  return null;
                },
              ),
            ),*/
          ],
        ),
      ),
      /*body: SingleChildScrollView(
          child: Html(
            data: ConstantStrings.web,
            style: {
              "table": Style(),
              // some other granular customizations are also possible
              "tr": Style(
                border: Border(bottom: BorderSide(color: Colors.grey)),
              ),
              "th": Style(
                padding: EdgeInsets.all(6),
                backgroundColor: Colors.grey,
              ),
              "td": Style(
                padding: EdgeInsets.all(2),
                alignment: Alignment.topLeft,
              ),
            },
            customRenders: {
              tagMatcher("table"): CustomRender.widget(
                widget: (
                  context,
                  buildChildren,
                ) =>
                    SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: tableRender.call().widget!.call(
                        context,
                        buildChildren,
                      ),
                ),
              ),
            },
          ),
        ),*/
    );
  }
}

class MyWidgetFactory extends WidgetFactory with WebViewFactory {}
