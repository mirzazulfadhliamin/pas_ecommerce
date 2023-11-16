// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:pas_ecommerce/homescreen.dart';
// import 'package:pas_ecommerce/onboarding.dart';
// import 'package:get/get.dart';
// import 'package:pas_ecommerce/pages/NavigationBar/BottomNavigationBar.dart';
// import 'package:pas_ecommerce/provider/auth.dart';
// import 'package:provider/provider.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//       static const nameRoute = '/splashscreen';

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(
//       Duration(seconds: 3),
//       () {
//         Get.offAndToNamed(MyHomePage.nameRoute);
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         decoration: BoxDecoration(
//             color: Colors.black,
//             image: DecorationImage(
//               image: AssetImage("assets/BG.jpg"),
//               fit: BoxFit.cover,
//               opacity: 0.4,
//             )),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.shopping_cart,
//               size: 200,
//               color: Colors.cyan,
//             ),
//             Hero(
//               tag: "title",
//               child: Text(
//                 "Kenzol",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 40,
//                   fontWeight: FontWeight.bold,
//                   fontStyle: FontStyle.italic,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pas_ecommerce/pages/auth_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
   static const nameRoute = '/splashscreen';

@override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/splash 1.png',
      nextScreen: LoginScreen(),
      splashTransition: SplashTransition.rotationTransition,
      pageTransitionType: PageTransitionType.scale,
    );
  }
}