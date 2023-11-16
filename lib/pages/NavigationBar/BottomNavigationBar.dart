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
          // appBar: AppBar(
          //   backgroundColor: db7_dark_yellow,
          //   title: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Image.asset(
          //         'assets/splash 1.png',
          //         width: 100,
          //       ),
          //       IconButton(
          //         icon: const Icon(Icons.menu),
          //         iconSize: 30,
          //         onPressed: () {
          //           // Aksi yang ingin Anda jalankan ketika hamburger (menu) ditekan
          //         },
          //       ),
          //     ],
          //   ),
          //   bottom: PreferredSize(
          //     preferredSize: const Size.fromHeight(4.0),
          //     child: Container(
          //       color: Colors.white.withOpacity(0.3),
          //       height: 1.0,
          //     ),
          //   ),
          // ),
          body: home.pages[home.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: home.currentIndex,
            onTap: (int index) {
              home.setCurrentIndex(index);
            },
            unselectedItemColor: const Color.fromRGBO(255, 255, 255, 0.6),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                ),
                label: 'Home',
                backgroundColor: db7_colorPrimary,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.local_mall_outlined,
                ),
                label: 'My Cart',
                backgroundColor: db7_colorPrimary,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sms_outlined),
                label: 'Message',
                backgroundColor: db7_colorPrimary,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline_rounded,
                ),
                label: 'Profile',
                backgroundColor: db7_colorPrimary,
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
