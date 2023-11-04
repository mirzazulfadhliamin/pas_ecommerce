import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pas_ecommerce/homescreen.dart';
import 'package:pas_ecommerce/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState(){
    super.initState();
    Timer(
      Duration(seconds: 3),
    ()=> Navigator.push(
      context,
       MaterialPageRoute(builder: (context) => OnboardingScreen(),
    ))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage("assets/BG.jpg"),
            fit: BoxFit.cover,
            opacity: 0.4,
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon
            (Icons.shopping_cart,
            size: 200,
            color: Colors.cyan,
            ),
            Text(
              "Toko",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            )
          ],
        ),
      ),
    );
  }
}