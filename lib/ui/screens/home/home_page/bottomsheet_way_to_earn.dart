import 'package:alhafidh/states/controller/home.dart';
import 'package:alhafidh/ui/screens/faQ/faq.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../helper/helper.dart';

class BottomSheetWayToEarn extends StatelessWidget {
  final HomeController homeCon;

  const BottomSheetWayToEarn({Key? key, required this.homeCon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
          ),
        ),
        height: 600,
        child: Column(
          children: [
            Container(
                height: 60.h,
                decoration: BoxDecoration(
                  color: Colors.amber.shade900,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                ),
                child: Center(
                  child: ListTileTheme(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0)),
                    ),
                    tileColor: Colors.amber.shade900,
                    child: ListTile(
                      leading: IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.white,
                        ),
                      ),
                      title:  Text(
                        AppLocalizations.of(context)!.earn_rewards,
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing:InkWell(
                        onTap: ()=>Get.toNamed(FaQ.routeName),
                        child: Text(AppLocalizations.of(context)!.fAQ,
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                )),
            addH(20.0),
            SizedBox(
              width: double.infinity,
              height: 500.h,
              child: ListView.builder(
                itemCount: homeCon.rewardRules.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.shopping_cart_checkout_outlined),
                      title: Text(homeCon.rewardRules[index].name),
                      subtitle:
                          Text(homeCon.rewardRules[index].customerFacingLabel),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
