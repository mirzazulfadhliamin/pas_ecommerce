import 'package:flutter/cupertino.dart';

import '../homescreen.dart';
import '../pages/Menu/CartPage.dart';
import '../pages/Menu/NewsPage.dart';
import '../pages/Menu/ProfilePage.dart';

class HomeProvider with ChangeNotifier {
  int _currentIndex = 0;
  int activeIndex = 0;
  int get currentIndex => _currentIndex;

  void setActiveIndex(int index) {
    activeIndex = index;
    notifyListeners();
  }

  final List<Widget> pages = [
    HomePage(),
    NewsPage(),
    CartPage(),
    ProfilePage(),
  ];

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}

