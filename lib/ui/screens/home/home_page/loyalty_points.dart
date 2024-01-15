import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/helper/helper.dart';
import 'package:alhafidh/states/controller/home.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/states/models/customer_model.dart';
import 'package:alhafidh/ui/screens/home/home_page/bottomsheet_for_rewards.dart';
import 'package:alhafidh/ui/screens/home/home_page/bottomsheet_way_to_earn.dart';
import 'package:alhafidh/ui/screens/home/home_page/bottomsheet_way_to_redeem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoyaltyPointPage extends StatefulWidget {
  CustomerModel? uModel;
  HomeController homeCon;

  LoyaltyPointPage({
    Key? key,
    this.uModel,
    required this.homeCon,
  }) : super(key: key);

  @override
  State<LoyaltyPointPage> createState() => _LoyaltyPointPageState();
}

class _LoyaltyPointPageState extends State<LoyaltyPointPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(Preference.getLoggedInFlag()){
      widget.homeCon.getRewardsUserPoints(customerEmail: Preference.getLoginEmail());
    }
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.amber.shade900,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20.0),
              topLeft: Radius.circular(20.0),
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              addH(20.h),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${AppLocalizations.of(context)!.welcome} ${widget.uModel!.customer.firstName} ${widget.uModel!.customer.lastName}",
                  style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: ConstantStrings.kAppRobotoBold,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${AppLocalizations.of(context)!.your_points}: ${widget.homeCon.rewards!.availablePoints.toString()}",
                  style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: ConstantStrings.kAppRobotoBold,
                      color: Colors.white),
                ),
              ),
              addH(20.h),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.white,
                child: ListTileTheme(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  tileColor: Colors.white,
                  child: ListTile(
                    onTap: () => showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: Colors.transparent,
                      builder: (context) => BottomSheetRewards(
                        homeCon: widget.homeCon,
                      ),
                    ),
                    title: Text(AppLocalizations.of(context)!.your_Rewards),
                    subtitle: Text(
                        "${AppLocalizations.of(context)!.you_have} ${widget.homeCon.rewards!.rewards.length.toString()} ${AppLocalizations.of(context)!.rewards_available}"),
                    trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  ),
                ),
              ),
              addH(20.h),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  height: 235.h,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      addH(10.h),
                      Text(
                        AppLocalizations.of(context)!.reward_points,
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: ConstantStrings.kAppRobotoBold,
                            color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          AppLocalizations.of(context)!.rewards_dt,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: ConstantStrings.kAppFontPoppins,
                          ),
                        ),
                      ),
                      const Divider(
                        // This creates the horizontal divider
                        color: Colors.black12,
                        thickness: 1,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: Colors.white,
                        child: ListTileTheme(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          tileColor: Colors.white,
                          child: ListTile(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                backgroundColor: Colors.transparent,
                                builder: (context) {
                                  return BottomSheetWayToEarn(
                                    homeCon: widget.homeCon,
                                  );
                                },
                              );
                            },
                            leading: const Icon(Icons.download_outlined),
                            title: Text(
                              AppLocalizations.of(context)!.ways_to_earn,
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios_outlined),
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: Colors.white,
                        child: ListTileTheme(
                          tileColor: Colors.white,
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context).pop();

                              showModalBottomSheet(
                                context: context,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                backgroundColor: Colors.transparent,
                                builder: (context) {
                                  return BottomSheetWayToRedeem(
                                    homeCon: widget.homeCon,
                                  );
                                },
                              );
                            },
                            leading: const Icon(Icons.upload),
                            title: Text(
                              AppLocalizations.of(context)!.ways_to_redeem,
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            trailing:
                                const Icon(Icons.arrow_forward_ios_outlined),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              addH(15.0),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  height: 210.h,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                       ListTile(
                        title: Text( AppLocalizations.of(context)!.refer_your_friends),
                        subtitle: Text("0 ${AppLocalizations.of(context)!.referrals_completed}"),
                      //  trailing: Icon(Icons.arrow_forward_ios_outlined),
                      ),
                      addH(15.0),
                       Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                            "${AppLocalizations.of(context)!.share_c} 0 ${AppLocalizations.of(context)!.off_coupon}"),
                      ),
                      addH(15.0),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          height: 45.h,
                          color: Colors.white,
                          child: Row(
                            children: [
                              const Expanded(
                                  child: Text(
                                      "https://referral.appstle.com/bmbxxpyydd")),
                              IconButton(
                                  onPressed: () async {
                                    await Clipboard.setData(
                                      const ClipboardData(
                                          text:
                                              'https://referral.appstle.com/bmbxxpyydd'),
                                    ).then((_) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  'Copied to your clipboard !')));
                                    });
                                  },
                                  icon: const Icon(Icons.copy))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              addH(20.0),
            ],
          ),
        ),
      ),
    );
  }
}
