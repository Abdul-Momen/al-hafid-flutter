import 'package:alhafidh/constants/color.dart';
import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/helper/helper.dart';
import 'package:alhafidh/states/controller/address.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/states/models/address_model.dart';
import 'package:alhafidh/states/models/customer_model.dart';
import 'package:alhafidh/states/utils/methods.dart';
import 'package:alhafidh/ui/widgets/custom_app_bar.dart';
import 'package:alhafidh/ui/widgets/custom_btn.dart';
import 'package:alhafidh/ui/widgets/custom_field.dart';
import 'package:alhafidh/ui/widgets/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddAddress extends StatefulWidget {
  static String routeName = '/addaddress';

  const AddAddress({Key? key}) : super(key: key);

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {

  final AddressController _addressCon = Get.find<AddressController>();


  final TextEditingController _fNameCon = TextEditingController();
  final TextEditingController _lNameCon = TextEditingController();
  final TextEditingController _addressTxtCon = TextEditingController();
  final TextEditingController _addressTxt2Con = TextEditingController();
  final TextEditingController _phoneNumCon = TextEditingController();

  // final TextEditingController _villaCon = TextEditingController();
  // final TextEditingController _zipCon = TextEditingController();

//  final TextEditingController _countryCon = TextEditingController();
  final TextEditingController _cityCon = TextEditingController();

  // final TextEditingController _extraDirectionsCon = TextEditingController();

  late GoogleMapController _googleMapCon;
  Marker? _selectedLocation;

  final CameraPosition _initialCameraPosition = const CameraPosition(
    target: LatLng(37.773972, -122.431297),
    zoom: 1.5,
  );

  //bool _firstTime = true;

  // CountryModel? _selectedCountry;
  // StateModel? _selectedState;
  // CityModel? _selectedCity;
  Address? aModel;
  CustomerModel? userModel;

  @override
  void initState() {
    userModel = Preference.getUserDetails();
    if (Get.arguments != null) {
      aModel = Get.arguments;
      _fNameCon.text = aModel!.firstName;
      _lNameCon.text = aModel!.lastName;
      _addressTxtCon.text = aModel!.address1;
      _addressTxt2Con.text = aModel!.address2;
      _phoneNumCon.text = aModel!.phone;
      //  _zipCon.text = aModel!.zip;
      // _countryCon.text = aModel!.country;
      _cityCon.text = aModel!.city;

      // _extraDirectionsCon.text = aModel!.nearByLocation;
      /*_initialCameraPosition = CameraPosition(
        target: LatLng(
          aModel!.latitude != 0 ? aModel!.latitude : 37.773972,
          aModel!.longitude != 0 ? aModel!.longitude : -122.431297,
        ),
        zoom: 11.5,
      );*/
      _selectedLocation = const Marker(
        markerId: MarkerId('origin'),
        infoWindow: InfoWindow(
          title: "Current Location",
        ),
        position: LatLng(
          /*aModel!.latitude != 0 ? aModel!.latitude :*/
          37.773972,
          /*aModel!.longitude != 0 ? aModel!.longitude :*/ -122.431297,
        ),
      );
    }
    // _addressCon.getCountries();
    super.initState();
  }

  @override
  void dispose() {
    _googleMapCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                CustomTitle(
                  title: aModel == null
                      ? AppLocalizations.of(context)!.add_New_Address
                      : AppLocalizations.of(context)!.edit_address,
                ),
                // Address Form
                // Current Location
                Container(
                  width: 388.w,
                  height: 250.h,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        // Current Location Button
                        InkWell(
                          onTap: () async {
                            Position position =
                            await Methods.determinePosition();
                            _googleMapCon.animateCamera(
                              CameraUpdate.newCameraPosition(
                                CameraPosition(
                                  zoom: 14,
                                  target: LatLng(
                                    position.latitude,
                                    position.longitude,
                                  ),
                                ),
                              ),
                            );
                            setState(
                                  () => _selectedLocation = Marker(
                                markerId: const MarkerId('origin'),
                                infoWindow: InfoWindow(
                                  title: AppLocalizations.of(context)!
                                      .currentLocation,
                                ),
                                position: LatLng(
                                  position.latitude,
                                  position.longitude,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: 60.h,
                            padding: EdgeInsets.only(top: 15.h, left: 15.w),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/current_location.svg',
                                ),
                                addW(10.w),
                                Text(
                                  AppLocalizations.of(context)!.currentLocation,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: ConstantStrings.kFontFamily,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Map
                        Expanded(
                          child: Container(
                            color: Colors.grey,
                            child: Center(
                              child: GoogleMap(
                                myLocationButtonEnabled: false,
                                zoomControlsEnabled: false,
                                initialCameraPosition: _initialCameraPosition,
                                onMapCreated: (controller) =>
                                _googleMapCon = controller,
                                markers: {
                                  if (_selectedLocation != null)
                                    _selectedLocation!,
                                },
                                onLongPress: (pos) => setState(
                                      () => _selectedLocation = Marker(
                                    markerId: const MarkerId('origin'),
                                    infoWindow: InfoWindow(
                                      title: AppLocalizations.of(context)!
                                          .selectedLocation,
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
                        ),
                      ],
                    ),
                  ),
                ),

                addH(16.h),
                // First Name
                CustomField(
                  textCon: _fNameCon,
                  prefixIcon: 'assets/svg/address_title.svg',
                  hintText: AppLocalizations.of(context)!.first_name,
                  brdrClr: ConstantColors.whiteGray,
                ),
                addH(10.h),

                // Last Name
                CustomField(
                  textCon: _lNameCon,
                  prefixIcon: 'assets/svg/address_title.svg',
                  hintText: AppLocalizations.of(context)!.last_name,
                  brdrClr: ConstantColors.whiteGray,
                ),
                addH(10.h),

                // Address title
                CustomField(
                  textCon: _addressTxtCon,
                  prefixIcon: 'assets/svg/address_title.svg',
                  hintText: AppLocalizations.of(context)!.address_one,
                  brdrClr: ConstantColors.whiteGray,
                ),
                addH(10.h),

                // Address title
                CustomField(
                  textCon: _addressTxt2Con,
                  prefixIcon: 'assets/svg/address_title.svg',
                  hintText: AppLocalizations.of(context)!.address_two,
                  brdrClr: ConstantColors.whiteGray,
                ),
                /* addH(10.h),
                // Phone number
                CustomField(
                  textCon: _countryCon,
                  prefixIcon: 'assets/sv/phone_num.svg',
                  hintText: AppLocalizations.of(context)!.country,
                  brdrClr: ConstantColors.whiteGray,
                ),*/
                // Address title
                CustomField(
                  textCon: _cityCon,
                  prefixIcon: 'assets/svg/address_title.svg',
                  hintText: AppLocalizations.of(context)!.city,
                  brdrClr: ConstantColors.whiteGray,
                ),
                addH(10.h),
/*                // Country dropdown
                Obx(() {
                  if (_addressCon.countryLoading.value) {
                    return SizedBox(
                      width: 388.w,
                      height: 50.h,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    if (aModel != null && _firstTime) {
                      for (CountryModel item in _addressCon.countryList) {
                        if (item.countryId == aModel!.countryId) {
                          _selectedCountry = item;

                          Future.delayed(
                            const Duration(milliseconds: 100),
                            () => _addressCon.getStates(
                              countryID: item.countryId,
                            ),
                          );
                          break;
                        }
                      }
                    }
                    return CustomDD(
                      givenValue: _selectedCountry,
                      hintTxt: "Country",
                      onChangedFn: (value) => setState(() {
                        _selectedCountry = value;
                        _addressCon.stateList.clear();
                        _selectedState = null;
                        _addressCon.cityList.clear();
                        _selectedCity = null;
                        _addressCon.getStates(
                          countryID: _selectedCountry!.countryId,
                        );
                      }),
                      items: _addressCon.countryList.map((e) {
                        return _getDDMenuItem(
                          item: e,
                          txt: e.countryName,
                        );
                      }).toList(),
                    );
                  }
                }),
                addH(16.h),
                // State dropdown
                Obx(() {
                  if (_addressCon.stateLoading.value) {
                    return SizedBox(
                      width: 388.w,
                      height: 50.h,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    if (aModel != null &&
                        _firstTime &&
                        _selectedCountry != null) {
                      for (StateModel item in _addressCon.stateList) {
                        if (item.stateId == aModel!.stateId) {
                          _selectedState = item;
                          Future.delayed(
                            const Duration(milliseconds: 100),
                            () => _addressCon.getCities(stateID: item.stateId),
                          );
                          break;
                        }
                      }
                    }
                    return CustomDD(
                      givenValue: _selectedState,
                      hintTxt: "State",
                      onChangedFn: (value) => setState(() {
                        _selectedState = value;
                        _addressCon.cityList.clear();
                        _selectedCity = null;
                        _addressCon.getCities(
                          stateID: _selectedState!.stateId,
                        );
                      }),
                      items: _addressCon.stateList.map((e) {
                        return _getDDMenuItem(
                          item: e,
                          txt: e.stateName,
                        );
                      }).toList(),
                    );
                  }
                }),
                addH(16.h),
                // City dropdown
                Obx(() {
                  if (_addressCon.cityLoading.value) {
                    return SizedBox(
                      width: 388.w,
                      height: 50.h,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    if (aModel != null &&
                        _firstTime &&
                        _selectedState != null) {
                      for (CityModel item in _addressCon.cityList) {
                        if (item.cityId == aModel!.cityId) {
                          _selectedCity = item;
                          _firstTime = false;
                          break;
                        }
                      }
                    }
                    return CustomDD(
                      givenValue: _selectedCity,
                      hintTxt: "City",
                      onChangedFn: (value) => setState(() {
                        _selectedCity = value;
                      }),
                      items: _addressCon.cityList.map((e) {
                        return _getDDMenuItem(
                          item: e,
                          txt: e.cityName,
                        );
                      }).toList(),
                    );
                  }
                }),*/
                /*   // Villa
                CustomField(
                  textCon: _zipCon,
                  prefixIcon: 'assets/svgs/villa_number.svg',
                  hintText: AppLocalizations.of(context)!.zipcode,
                  brdrClr: ConstantColors.whiteGray,
                ),*/
                //   addH(16.h),
                // Extra directions
                CustomField(
                  textCon: _phoneNumCon,
                  prefixIcon: 'assets/svgs/extra_directions.svg',
                  hintText: AppLocalizations.of(context)!.phone,
                  brdrClr: ConstantColors.whiteGray,
                ),
                addH(25.h),

                // Save Button
                Center(
                  child: CustomBtn(
                    onPressedFn: () {
                      if (_fNameCon.text.isEmpty ||
                          _lNameCon.text.isEmpty ||
                          _lNameCon.text.isEmpty ||
                          _addressTxtCon.text.isEmpty ||
                          _addressTxt2Con.text.isEmpty ||
                          //  _countryCon.text.isEmpty ||
                          _cityCon.text.isEmpty ||
                          //  _zipCon.text.isEmpty ||
                          _phoneNumCon.text.isEmpty
                      /*     _selectedCountry == null ||
                          _selectedState == null ||
                          _selectedCity == null ||
                          _villaCon.text.isEmpty ||
                          _extraDirectionsCon.text.isEmpty*/
                      ) {
                        Methods.showSnackbar(msg: ConstantStrings.kEmptyFields);
                        return;
                      }

                      Address addAddressModel = Address(
                        id: 0,
                        customerId: 0,
                        firstName: _fNameCon.text,
                        lastName: _lNameCon.text,
                        company: 'company',
                        address1: _addressTxtCon.text,
                        address2: _addressTxt2Con.text,
                        city: _cityCon.text,
                        province: 'province',
                        country: 'Iraq',
                        //  zip: _zipCon.text,
                        zip: '10111',
                        phone: _phoneNumCon.text,
                        name: 'name',
                        provinceCode: 'provinceCode',
                        countryCode: 'countryCode',
                        countryName: 'countryName',
                        addressDefault: false,
                      );

                      //cheek add or update
                      if (aModel == null) {
                        _addressCon.addAddress(
                            address: addAddressModel,
                            customerToken: Preference.getCToken().toString());
                      } else {
                        _addressCon.updateAddress(
                            address: addAddressModel,
                            customerToken: Preference.getCToken().toString(),
                            addressId: aModel!.id);
                      }

                      Get.defaultDialog(
                        title: 'Processing...',
                        content: Obx(
                              () {
                            if (_addressCon.saveAddressLoading.value) {
                              return SizedBox(
                                height: 100.h,
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            } else {
                              Future.delayed(
                                const Duration(seconds: 1),
                                    () => Get.back(),
                              );
                              Future.delayed(
                                const Duration(seconds: 2),
                                    () => Get.back(),
                              );
                              return Center(
                                child: Text(
                                  aModel == null
                                      ? 'Address Saved!'
                                      : 'Address Updated!',
                                ),
                              );
                            }
                          },
                        ),
                      );
                    },
                    btnTxt: aModel == null ? 'Save' : 'Update',
                  ),
                ),
                addH(30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static DropdownMenuItem<dynamic> _getDDMenuItem({
    required dynamic item,
    required String txt,
  }) {
    return DropdownMenuItem(
      value: item,
      child: Row(
        children: [
          addW(15.w),
          SvgPicture.asset(
            'assets/svgs/location.svg',
          ),
          addW(20.w),
          Text(
            txt,
            style: TextStyle(
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}
