import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/helper/helper.dart';
import 'package:alhafidh/states/controller/section.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/states/models/faq_model.dart';
import 'package:alhafidh/ui/screens/faQ/faq_item.dart';
import 'package:alhafidh/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class FaQ extends StatefulWidget {
  static String routeName = '/faq';

  const FaQ({Key? key}) : super(key: key);

  @override
  State<FaQ> createState() => _FaQState();
}

class _FaQState extends State<FaQ> {
  var faqList = <Faq>[];
  final SectionController _secCon = Get.find<SectionController>();


  @override
  void initState() {
    // TODO: implement initState
    if(Preference.getIsArabicFlag()){
      _secCon.getFaq(id: '90325057595');
    }else{
      _secCon.getFaq(id: '90324303931');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   /* faqList.add(
      Faq(
        title: AppLocalizations.of(context)!.faq1_Q,
        subtitle: AppLocalizations.of(context)!.faq1_A,
        visible: false,
      ),
    );
    faqList.add(
      Faq(
        title: AppLocalizations.of(context)!.faq2_Q,
        subtitle: AppLocalizations.of(context)!.faq2_A,
        visible: false,
      ),
    );
    faqList.add(
      Faq(
        title: AppLocalizations.of(context)!.faq3_Q,
        subtitle: AppLocalizations.of(context)!.faq3_A,
        visible: false,
      ),
    );
    faqList.add(
      Faq(
        title: AppLocalizations.of(context)!.faq4_Q,
        subtitle: AppLocalizations.of(context)!.faq4_A,
        visible: false,
      ),
    );
    faqList.add(
      Faq(
        title: AppLocalizations.of(context)!.faq5_Q,
        subtitle: AppLocalizations.of(context)!.faq5_A,
        visible: false,
      ),
    );

    faqList.add(
      Faq(
        title: AppLocalizations.of(context)!.faq6_Q,
        subtitle: AppLocalizations.of(context)!.faq6_A,
        visible: false,
      ),
    );

    faqList.add(
      Faq(
        title: AppLocalizations.of(context)!.faq7_Q,
        subtitle: AppLocalizations.of(context)!.faq7_A,
        visible: false,
      ),
    );
    faqList.add(
      Faq(
        title: AppLocalizations.of(context)!.faq8_Q,
        subtitle: AppLocalizations.of(context)!.faq8_A,
        visible: false,
      ),
    );
    faqList.add(
      Faq(
        title: AppLocalizations.of(context)!.faq9_Q,
        subtitle: AppLocalizations.of(context)!.faq9_A,
        visible: false,
      ),
    );
    faqList.add(
      Faq(
        title: AppLocalizations.of(context)!.faq10_Q,
        subtitle: AppLocalizations.of(context)!.faq10_A,
        visible: false,
      ),
    );
*/
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
              AppLocalizations.of(context)!.frequently_Asked_Questions,
              style: TextStyle(
                fontSize: 20.sp,
                fontFamily: ConstantStrings.kFontFamily,
                fontWeight: FontWeight.bold,
              ),
            ),
            addH(15.h),
            Obx(() {
              if (_secCon.faqLoading.value) {
                return Padding(
                  padding: EdgeInsets.only(top: 100.h),
                  child: Center(child: const CircularProgressIndicator()),
                );
              } else {
                if (_secCon.faqList == null) {
                  return Padding(
                    padding: EdgeInsets.only(top: 100.h),
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context)!.no_Data_Found,
                      ),
                    ),
                  );
                } else {
                  return SizedBox(
                    height: 640.h,
                    width: double.infinity,
                    child: ListView.builder(
                        itemCount: _secCon.faqList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return FaqItem(
                            faq: _secCon.faqList[index],
                          );
                        }),
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
