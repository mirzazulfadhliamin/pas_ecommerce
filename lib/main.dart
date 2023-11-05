import 'package:flutter/material.dart';
import 'package:pas_ecommerce/homescreen.dart';
import 'package:pas_ecommerce/onboarding.dart';
import 'package:pas_ecommerce/pages/auth_page.dart';
import 'package:pas_ecommerce/provider/auth.dart';
import 'package:pas_ecommerce/splashscreen.dart';
import 'package:provider/provider.dart';

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
        )
      ],
      builder: (context, child) =>Consumer<Autth>(builder:(context, auth, child) =>  MaterialApp(
        title: 'ECommerce',
        debugShowCheckedModeBanner: false,
        home:auth.isAuth ? HomePage() : LoginScreen(),
        routes: {
          
        },
      ), )
    );
  }
}
