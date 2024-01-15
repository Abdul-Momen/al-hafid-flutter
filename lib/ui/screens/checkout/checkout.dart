import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/helper/helper.dart';
import 'package:alhafidh/states/controller/address.dart';
import 'package:alhafidh/states/controller/cart.dart';
import 'package:alhafidh/states/controller/order.dart';
import 'package:alhafidh/states/controller/products.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/states/models/address_model.dart';
import 'package:alhafidh/states/models/customer_model.dart';
import 'package:alhafidh/states/models/get_shipping_rate.dart';
import 'package:alhafidh/states/models/transaction_model.dart';
import 'package:alhafidh/ui/screens/checkout/payment_body.dart';
import 'package:alhafidh/ui/screens/checkout/shipping_body.dart';
import 'package:alhafidh/ui/screens/checkout/shipping_rate.dart';
import 'package:alhafidh/ui/screens/thankyou/thankyou.dart';
import 'package:alhafidh/ui/widgets/custom_app_bar.dart';
import 'package:alhafidh/ui/widgets/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkApms.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkLocale.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../widgets/custom_btn.dart';
import 'package:flutter_paytabs_bridge/BaseBillingShippingInfo.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkConfigurationDetails.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkTokeniseType.dart';
import 'package:flutter_paytabs_bridge/flutter_paytabs_bridge.dart';
import 'package:flutter_paytabs_bridge/IOSThemeConfiguration.dart';
import 'package:flutter_paytabs_bridge/PaymentSDKQueryConfiguration.dart';

class CheckoutScreen extends StatefulWidget {
  static String routeName = '/checkout';

  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  //test id
  //final String profileId = "116173";
  final String profileId = "48450";

  ///test key
  // final String serverKey = "SRJNJMZLLR-J62G2JJHWH-MZZNR9NLKT";
  //live
  final String serverKey = "S6JNL9GGZG-J6M6D6LRMB-Z2KM6KJZBT";

  ///test key
  //final clientKey = "CMKMR2-GQT26G-MTM66H-DV7HH6";
  //live
  final clientKey = "C9KMDT-B2NQ6G-NGDGBR-PT6M2P";

  final OrderController _checkoutCon = Get.find<OrderController>();
  final ProductsController _productsCon = Get.find<ProductsController>();
  final AddressController _addressCon = Get.find<AddressController>();
  final CartsController _cartsCon = Get.find<CartsController>();

  bool _showPaymentOptions = false;
  bool _showShippingRateOptions = false;
  int? _isSelectedPayment;

  // List<CartItemModel>? _cartItems;
  // double _totalPrice = 0.0;
  Address? _selectedAddress;
  ShippingRate? _selectedRate;
  DateTime? _scheduleDate;
  CustomerModel? userModel;


  @override
  void initState() {
    _productsCon.getExchangeRate();
    if (Get.arguments != null) {
      _showShippingRateOptions = Get.arguments[0];
      if (_showShippingRateOptions == true) {
        _checkoutCon.getShippingRate(edge: 'dami');
      }
    }

    // _totalPrice = Get.arguments[1];
    if (Preference.getLoggedInFlag()) {
      //get customer obj data
      userModel = Preference.getUserDetails();
      _addressCon.getAddresses(
        customerID:
            int.parse(userModel!.customer.id.replaceAll(RegExp(r'[^0-9]'), '')),
      );

      ///for live
      //associate customer in checkout
      _checkoutCon.associateCustomerCheckout(
          checkoutId: Preference.getCartCheckOutId(),
          customerTkn: Preference.getCToken());
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: const CustomAppbar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              CustomTitle(title: AppLocalizations.of(context)!.checkout),
              addH(10.h),
              // Status
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/svg/check_colored.svg',
                  ),
                  Container(
                    width: 120.w,
                    height: 1,
                    margin: EdgeInsets.symmetric(horizontal: 5.w),
                    color: Colors.grey,
                  ),
                  SvgPicture.asset(
                    _showPaymentOptions
                        ? 'assets/svg/check_colored.svg'
                        : 'assets/svg/p_check.svg',
                  ),
                ],
              ),
              addH(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  addW(40.w),
                  Text(
                    AppLocalizations.of(context)!.shipping,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: ConstantStrings.kFontFamily,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  addW(100.h),
                  Text(
                    AppLocalizations.of(context)!.review_payment,
                    style: TextStyle(
                      fontFamily: ConstantStrings.kFontFamily,
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),

              addH(20.h),
              _showShippingRateOptions
                  ? _showPaymentOptions
                      ? PaymentBody(
                          orderController: _checkoutCon,
                          onChange: (value) {
                            _isSelectedPayment = value;
                          },
                          productCon: _productsCon,
                        )
                      : ShippingRateBody(
                          orderController: _checkoutCon,
                          getSelectedRate: (ShippingRate sr) {
                            //set rate
                            _selectedRate = sr;
                          },
                        )
                  : ShippingAddressBody(
                      addressCon: _addressCon,
                      getSelectedAddress: (Address aModel) => setState(
                        () => _selectedAddress = aModel,
                      ),
                      scheduleDeliveryFn: (date) => _scheduleDate = date,
                    ),

              const Spacer(),

              // Proceed button
              Center(
                child: CustomBtn(
                  onPressedFn: _showShippingRateOptions
                      ? _showPaymentOptions
                          ? () async {
                              //print("test guest");
                              //for order
                              if (_isSelectedPayment == 1) {
                               // print('cart');
                              //  print(_cartsCon.cartItemList.length);

                                //for cashOnDv trans
                                Transactions transactions = Transactions(
                                  kind: 'sale',
                                  status: 'pending',
                                  amount: _checkoutCon.isDiscounted.value
                                      ? _checkoutCon.discountPrice.value
                                          .toString()
                                      : _cartsCon.retriveCartListModel!.cart
                                          .cost.totalAmount.amount,
                                  gateway: 'Cash on Delivery (COD)',
                                );

                              //   print("test guest a");

                                ///for cash on deliveary Order
                                createOrder(
                                  transactions: transactions,
                                  financialStatus: 'pending',
                                  cartList: [
                                    for (var cartItem in _checkoutCon
                                        .checkoutResponse!
                                        .checkoutCreate
                                        .checkout
                                        .lineItems
                                        .edges)
                                      {
                                        "id": cartItem.node.id,
                                        "title": cartItem.node.title,
                                        "quantity": cartItem.node.quantity,
                                        "price":
                                            cartItem.node.variant.price.amount
                                      },
                                  ],

                                  //pass shipping address
                                  shippingAddress: Address(
                                    id: Preference.getLoggedInFlag()
                                        ? _addressCon.defaultAddressList[0].id
                                        : 0,
                                    customerId: Preference.getLoggedInFlag()
                                        ? _addressCon
                                            .defaultAddressList[0].customerId
                                        : 0,
                                    firstName: Preference.getLoggedInFlag()
                                        ? _addressCon
                                            .defaultAddressList[0].firstName
                                        : Preference.getGuestFName(),
                                    lastName: Preference.getLoggedInFlag()
                                        ? _addressCon
                                            .defaultAddressList[0].lastName
                                        : Preference.getGuestLName(),
                                    company: Preference.getLoggedInFlag()
                                        ? _addressCon
                                            .defaultAddressList[0].company
                                        : '',
                                    address1: Preference.getLoggedInFlag()
                                        ? _addressCon
                                            .defaultAddressList[0].address1
                                        : Preference.getGuestAddress(),
                                    address2: Preference.getLoggedInFlag()
                                        ? _addressCon
                                            .defaultAddressList[0].address2
                                        : "",
                                    city: Preference.getLoggedInFlag()
                                        ? _addressCon.defaultAddressList[0].city
                                        : Preference.getGuestCity(),
                                    province: Preference.getLoggedInFlag()
                                        ? _addressCon
                                            .defaultAddressList[0].province
                                        : null,
                                    country: Preference.getLoggedInFlag()
                                        ? _addressCon
                                            .defaultAddressList[0].country
                                        : '',
                                    zip: Preference.getLoggedInFlag()
                                        ? _addressCon.defaultAddressList[0].zip
                                        : '',
                                    phone: Preference.getLoggedInFlag()
                                        ? _addressCon
                                            .defaultAddressList[0].phone
                                        : Preference.getGuestPhone(),
                                    name: Preference.getLoggedInFlag()
                                        ? _addressCon.defaultAddressList[0].name
                                        : "${Preference.getGuestFName()} ${Preference.getGuestLName()}",
                                    provinceCode: Preference.getLoggedInFlag()
                                        ? _addressCon
                                            .defaultAddressList[0].provinceCode
                                        : null,
                                    countryCode: Preference.getLoggedInFlag()
                                        ? _addressCon
                                            .defaultAddressList[0].countryCode
                                        : '',
                                    countryName: Preference.getLoggedInFlag()
                                        ? _addressCon
                                            .defaultAddressList[0].countryName
                                        : 'IQ',
                                    addressDefault: Preference.getLoggedInFlag()
                                        ? _addressCon.defaultAddressList[0]
                                            .addressDefault
                                        : false,
                                  ),

                                );
                              } else {
                                ///for Payment method
                                paymentMethodPayTabs();
                              }
                            }
                          : () {
                             // print("test guest 2");
                             // print('rate =>');
                              setShippingRate();
                            }
                      : () {
                         // print("test guest 3");
                         // print('address =>');

                          ///try shipping address
                          setShippingAddress();
                        },
                  btnTxt: _showShippingRateOptions
                      ? _showPaymentOptions
                          ? AppLocalizations.of(context)!.checkout
                          : AppLocalizations.of(context)!.next
                      : AppLocalizations.of(context)!.next,
                  btnSize: Size(255.w, 46.h),
                ),
              ),
              addH(15.h),
            ],
          ),
        ),
      ),
    );
  }

  void setShippingRate() {
    _selectedRate ??= _checkoutCon
        .getShippingRateObj!.node.availableShippingRates.shippingRates[0];
    _checkoutCon.setShippingRate(rate: _selectedRate);
    setState(() {
      _showPaymentOptions = true;
    });
  }

  void setShippingAddress() {
    //data set shipping adress
    _checkoutCon.setShippingAddress(
      email: '',
      lastName: _addressCon.defaultAddressList[0].lastName,
      firstName: _addressCon.defaultAddressList[0].firstName,
      address1: _addressCon.defaultAddressList[0].address1,
      province: '',
      country: 'IQ',
      zip: _addressCon.defaultAddressList[0].zip,
      city: _addressCon.defaultAddressList[0].city,
      checkoutId: Preference.getCartCheckOutId(),
    );

    Get.defaultDialog(
      title: AppLocalizations.of(context)!.processing,
      content: Obx(
        () {
          if (_checkoutCon.setShippingAddressLoading.value) {
            return SizedBox(
              height: 100.h,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            //go next page
            Future.delayed(
              const Duration(seconds: 0),
              () {
                setState(() {
                  //set done
                  _showShippingRateOptions = true;
                  //call for get rate
                  _checkoutCon.getShippingRate(edge: 'dami');

                  Get.back();
                });
              },
            );
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  void paymentMethodPayTabs() {
    generateConfig();
    payPressed();
  }

  PaymentSdkConfigurationDetails generateConfig() {
    var billingDetails = BillingDetails(
      Preference.getLoggedInFlag()
          ? _addressCon.defaultAddressList[0].name:"${Preference.getGuestFName()} ${Preference.getGuestLName()}",
      Preference.getLoggedInFlag()
          ?Preference.getLoginEmail()
          :Preference.getGuestEmail() ,
      Preference.getLoggedInFlag()
          ? _addressCon
          .defaultAddressList[0].phone
          : Preference.getGuestPhone(),
      Preference.getLoggedInFlag()
          ? _addressCon
          .defaultAddressList[0].address1
          : Preference.getGuestAddress(),
      Preference.getLoggedInFlag()
          ? _addressCon
          .defaultAddressList[0].country
          : '',
      Preference.getLoggedInFlag()
          ? _addressCon.defaultAddressList[0].city
          : Preference.getGuestCity(),
      Preference.getLoggedInFlag()
          ? _addressCon.defaultAddressList[0].city
          : Preference.getGuestCity(),
      Preference.getLoggedInFlag()
          ? _addressCon.defaultAddressList[0].zip
          : '',
    );



    List<PaymentSdkAPms> apms = [];
    apms.add(PaymentSdkAPms.AMAN);
    var configuration;
    if(Preference.getIsArabicFlag()){
      configuration  = PaymentSdkConfigurationDetails(
        profileId: profileId,
        serverKey: serverKey,
        clientKey: clientKey,
        cartId: Preference.getCartCheckOutId(),
        cartDescription: "a",
        merchantName: "Alhafidh",
        screentTitle: "الدفع بالبطاقة",
        amount: double.parse(_checkoutCon.setShippingRateObj!
            .checkoutShippingLineUpdate.checkout.totalPrice.amount),
        showBillingInfo: true,
        forceShippingInfo: false,
        currencyCode: "USD",
        merchantCountryCode: "AE",
        billingDetails: billingDetails,
        // shippingDetails: shippingDetails,
        locale:  PaymentSdkLocale.AR,
        // alternativePaymentMethods: apms,
        linkBillingNameWithCardHolderName: true,
        merchantApplePayIndentifier: "merchant.com.bundleID",
      );
    }else{
       configuration = PaymentSdkConfigurationDetails(
        profileId: profileId,
        serverKey: serverKey,
        clientKey: clientKey,
        cartId: Preference.getCartCheckOutId(),
        cartDescription: "a",
        merchantName: "Alhafidh",
        screentTitle: "Pay with Card",
        amount: double.parse(_checkoutCon.setShippingRateObj!
            .checkoutShippingLineUpdate.checkout.totalPrice.amount),
        showBillingInfo: true,
        forceShippingInfo: false,
        currencyCode: "USD",
        merchantCountryCode: "AE",
        billingDetails: billingDetails,
        // shippingDetails: shippingDetails,
        locale: PaymentSdkLocale.EN,
        // alternativePaymentMethods: apms,
        linkBillingNameWithCardHolderName: true,
        merchantApplePayIndentifier: "merchant.com.bundleID",
      );

    }


    //hide all address
    configuration.showBillingInfo = true;
    configuration.showShippingInfo = false;

    var theme = IOSThemeConfigurations(
      primaryColor: 'ff5000',
    );

    theme.backgroundColor = "ff5000";
    theme.primaryColor = "FF5000";
    theme.secondaryColor = "FF5000";
    theme.logoImage = "assets/images/splash_logo.png";

    configuration.iOSThemeConfigurations = theme;
    ///configuration.tokeniseType = PaymentSdkTokeniseType.MERCHANT_MANDATORY;
    return configuration;
  }

  PaymentSDKQueryConfiguration generateQueryConfig() {
    return new PaymentSDKQueryConfiguration(
        serverKey, clientKey, "US", profileId, "Transaction Reference");
  }

  Future<void> payPressed() async {
    FlutterPaytabsBridge.startCardPayment(generateConfig(), (event) {
      setState(() {
        if (event["status"] == "success") {
          // Handle transaction details here.
          var transactionDetails = event["data"];
          print(transactionDetails);
          if (transactionDetails["isSuccess"]) {
            print("successful transaction");

            //for paid transaction payment
            Transactions transactions = Transactions(
              kind: 'sale',
              status: 'success',
              amount: _checkoutCon.isDiscounted.value
                  ? _checkoutCon.discountPrice.value.toString()
                  : _cartsCon
                      .retriveCartListModel!.cart.cost.totalAmount.amount,
              gateway: 'PayTabs UAE',
            );

            //order create for paid
            createOrder(
              transactions: transactions,
              financialStatus: 'paid',

              ///pass cart item
              cartList: [
                for (var cartItem in _checkoutCon
                    .checkoutResponse!.checkoutCreate.checkout.lineItems.edges)
                  {
                    "id": cartItem.node.id,
                    "title": cartItem.node.title,
                    "quantity": cartItem.node.quantity,
                    "price": cartItem.node.variant.price.amount
                  },
              ],

              //added shipping address
              shippingAddress: Address(
                id: Preference.getLoggedInFlag()
                    ? _addressCon.defaultAddressList[0].id
                    : 0,
                customerId: Preference.getLoggedInFlag()
                    ? _addressCon
                    .defaultAddressList[0].customerId
                    : 0,
                firstName: Preference.getLoggedInFlag()
                    ? _addressCon
                    .defaultAddressList[0].firstName
                    : Preference.getGuestFName(),
                lastName: Preference.getLoggedInFlag()
                    ? _addressCon
                    .defaultAddressList[0].lastName
                    : Preference.getGuestLName(),
                company: Preference.getLoggedInFlag()
                    ? _addressCon
                    .defaultAddressList[0].company
                    : '',
                address1: Preference.getLoggedInFlag()
                    ? _addressCon
                    .defaultAddressList[0].address1
                    : Preference.getGuestAddress(),
                address2: Preference.getLoggedInFlag()
                    ? _addressCon
                    .defaultAddressList[0].address2
                    : "",
                city: Preference.getLoggedInFlag()
                    ? _addressCon.defaultAddressList[0].city
                    : Preference.getGuestCity(),
                province: Preference.getLoggedInFlag()
                    ? _addressCon
                    .defaultAddressList[0].province
                    : null,
                country: Preference.getLoggedInFlag()
                    ? _addressCon
                    .defaultAddressList[0].country
                    : '',
                zip: Preference.getLoggedInFlag()
                    ? _addressCon.defaultAddressList[0].zip
                    : '',
                phone: Preference.getLoggedInFlag()
                    ? _addressCon
                    .defaultAddressList[0].phone
                    : Preference.getGuestPhone(),
                name: Preference.getLoggedInFlag()
                    ? _addressCon.defaultAddressList[0].name
                    : "${Preference.getGuestFName()} ${Preference.getGuestLName()}",
                provinceCode: Preference.getLoggedInFlag()
                    ? _addressCon
                    .defaultAddressList[0].provinceCode
                    : null,
                countryCode: Preference.getLoggedInFlag()
                    ? _addressCon
                    .defaultAddressList[0].countryCode
                    : '',
                countryName: Preference.getLoggedInFlag()
                    ? _addressCon
                    .defaultAddressList[0].countryName
                    : 'IQ',
                addressDefault: Preference.getLoggedInFlag()
                    ? _addressCon.defaultAddressList[0]
                    .addressDefault
                    : false,
              ),
            );
            if (transactionDetails["isPending"]) {
              print("transaction pending");
            }
          } else {
            print("failed transaction");
          }

          // print(transactionDetails["isSuccess"]);
        } else if (event["status"] == "error") {
          print("error transaction");

          // Handle error here.
        } else if (event["status"] == "event") {
          // Handle events here.
          print("event transaction");
        }
      });
    });
  }

  void createOrder({
    required Transactions transactions,
    required String financialStatus,
    required List cartList,
    required Address shippingAddress,
  }) {
    _checkoutCon.order(
      cartList: cartList,
      transitions: transactions,
      financialStatus: financialStatus,
      shippingAddress: shippingAddress,
      //pass discount price
      discountPrice: double.parse(_checkoutCon.setShippingRateObj!
              .checkoutShippingLineUpdate.checkout.subtotalPrice.amount) -
          _checkoutCon.discountPrice.value,
      discountCode: _checkoutCon.discountCode.value.toString(),
      isDiscount: _checkoutCon.isDiscounted.value,
    );

    Get.defaultDialog(
      title: AppLocalizations.of(context)!.processing,
      content: Obx(
        () {
          if (_checkoutCon.orderLoading.value) {
            return SizedBox(
              height: 100.h,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            Future.delayed(
              const Duration(seconds: 1),
              () {
                _cartsCon.removeAllFromCart(
                    cId: _cartsCon.cartId.value, linesIds: _cartsCon.linesList);

                //clear note from pref
                Preference.setCartNote('');
                //go to thank you page
                Get.offAllNamed(ThankyouScreen.routeName,
                    arguments: [_checkoutCon.orderId.toString()]);
              },
            );
            return Center(
              child: Text(
                  AppLocalizations.of(context)!.order_successfully_completed),
            );
          }
        },
      ),
    );
  }
}
