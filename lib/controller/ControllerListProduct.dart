import 'dart:convert';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/BarangResponseModel.dart';

class ControllerListProduct extends GetxController {
  RxList<Product> productResponModelctr = <Product>[].obs;

  SharedPreferences? prefs;
  RxBool isLoading = true.obs;
  RxString sesionUsername = "".obs;

  void loadSesion() async {
    prefs = await SharedPreferences.getInstance();
    sesionUsername.value = prefs!.getString("username") ?? "no data";
  }

  @override
  void onInit() {
    super.onInit();
    loadSesion();
    LoadData();
  }

  LoadData() async {
    try {
      final response =
          await http.get(Uri.parse("https://dummyjson.com/products?limit=100"));

      if (response.statusCode == 200) {
        // Mengurai data JSON menggunakan response model
        final data = json.decode(response.body);
        final productResponse = productResponseModelFromJson(json.encode(data));
        productResponModelctr.value = productResponse.products;
      } else {
        print("Status Code : ${response.statusCode}");
      }
      isLoading.value = false;
    } catch (e) {
      print("error: $e");
    }
  }
}