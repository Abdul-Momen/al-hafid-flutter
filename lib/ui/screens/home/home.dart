import 'package:alhafidh/states/controller/cart.dart';
import 'package:alhafidh/states/controller/home.dart';
import 'package:alhafidh/states/controller/order.dart';
import 'package:alhafidh/states/controller/products.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/ui/screens/home/cart_page/cart_page.dart';
import 'package:alhafidh/ui/screens/home/category_page/category_page.dart';
import 'package:alhafidh/ui/screens/home/drawer.dart';
import 'package:alhafidh/ui/screens/home/home_page/home_page.dart';
import 'package:alhafidh/ui/screens/home/logo.dart';
import 'package:alhafidh/ui/screens/home/profile_page/profile_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../constants/color.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ProductsController _productsCon = Get.find<ProductsController>();
  final CartsController _cartsCon = Get.find<CartsController>();

  //final OrderController _orderCon = Get.find<OrderController>();
  final HomeController _homeCon = Get.find<HomeController>();

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  int _selectedpage = 0; //initial value
  String _cartId = ''; //initial value

  @override
  void initState() {
    Get.lazyPut(() => OrderController());
    // _productsCon.getExchangeRate();

    if (Preference.getCartId().isNotEmpty) {
      _cartsCon.getCartList(cId: Preference.getCartId());
    }
    super.initState();
    List<String> args = Get.arguments ?? [];
    if (args.isNotEmpty) {
      _selectedpage = int.parse(args[0]);
    }

    //get rewinds point
    if (Preference.getLoggedInFlag()) {
      _homeCon.getRewardsUserPoints(customerEmail: Preference.getLoginEmail());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: ConstantColors.lightRed,
        elevation: 0,
        // Drawer
        leading: InkWell(
          onTap: () => _scaffoldKey.currentState!.openDrawer(),
          child: SizedBox(
            width: 22.w,
            height: 20.h,
            child: Center(
              child: SvgPicture.asset(
                'assets/svg/icons_three_line.svg',
                color: Colors.white,
              ),
            ),
          ),
        ),
        centerTitle: true,
        // Logo
        title: const HomeLogo(),
        // Notification Icon
        actions: [],
      ),
      drawer: HomeDrawer(
        navigatingFn: (value) {
          _scaffoldKey.currentState!.closeDrawer();
          setState(
            () => _selectedpage = value,
          );
          /* if (value != 5) {
          }*/
        },
      ),
      body: getBodyView(),
      bottomNavigationBar: CurvedNavigationBar(
        color: ConstantColors.grayWhite,
        backgroundColor: ConstantColors.white,
        buttonBackgroundColor: ConstantColors.lightRed,
        index: _selectedpage,
        items: <Widget>[
          //bottom navigation icon
          Icon(
            Icons.home,
            size: 25.h,
            color: _selectedpage == 0 ? Colors.white : ConstantColors.grayBlack,
          ),
          Icon(
            Icons.category_outlined,
            size: 25.h,
            color: _selectedpage == 1 ? Colors.white : ConstantColors.grayBlack,
          ),
          Icon(
            Icons.person,
            size: 25.h,
            color: _selectedpage == 2 ? Colors.white : ConstantColors.grayBlack,
          ),
          Stack(
            children: <Widget>[
              Icon(
                Icons.shopping_bag_outlined,
                size: 25.h,
                color: _selectedpage == 3
                    ? Colors.white
                    : ConstantColors.grayBlack,
              ),
              Obx(() {
                if (_cartsCon.cartItemsLoading.value) {
                  return Text('');
                } else {
                  if (_cartsCon.cartItemList.isNotEmpty) {
                    return Positioned(
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 12.w,
                          minHeight: 12.h,
                        ),
                        child: Text(
                          _cartsCon.cartItemList.length.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  } else {
                    return Text('');
                  }
                }
              })
            ],
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedpage = index;
          });
        },
        letIndexChange: (index) => true,
      ),
    );
  }

  Widget getBodyView() {
    switch (_selectedpage) {
      case 0:
        return HomePage(
          homeCon: _homeCon,
          productCon: _productsCon,
          cartsCon: _cartsCon,
        );
      case 1:
        return CategoriesPage(
          backFn: () => setState(() => _selectedpage = 0),
        );
      case 2:
        return ProfilePage(
          backFn: () => setState(() => _selectedpage = 0),
          homeController: _homeCon,
        );

      case 3:
        return CartPage(
          backFn: () => setState(() => _selectedpage = 0),
          cartId: '',
          productsCon: _productsCon,
          // ordersCon: _orderCon,
          cartsCon: _cartsCon,
        );
      /* case 4:
        return ProductDetails(
          backFn: () => setState(() => _selectedpage = 0),
        );*/
      default:
        return Center(
          child: Text(
            AppLocalizations.of(context)!.something_wrong,
          ),
        );
    }
  }
}
