import 'package:flutter/material.dart';
import 'package:pas_ecommerce/utils/colors/colors.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import '../../provider/home.dart';

class MyHomePage extends StatelessWidget {
  static const nameRoute = '/homepage';
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, home, child) {
        return Scaffold(

          body: home.pages[home.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: home.currentIndex,
            onTap: (int index) {
              home.setCurrentIndex(index);
            },
            unselectedItemColor: const Color.fromRGBO(19, 20, 13, 1),
            selectedItemColor: const Color.fromARGB(255, 253, 170, 93),
            backgroundColor: const Color.fromARGB(255, 239, 241, 243),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                ),
                label: 'Home',
                backgroundColor: Color.fromARGB(255, 239, 241, 243),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.local_mall_outlined,
                ),
                label: 'My Cart',
                backgroundColor: Color.fromARGB(255, 239, 241, 243),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.article_rounded),
                label: 'History',
                backgroundColor: Color.fromARGB(255, 239, 241, 243),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline_rounded,
                ),
                label: 'Profile',
                backgroundColor: Color.fromARGB(255, 239, 241, 243),
              ),
            ],
            showSelectedLabels: true,
            showUnselectedLabels: true,
          ),
          extendBody: true,
          bottomSheet: Container(
            height: 0.5,
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
          ),
        );
      },
    );
  }
}
