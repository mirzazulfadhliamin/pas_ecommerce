import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pas_ecommerce/homescreen.dart';
import 'package:pas_ecommerce/onboarding.dart';
import 'package:pas_ecommerce/pages/NavigationBar/BottomNavigationBar.dart';
import 'package:pas_ecommerce/pages/auth_page.dart';
import 'package:pas_ecommerce/pages/home.dart';
import 'package:pas_ecommerce/provider/auth.dart';
import 'package:pas_ecommerce/splashscreen.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Autth(),
          ),
        ],
        builder: (context, child) => Consumer<Autth>(
              builder: (context, auth, child) => GetMaterialApp(
                title: 'ECommerce',
                debugShowCheckedModeBanner: false,
                routes: {},
                home: auth.isAuth
                    ? MyHomePage()
                    : FutureBuilder(
                        future: auth.autoLogin(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Scaffold(
                              body: Center(),
                            );
                          }

                          return LoginScreen();
                        },
                      ),
              ),
            ));
  }
}
