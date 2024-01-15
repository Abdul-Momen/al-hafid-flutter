import 'package:alhafidh/states/Repository/address_repository.dart';
import 'package:alhafidh/states/models/address_model.dart';
import 'package:alhafidh/states/services/address.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  var addressRepository = Get.put(AddressRepository());

  RxBool addressLoading = true.obs;
  RxBool countryLoading = true.obs;
  RxBool stateLoading = false.obs;
  RxBool cityLoading = false.obs;
  RxBool saveAddressLoading = true.obs;
  RxBool deleteAddressLoading = true.obs;
  RxBool setDefaultAddressLoading = true.obs;

  var addressList = <Address>[].obs;
  var defaultAddressList = <Address>[].obs;

/*  var countryList = <CountryModel>[].obs;
  var stateList = <StateModel>[].obs;
  var cityList = <CityModel>[].obs;*/

  void getAddresses({required int customerID}) async {
    addressLoading(true);
    try {
      var response = await AddressService.getAddresses(customerID);
      AddressModel a = AddressModel.fromJson(response);
      addressList.value = a.addresses;
      defaultAddressList.value= addressList.value
          .where((o) => o.addressDefault == true)
          .toList();
      print('get address list =>');
      print(a.toString());
    } finally {
      addressLoading(false);
    }
  }

  //add address to customer
  void addAddress(
      {required Address address, required String customerToken}) async {
    saveAddressLoading(true);
    final result = await addressRepository.addAddress(address, customerToken);
    if (result.customerAddressCreate.customerAddress.id.isNotEmpty) {
      print('add address success =>');
      saveAddressLoading(false);
    } else {
      Get.snackbar("Address", "Update failed",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  //update customer address
  void updateAddress({
    required Address address,
    required String customerToken,
    required int addressId,
  }) async {
    saveAddressLoading(true);
    final result = await addressRepository.updateAddress(
        address, customerToken, addressId);
    if (result != null) {
      print('add address success =>');
      saveAddressLoading(false);
    } else {
      Get.snackbar("Address", "Address already exists for customer",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  //delete customer address
  void deleteAddress({
    required String customerToken,
    required int addressId,
  }) async {
    deleteAddressLoading(true);
    final result =
        await addressRepository.deleteAddress(customerToken, addressId);
    if (result != null) {
      print('delete address success =>');
      deleteAddressLoading(false);
    } else {
      Get.snackbar("Address", "delete UnSuccessfully",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

 //setDefault customer address
  void setDefaultAddress({
    required String customerToken,
    required int addressId,
  }) async {
    setDefaultAddressLoading(true);
    final result = await addressRepository.setDefaultAddress(customerToken, addressId);
    if (result != null) {
      print('set default address success =>');
      setDefaultAddressLoading(false);
    } else {
      Get.snackbar("Address", "delete UnSuccessfully",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

/*
  void getCountries() async {
    countryLoading(true);
    try {
      var response = await AddressService.getCountries();
      countryList.value = countryModelFromJson(jsonEncode(response));
    } finally {
      countryLoading(false);
    }
  }

  void getStates({required int countryID}) async {
    stateLoading(true);
    try {
      var response = await AddressService.getStates(countryID);
      stateList.value = stateModelFromJson(jsonEncode(response));
    } finally {
      stateLoading(false);
    }
  }

  void getCities({required int stateID}) async {
    cityLoading(true);
    try {
      var response = await AddressService.getCities(stateID);
      cityList.value = cityModelFromJson(jsonEncode(response));
    } finally {
      cityLoading(false);
    }
  }

  void saveDeliveryAddress({
    required AddressModel addressModel,
    bool? isUpdating,
  }) async {
    saveAddressLoading(true);
    try {
      var response = AddressService.saveAddress(
        payload: addressModel.toJson(),
        isUpdating: isUpdating ?? false,
      );
    } finally {
      saveAddressLoading(false);
    }
  }

  void deleteDeliveryAddress({required int addressID}) async {
    deleteAddressLoading(true);
    try {
      var response = AddressService.deleteAddress(aID: addressID);
    } finally {
      deleteAddressLoading(false);
    }
  }*/
}
