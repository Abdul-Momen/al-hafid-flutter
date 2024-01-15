import 'dart:io';
import 'package:alhafidh/constants/color.dart';
import 'package:alhafidh/states/controller/home.dart';
import 'package:alhafidh/ui/screens/home/slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../products/products.dart';

class CustomBanner extends StatefulWidget {
  final HomeController homeCon;
  final dynamic imageList;
  final dynamic imageHandlerList;
  final RxBool loading;

  const CustomBanner({
    Key? key,
    required this.homeCon,
    required this.imageList,
    required this.imageHandlerList,
    required this.loading,
  }) : super(key: key);

  @override
  State<CustomBanner> createState() => _CustomBannerState();
}

class _CustomBannerState extends State<CustomBanner> {
  int activeBnrIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (widget.loading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        if (widget.imageList.isEmpty) {
          return Center(
            child: Text(
              AppLocalizations.of(context)!.no_Data_Found,
            ),
          );
        } else {
          return // Slider
              SizedBox(
            width: double.infinity,
            height: 150.h,
            child: Stack(
              children: [
                CarouselSlider.builder(
                  options: CarouselOptions(
                    viewportFraction: Platform.isAndroid ? 1 : 1,
                    height: 150.h,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 4),
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() => activeBnrIndex = index);
                    },
                  ),
                  itemCount: widget.imageList.length,
                  itemBuilder: (context, index, realIndex) {
                    var s = widget.imageList[index]
                        .replaceAll(new RegExp(",|!|'|//|\"|\\n"), "");
                    var ss = s.replaceAll('{width}', '720');
                    // var sss = ss.substring(0, ss.length - 3);
                    // var ssss = sss.substring(1);
                    // print(ss);
                    return HomeSlider(
                      onTapFn: () {
                        if (widget.imageHandlerList[index] == '#') {
                          print('test null #');
                        } else if (widget.imageHandlerList[index] == '') {
                          print('test null Empty');
                        } else {
                          //call for banner id
                          widget.homeCon.getBannerCollectionId(
                              handle: widget.imageHandlerList[index]);
                          print('test ' + widget.imageHandlerList[index]);

                          //wait for data 1 se
                          Future.delayed(const Duration(seconds: 1), () {
                            if (widget
                                .homeCon.bannerCollectionIdLoading.value) {
                              //when is data empty
                            } else {
                              Get.toNamed(
                                ProductsScreen.routeName,
                                arguments: [
                                  widget.homeCon.bannerCollectionId
                                      .replaceAll(RegExp(r'[^0-9]'), ''),
                                  'Products'
                                ],
                              );
                            }
                          });
                        }
                      },
                      // imgUrl: _homeCon.bannerList[index].smallImage,
                      imgUrl: "https://$ss",
                    );
                  },
                ),
                Positioned.fill(
                  bottom: 10.h,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: AnimatedSmoothIndicator(
                      activeIndex: activeBnrIndex,
                      count: widget.imageList.length,
                      effect: WormEffect(
                        strokeWidth: 1,
                        activeDotColor: ConstantColors.lightRed,
                        paintStyle: PaintingStyle.stroke,
                        dotHeight: 7.h,
                        dotWidth: 7.w,
                        spacing: 8.w,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }
      }
    });
  }
}
