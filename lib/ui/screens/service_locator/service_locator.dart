import 'package:alhafidh/constants/color.dart';
import 'package:alhafidh/helper/helper.dart';
import 'package:alhafidh/states/controller/products.dart';
import 'package:alhafidh/ui/screens/store_locator/store_item.dart';
import 'package:alhafidh/ui/widgets/custom_app_bar.dart';
import 'package:alhafidh/ui/widgets/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/string.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ServiceLocatorScreen extends StatefulWidget {
  static String routeName = '/serviceLocator';

  const ServiceLocatorScreen({Key? key}) : super(key: key);

  @override
  State<ServiceLocatorScreen> createState() => _ServiceLocatorScreenState();
}

class _ServiceLocatorScreenState extends State<ServiceLocatorScreen> {
  final ProductsController _productsCon = Get.find<ProductsController>();

  late TextEditingController searchCon = TextEditingController();

  late GoogleMapController _googleMapCon;
  Marker? _selectedLocation;

  final CameraPosition _initialCameraPosition = const CameraPosition(
    target: LatLng(37.773972, -122.431297),
    zoom: 1.5,
  );

  String searchValue = '';

  @override
  void initState() {
    _productsCon.getStoreLocator("", "");

    _selectedLocation = const Marker(
      markerId: MarkerId('origin'),
      infoWindow: InfoWindow(
        title: "Service Centers",
      ),
      position: LatLng(
        /*aModel!.latitude != 0 ? aModel!.latitude :*/
        37.773972,
        /*aModel!.longitude != 0 ? aModel!.longitude :*/ -122.431297,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title
            CustomTitle(
              title: AppLocalizations.of(context)!.service_Center_lo,
            ),
            //addH(10.h),
           /* // Map
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0.w),
              child: Container(
                color: Colors.grey,
                height: 160.h,
                width: double.infinity,
                child: Center(
                  child: GoogleMap(
                    myLocationButtonEnabled: false,
                    zoomControlsEnabled: false,
                    initialCameraPosition: _initialCameraPosition,
                    onMapCreated: (controller) => _googleMapCon = controller,
                    markers: {
                      if (_selectedLocation != null) _selectedLocation!,
                    },
                    onLongPress: (pos) => setState(
                      () => _selectedLocation = Marker(
                        markerId: const MarkerId('origin'),
                        infoWindow: const InfoWindow(
                          title: "Selected Location",
                        ),
                        position: LatLng(
                          pos.latitude,
                          pos.longitude,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),*/
            addH(15.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0.w),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: ConstantColors.lightGray)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: SizedBox(
                        width: 180.w,
                        child: TextField(
                          controller: searchCon,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: ConstantStrings.kAppRobotoFont,
                            fontWeight: FontWeight.normal,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: AppLocalizations.of(context)!.search_txt,
                          ),
                          onChanged: (value) {
                            if (value == '') {
                              setState(() {
                                searchValue = value;
                              });
                            } else {
                              setState(() {
                                searchValue = value;
                                _productsCon.getStoreLocator(searchValue, "  ");
                                searchValue = '';
                              });
                            }
                          },
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _productsCon.getStoreLocator(searchValue, "  ");
                          searchValue = '';
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(5.0),
                              bottomRight: Radius.circular(5.0)),
                          color: Colors.black,
                        ),
                        height: 46.h,
                        width: 53.h,
                        child: const Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // addH(15.h),
            Obx(() {
              if (_productsCon.storeLocatorLoading.value) {
                return Padding(
                  padding: EdgeInsets.only(top: 100.h),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                if (_productsCon.serviceLocatorList.isEmpty) {
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
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        addH(10.h),
                        // Store list
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _productsCon.serviceLocatorList.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            return StoreItem(
                              storeLocatorModel:
                                  _productsCon.serviceLocatorList[index],
                            );
                          },
                        ),
                        addH(10.h),
                      ],
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
