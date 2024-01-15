import 'package:alhafidh/states/controller/home.dart';
import 'package:alhafidh/ui/screens/faQ/faq.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../constants/color.dart';
import '../../../../constants/string.dart';
import '../../../../helper/helper.dart';
import '../../../widgets/custom_btn.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomSheetRewards extends StatefulWidget {
  final HomeController homeCon;

  const BottomSheetRewards({
    Key? key,
    required this.homeCon,
  }) : super(key: key);

  @override
  State<BottomSheetRewards> createState() => _BottomSheetRewardsState();
}

class _BottomSheetRewardsState extends State<BottomSheetRewards> {
  // String copyTx='Copy Discount';
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
        height: 600.h,
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
                        AppLocalizations.of(context)!.your_rewards,
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: InkWell(
                        onTap: ()=>Get.toNamed(FaQ.routeName),
                        child: Text(AppLocalizations.of(context)!.fAQ,
                            style: TextStyle(
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ),
                )),
            addH(10.h),
            SizedBox(
              width: double.infinity,
              height: 500.h,
              child: ListView.builder(
                itemCount: widget.homeCon.rewards!.rewards.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
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
                              return SingleChildScrollView(
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20.0),
                                        topLeft: Radius.circular(20.0),
                                      )),
                                  height: 600,
                                  child: Column(
                                    children: [
                                      Container(
                                          height: 60.h,
                                          decoration: BoxDecoration(
                                            color: Colors.amber.shade900,
                                            borderRadius: const BorderRadius.only(
                                                topLeft: Radius.circular(20.0),
                                                topRight:
                                                    Radius.circular(20.0)),
                                          ),
                                          child: Center(
                                            child: ListTileTheme(
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20.0),
                                                    topRight:
                                                        Radius.circular(20.0)),
                                              ),
                                              tileColor: Colors.amber.shade900,
                                              child: ListTile(
                                                leading: InkWell(
                                                  child: const Icon(
                                                    Icons
                                                        .arrow_back_ios_new_outlined,
                                                    color: Colors.white,
                                                  ),
                                                  onTap: () {
                                                    Get.back();
                                                  },
                                                ),
                                                title:  Text(
                                                  AppLocalizations.of(context)!.your_rewards,
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                                trailing: InkWell(
                                                  onTap: ()=>Get.toNamed(FaQ.routeName),
                                                  child: Text(AppLocalizations.of(context)!.fAQ,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      )),
                                                ),
                                              ),
                                            ),
                                          )),
                                      addH(10.h),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          color: Colors.white,
                                          child: Column(
                                            children: [
                                              ListTileTheme(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                tileColor: Colors.white,
                                                child: ListTile(
                                                  leading: const Icon(Icons.money),
                                                  title: Text(widget
                                                      .homeCon
                                                      .rewards!
                                                      .rewards[index]
                                                      .description),
                                                  subtitle:  Text(  AppLocalizations.of(context)!.use_the),
                                                  //trailing: const Icon(Icons.arrow_forward_ios_outlined),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          border: Border.all(
                                                              color: ConstantColors
                                                                  .lightGray)),
                                                      child: TextField(
                                                        textAlign:
                                                            TextAlign.center,
                                                        readOnly: true,
                                                        style: TextStyle(
                                                            fontSize: 14.sp,
                                                            fontFamily:
                                                                ConstantStrings
                                                                    .kAppRobotoFont,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            color:
                                                                Colors.black),
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                hintText: widget
                                                                    .homeCon
                                                                    .rewards!
                                                                    .rewards[
                                                                        index]
                                                                    .discountCode,
                                                                // hintText: '${LocaleKeys.app_bar.tr}',
                                                                hintStyle: const TextStyle(
                                                                    color: Colors
                                                                        .black)),
                                                      ),
                                                    ),
                                                    addH(10.0),
                                                    CustomBtn(
                                                      onPressedFn: () async {
                                                        /*  Clipboard.setData(const ClipboardData(text: "Your Copy text")).then((_) {
                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                              const SnackBar(content: Text('Copied to your clipboard !')));
                                                        });*/
                                                        await Clipboard.setData(
                                                          ClipboardData(
                                                              text: widget
                                                                  .homeCon
                                                                  .rewards!
                                                                  .rewards[
                                                                      index]
                                                                  .discountCode),
                                                        ).then((_) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  const SnackBar(
                                                                      content: Text(
                                                                          'Copied to your clipboard !')));
                                                        });
                                                        setState(() {});
                                                      },
                                                      btnTxt:
                                                      AppLocalizations.of(context)!.copy_discount_code,
                                                      btnSize: Size(
                                                          double.infinity.w,
                                                          45.h),
                                                      txtColor: Colors.white,
                                                      btnColor:
                                                          Colors.amber.shade900,
                                                      txtSize: 15.sp,
                                                      txtWeight:
                                                          FontWeight.w400,
                                                      btnBorderColor:
                                                          Colors.amber.shade900,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        leading: const Icon(Icons.money),
                        title: Text(
                          widget.homeCon.rewards!.rewards[index].description,
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios_outlined),
                      ),
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

/*return showModalBottomSheet(
context: context,
shape: RoundedRectangleBorder(
borderRadius:
BorderRadius.circular(10.0),
),
backgroundColor: Colors.transparent,
builder: (context) {});*/
