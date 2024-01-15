
import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/states/services/base_client.dart';

class AddressService {
  //?customerId=5760053608507

  static Future<dynamic> getAddresses(int customerId) async {
    var response = await BaseClient.getData(
      api: "${ConstantStrings.kDeliveryAddressesAPI}$customerId/addresses.json",
      parameter: {
        "limit": 5,
      },
      token: ConstantStrings.kATkn,
    );
    return response;
  }

 /* static Future<dynamic> getCountries() async {
    var response = await BaseClient.getData(
      api: ConstantStrings.kCountryAPI,
    );
    return response;
  }

  static Future<dynamic> getStates(int countryId) async {
    var response = await BaseClient.getData(
      api: '${ConstantStrings.kStateAPI}$countryId',
    );
    return response;
  }

  static Future<dynamic> getCities(int stateId) async {
    var response = await BaseClient.getData(
      api: '${ConstantStrings.kCityAPI}$stateId',
    );
    return response;
  }

  static Future<dynamic> saveAddress({
    required dynamic payload,
    required bool isUpdating,
  }) async {
    var response = await BaseClient.postData(
      api: isUpdating
          ? ConstantStrings.kUpdateDeliveryAddresstAPI
          : ConstantStrings.kDeliveryAddressesAPI,
      body: payload,
    );
    return response;
  }

  static Future<dynamic> deleteAddress({
    required int aID,
  }) async {
    var response = await BaseClient.postData(
      api: '${ConstantStrings.kDeleteDeliveryAddressAPI}$aID',
      body: null,
    );
    return response;
  }*/
}
