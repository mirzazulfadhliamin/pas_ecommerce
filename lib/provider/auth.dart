import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Autth with ChangeNotifier {
  String? _idToken, userId;
  DateTime? _expiryDate;
  String? _tempidToken, tempuserId;
  DateTime? _tempexpiryDate;

  void tempData() {
    _idToken = _tempidToken;
    _expiryDate = _tempexpiryDate;
    userId = tempuserId;
    notifyListeners();
  }

  bool get isAuth {
    return token != null;
  }

  String? get token {
    if (_idToken != null &&
        _expiryDate!.isAfter(DateTime.now()) &&
        _expiryDate != null) {
      return _idToken!;
    } else {
      return null;
    }
  }

  Future<void> signUp(String? email, String? password) async {
    Uri ulr = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDJzvfVU6k6CFF90rLT9OZQoCk9x6SRiAY");

    try {
      var response = await http.post(
        ulr,
        body: json.encode({
          "email": email,
          "password": password,
          "returnSecureToken": true,
        }),
      );
      print(json.encode(response.body));

      var resposedata = json.decode(response.body);

      if (resposedata['error'] != null) {
        throw resposedata['error']["message"];
      }

      _tempidToken = resposedata["idToken"];
      tempuserId = resposedata["localId"];
      _tempexpiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(resposedata["expiresIn"]),
        ),
      );
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> login(String email, String password) async {
    Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDJzvfVU6k6CFF90rLT9OZQoCk9x6SRiAY");
    try {
      var response = await http.post(
        url,
        body: json.encode({
          "email": email,
          "password": password,
          "returnSecureToken": true,
        }),
      );

      var responseData = json.decode(response.body);

      if (responseData['error'] != null) {
        throw responseData['error']["message"];
      }
      _tempidToken = responseData["idToken"];
      tempuserId = responseData["localId"];
      _tempexpiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(responseData["expiresIn"]),
        ),
      );
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
