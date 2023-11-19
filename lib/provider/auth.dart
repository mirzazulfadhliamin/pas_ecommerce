import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:async';

class Autth with ChangeNotifier {
  Timer? _authTimer;
  String? _idToken, userId;
  DateTime? _expiryDate;
  String? _tempidToken, tempuserId;
  DateTime? _tempexpiryDate;

  int? onboarding;

  Future<void> tempData() async {
    print(isAuth);
    _idToken = _tempidToken;
    _expiryDate = _tempexpiryDate;
    userId = tempuserId;

    final sharedPref = await SharedPreferences.getInstance();

    final myMapSPref = json.encode({
      'token': _tempidToken,
      'uid': tempuserId,
      'expired': _tempexpiryDate?.toIso8601String(),
    });

    sharedPref.setString('authData', myMapSPref);

    notifyListeners();
  }

  bool get firstapp {
    return onboarding == null;
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
      print(responseData);

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
    } catch (error) {
      throw error;
    }
  }

  Future<void> logout() async {
    _idToken = null;
    userId = null;
    _expiryDate = null;

    if (_authTimer != null) {
      _authTimer?.cancel();
      _authTimer = null;
    }

    final pref = await SharedPreferences.getInstance();
    pref.clear();

    notifyListeners();
  }

  void _autologout() {
    if (_authTimer != null) {
      _authTimer!.cancel();
    }
    var timeToExpiry = _tempexpiryDate?.difference(DateTime.now()).inSeconds;
    print(timeToExpiry);
    _authTimer = Timer(Duration(seconds: 4), logout);
  }

  Future<bool> autoLogin() async {
    final pref = await SharedPreferences.getInstance();

    if (!pref.containsKey('authData')) {
      return false;
    }

    final myData =
        json.decode("${pref.get('authData')}") as Map<String, dynamic>;
    final myExpiryDate = DateTime.parse(myData["expired"]);

    if (myExpiryDate.isBefore(DateTime.now())) {
      return false;
    }

    _idToken = myData["token"];

    userId = myData["uid"];
    print(myData);

    _expiryDate = myExpiryDate;
    notifyListeners();
    return true;
  }
}
