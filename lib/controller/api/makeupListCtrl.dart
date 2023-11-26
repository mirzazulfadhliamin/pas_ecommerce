import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:pas_ecommerce/models/ProductResponseModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class  MakeUpList extends GetxController {
  RxList<ProductResponseModel> productResponModelctr = <ProductResponseModel>[].obs;
  // SharedPreferences? prefs;
  RxBool isLoading = true.obs;
  // RxString sesionUsername = "".obs;

  // void loadSesion() async {
  //   prefs = await SharedPreferences.getInstance();
  //   sesionUsername.value = prefs!.getString("username") ?? "no data";
  // }

  @override
  void onInit() {
    super.onInit();
    // loadSesion();
    LoadData();
  }

  LoadData() async {
    try {
      final response = await http.get(Uri.parse(
          "https://makeup-api.herokuapp.com/api/v1/products.json?brand=covergirl"));

      if (response.statusCode == 200) {
        //mengisi data dengan hasil json dari model
        productResponModelctr.value =
            productResponseModelFromJson(response.body);
      } else {
        print("Status Code : ${response.statusCode}");
      }
      isLoading.value = false;
    } catch (e) {
      print("error: $e");
    }
  }
}
