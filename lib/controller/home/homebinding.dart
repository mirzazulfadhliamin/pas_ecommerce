

import 'package:get/get.dart';
import 'package:pas_ecommerce/controller/home/homectrl.dart';
import 'package:pas_ecommerce/controller/productListCTRL.dart';

class HomeBinding extends Bindings {
  void dependencies() {
    Get.put(HomeController());
    Get.put(ControllerListProduct());
  }
}
