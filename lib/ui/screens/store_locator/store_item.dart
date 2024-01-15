import 'dart:io';

import 'package:alhafidh/constants/color.dart';
import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/helper/helper.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/states/models/store_locator_model.dart';
import 'package:alhafidh/ui/widgets/custom_img.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';



class StoreItem extends StatelessWidget {
  final StoreLocatorModel storeLocatorModel;

  const StoreItem({
    Key? key,
    required this.storeLocatorModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(
              color: ConstantColors.grayBlack,
              width: 1,
            )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              addH(10.h),
              _buildTitle(title: Preference.getIsArabicFlag()?ConstantStrings.storeloactorlist[0][storeLocatorModel.name]??storeLocatorModel.name:storeLocatorModel.name, fSize: 18.sp),
              addH(10.h),
              // product image
              CustomImg(
                imgUrl: storeLocatorModel.imageUrl,
                imgWidth: 305.w,
                imgHeight: 180.h,
              ),
              addH(10.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on_sharp,
                    color: ConstantColors.lightRed,
                    size: 15,
                  ),
                  SizedBox(
                    height: 40.h,
                    width: 290.w,
                    child: _buildTitle(
                        title: storeLocatorModel.address,
                        fSize: 12.sp,
                        fw: FontWeight.normal),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.phone,
                        color: ConstantColors.lightRed,
                        size: 15,
                      ),
                      _buildTitle(
                        title: storeLocatorModel.phone,
                        fSize: 12.sp,
                        fw: FontWeight.normal,
                        clr: ConstantColors.lightRed,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.email_sharp,
                        color: ConstantColors.lightRed,
                        size: 15,
                      ),
                      _buildTitle(
                        title: storeLocatorModel.email,
                        fSize: 12.sp,
                        fw: FontWeight.normal,
                        clr: ConstantColors.lightRed,
                      ),
                    ],
                  ),
                ],
              ),
              addH(10.h),

              _buildTitle(
                title: storeLocatorModel.description,
                fSize: 12.sp,
                fw: FontWeight.normal,
              ),
              addH(10.h),
              InkWell(
                onTap: () async{
                  openMap(context: context, lat: storeLocatorModel.latitude , lng:  storeLocatorModel.longitude,);
                },
                child: Container(
                  width: 90.w,
                  height: 36.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: ConstantColors.k06C8FF,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'View On Map',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: ConstantStrings.kFontFamily,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  //open map
  static Future<void> openMap({required BuildContext context,required double lat,required double lng}) async {
    String url = '';
    String urlAppleMaps = '';
    if (Platform.isAndroid) {
      url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        throw 'Could not launch $url';
      }
    } else {
      urlAppleMaps = 'https://maps.apple.com/?q=$lat,$lng';
      url = 'comgooglemaps://?saddr=&daddr=$lat,$lng&directionsmode=driving';
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else if (await canLaunchUrl(Uri.parse(urlAppleMaps))) {
        await launchUrl(Uri.parse(urlAppleMaps));
      } else {
        throw 'Could not launch $url';
      }
    }
  }
  Widget _buildTitle(
      {required String title, Color? clr, double? fSize, FontWeight? fw}) {
    return Text(
      title,
      maxLines: 2,
      style: TextStyle(
          fontSize: fSize ?? 16.sp,
          fontWeight: fw ?? FontWeight.bold,
          fontFamily: ConstantStrings.kFontFamily,
          color: clr ?? Colors.black87),
    );
  }
}