import 'package:get/get.dart';
import 'package:pas_ecommerce/controller/api/ControllerListProduct.dart';
import 'package:pas_ecommerce/controller/api/makeupListCtrl.dart';
import 'package:pas_ecommerce/controller/api/productListCTRL.dart';
import 'package:pas_ecommerce/pages/Menu/PaymentPage.dart';
import 'package:pas_ecommerce/pages/NavigationBar/BottomNavigationBar.dart';
import 'package:pas_ecommerce/pages/auth_page.dart';
import 'package:pas_ecommerce/pages/Menu/detailpage.dart';
import 'package:pas_ecommerce/router/route_name.dart';
import 'package:pas_ecommerce/splashscreen.dart';

class AppPages {
  static final pages = [
    GetPage(name: RouteNames.auth, page: () => LoginScreen()),
    GetPage(name: RouteNames.splashscreen, page: () => SplashScreen()),
     GetPage(name: RouteNames.paymentPage, page: () => PaymentPage()),
    GetPage(
      name: RouteNames.home,
      page: () => MyHomePage(),
      binding: BindingsBuilder(
        () {
          Get.lazyPut(() => ControllerListProduct());
          Get.lazyPut(() => ProductListCrl());
          Get.lazyPut(() => MakeUpList());
        },
      ),
    ),
    GetPage(
      name: RouteNames.detailPage,
      page: () => ProductDetailPage(),
      binding: BindingsBuilder(
        () {       
        },
      ),
    ),
  ];
}
