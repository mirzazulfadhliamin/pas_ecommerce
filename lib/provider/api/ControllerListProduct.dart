import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/BarangResponseModel.dart';

import 'package:flutter/material.dart';

class ProductData extends ChangeNotifier {
  List<Product> _products = [];
  bool isLoading = true;

  List<Product> get products => _products;

  bool get isLoadingData => isLoading;

  void loadSession() async {
    notifyListeners();
  }

  Future<void> loadData() async {
    try {
      final response =
      await http.get(Uri.parse("https://dummyjson.com/products"));

      if (response.statusCode == 200) {
         _products.assignAll(productResponseModelFromJson(response.body).products);
         isLoading = false;
         notifyListeners();
      } else {

        print("Error: Status Code ${response.statusCode}");
      }
    } catch (e) {
      // Menangani kesalahan lainnya
      print("Error: $e");
    }
  }
}
