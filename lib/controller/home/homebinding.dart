

import 'package:get/get.dart';
import 'package:pas_ecommerce/controller/home/homectrl.dart';

import '../api/productListCTRL.dart';


class HomeBinding extends Bindings {
  void dependencies() {
    Get.put(HomeController());
    Get.put(ProductListCrl());
  }
}
