import 'package:alhafidh/states/controller/home.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/ui/screens/faQ/faq.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../helper/helper.dart';
import '../../../widgets/custom_btn.dart';

class BottomSheetWayToRedeem extends StatelessWidget {
  final HomeController homeCon;

  const BottomSheetWayToRedeem({
    Key? key,
    required this.homeCon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
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
                        AppLocalizations.of(context)!.redeem_rewards,
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
                      leading: const Icon(Icons.design_services_outlined),
                      title: Text(homeCon.rewardRules[index].name),
                      subtitle: Text(
                        homeCon.rewardRules[index].customerFacingLabel,
                        style: TextStyle(fontSize: 10.sp),
                      ),
                      trailing: homeCon.rewards!.availablePoints >=
                              homeCon.rewardRules[index].redeemPoints
                          ? CustomBtn(
                              onPressedFn: () {
                                //post redeem rewards
                                homeCon.redeemRewards(
                                    redeemId: homeCon.rewardRules[index].id);

                                Get.defaultDialog(
                                  title:
                                      AppLocalizations.of(context)!.processing,
                                  content: Obx(
                                    () {
                                      if (homeCon.redeemRewardsLoading.value) {
                                        return SizedBox(
                                          height: 100.h,
                                          child: const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        );
                                      } else {
                                        Future.delayed(
                                          const Duration(seconds: 0),
                                          () {
                                           homeCon.getRewardsUserPoints(customerEmail: Preference.getLoginEmail());
                                           Get.back();
                                          },
                                        );
                                        return Center(
                                          child: Text(
                                              AppLocalizations.of(context)!.redeem_success),
                                        );
                                      }
                                    },
                                  ),
                                );
                              },
                              btnTxt:AppLocalizations.of(context)!.redeem,
                              btnSize: Size(
                                90.w,
                                40.h,
                              ),
                              txtColor: Colors.white,
                              btnColor: Colors.amber.shade900,
                              txtSize: 15.sp,
                              txtWeight: FontWeight.w400,
                              btnBorderColor: Colors.amber.shade900,
                            )
                          : const SizedBox(),
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
