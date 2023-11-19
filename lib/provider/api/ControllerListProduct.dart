import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/BarangResponseModel.dart';

import 'package:flutter/material.dart';

class ProductData extends ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

  void loadSession() async {
    notifyListeners();
  }

  Future<void> loadData() async {
    try {
      final response = await http.get(Uri.parse("https://dummyjson.com/products?limit=10"));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final productResponse = productResponseModelFromJson(json.encode(data));
        _products = productResponse.products;
      } else {
        print("Status Code : ${response.statusCode}");
      }
      _isLoading = false;
    } catch (e) {
      print("error: $e");
    }
    notifyListeners();
  }
}


