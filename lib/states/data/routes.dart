import 'package:alhafidh/ui/screens/about_us/about_us.dart';
import 'package:alhafidh/ui/screens/add_address/add_address.dart';
import 'package:alhafidh/ui/screens/address_book/address_book.dart';
import 'package:alhafidh/ui/screens/checkout/checkout.dart';
import 'package:alhafidh/ui/screens/contact_us/contact.dart';
import 'package:alhafidh/ui/screens/faQ/faq.dart';
import 'package:alhafidh/ui/screens/forgot_password/forgot_password.dart';
import 'package:alhafidh/ui/screens/guest_contact_info/add_guest_address.dart';
import 'package:alhafidh/ui/screens/help_servcies/help_services.dart';
import 'package:alhafidh/ui/screens/media_center/media_center.dart';
import 'package:alhafidh/ui/screens/my_orders/order_details.dart';
import 'package:alhafidh/ui/screens/my_orders/orders.dart';
import 'package:alhafidh/ui/screens/notifications/notification.dart';
import 'package:alhafidh/ui/screens/product_details_page/product_details.dart';
import 'package:alhafidh/ui/screens/products/products.dart';
import 'package:alhafidh/ui/screens/search_screen/search_screen.dart';
import 'package:alhafidh/ui/screens/service_locator/service_locator.dart';
import 'package:alhafidh/ui/screens/store_locator/store_locator.dart';
import 'package:alhafidh/ui/screens/thankyou/thankyou.dart';
import 'package:alhafidh/ui/screens/wishlist/wishlist.dart';
import 'package:get/route_manager.dart';
import '../../ui/screens/home/home.dart';
import '../../ui/screens/login/login.dart';
import '../../ui/screens/onbording/onbording.dart';
import '../../ui/screens/register/register.dart';
import '../../ui/screens/splash/splash.dart';
import '../../ui/screens/warrenty_screen/warranty_screen.dart';
import '../bindings/bindings.dart';

class AllRoutes {
  static List<GetPage> allroutes = [
    GetPage(
      name: SplashScreen.routeName,
      page: () => const SplashScreen(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: HomeScreen.routeName,
      page: () => const HomeScreen(),
      bindings: [
        HomeBinding(),
        CartBinding(),
        OrderBinding(),
        ProductsBinding()
      ],
    ),
    GetPage(
      name: Onbording.routeName,
      page: () => const Onbording(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: LoginScreen.routeName,
      page: () => const LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: RegisterScreen.routeName,
      page: () => const RegisterScreen(),
      binding: AuthBinding(),
    ),

    // GetPage(
    //   name: CategoriesScreen.routeName,
    //   page: () => const CategoriesScreen(),
    // ),

    GetPage(
      name: ProductsScreen.routeName,
      page: () => const ProductsScreen(),
      bindings: [
        ProductsBinding(),
        CartBinding(),
      ],
    ),

    GetPage(
      name: AddressBookScreen.routeName,
      page: () => const AddressBookScreen(),
      binding: AddressBinding(),
    ),
    GetPage(
      name: AddAddress.routeName,
      page: () => const AddAddress(),
      binding: AddressBinding(),
    ),
    GetPage(
      name: StoreLocatorScreen.routeName,
      page: () => const StoreLocatorScreen(),
      binding: ProductsBinding(),
    ),
    GetPage(
      name: ServiceLocatorScreen.routeName,
      page: () => const ServiceLocatorScreen(),
      binding: ProductsBinding(),
    ),
    GetPage(
      name: WarrantyScreen.routeName,
      page: () => const WarrantyScreen(),
       binding: SectionBinding(),
    ),
    GetPage(
        name: CheckoutScreen.routeName,
        page: () => const CheckoutScreen(),
        bindings: [
          AddressBinding(),
          OrderBinding(),
        ]),
    GetPage(
      name: ThankyouScreen.routeName,
      page: () => const ThankyouScreen(),
    ),
    GetPage(
      name: Orders.routeName,
      page: () => const Orders(),
      bindings: [
        OrderBinding(),
        ProductsBinding(),
      ],
    ),
    GetPage(
      name: ForgotPasswordScreen.routeName,
      page: () => const ForgotPasswordScreen(),
      binding: ResetBinding(),
    ),
    GetPage(
      name: ProductDetails.routeName,
      page: () => const ProductDetails(),
      bindings: [
        ProductsBinding(),
        CartBinding(),
      ],
    ),
    GetPage(
      name: NotificationScreen.routeName,
      page: () => const NotificationScreen(),
      // binding: ProductsBinding(),
    ),
    GetPage(
      name: ContactUs.routeName,
      page: () => const ContactUs(),
      // binding: (),
    ),
    GetPage(
      name: Wishlist.routeName,
      page: () => const Wishlist(),
      // binding: (),
    ),
    GetPage(
      name: AddGuestAddressScreen.routeName,
      page: () => const AddGuestAddressScreen(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: OrderDetails.routeName,
      page: () => const OrderDetails(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: HelpAndServices.routeName,
      page: () => const HelpAndServices(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: FaQ.routeName,
      page: () => const FaQ(),
      binding: SectionBinding(),
    ),
    GetPage(
      name: SearchScreen.routeName,
      page: () => const SearchScreen(),
      binding: ProductsBinding(),
    ),
    GetPage(
      name: AboutUs.routeName,
      page: () => const AboutUs(),
      binding: SectionBinding(),
    ),
    GetPage(
      name: MediaCenterScreen.routeName,
      page: () => const MediaCenterScreen(),
      binding: SectionBinding(),
    ),
  ];
}
