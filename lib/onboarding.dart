import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pas_ecommerce/homescreen.dart';
import 'package:pas_ecommerce/loginscreen.dart';

class OnboardingScreen extends StatelessWidget{
  
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context){
    final pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28,
      fontWeight: FontWeight.w700,
      ),
      bodyTextStyle: TextStyle(fontSize: 19),
      bodyPadding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      pageColor: Colors.white,
      imagePadding:  EdgeInsets.zero,
    );
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: "Belanja Sekarang",
          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eget varius est. Sed sodales dapibus nunc, sit amet facilisis nisl suscipit in. Nunc tincidunt sodales massa, ut semper nunc porta at. Nullam laoreet quis velit sed facilisis. Proin placerat pulvinar metus et feugiat. Morbi a convallis mauris. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec laoreet condimentum augue, sit amet aliquet sem sagittis vitae. Quisque et iaculis nibh.",
          image: Image.asset("assets/splash 1.png", width: 200,),
          decoration: pageDecoration
        ),
         PageViewModel(
          title: "Pembayaran Bervariasi",
          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eget varius est. Sed sodales dapibus nunc, sit amet facilisis nisl suscipit in. Nunc tincidunt sodales massa, ut semper nunc porta at. Nullam laoreet quis velit sed facilisis. Proin placerat pulvinar metus et feugiat. Morbi a convallis mauris. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec laoreet condimentum augue, sit amet aliquet sem sagittis vitae. Quisque et iaculis nibh.",
          image: Image.asset("assets/splash 2.png", width: 200,),
          decoration: pageDecoration
        ),
         PageViewModel(
          title: "Pengiriman Cepat",
          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eget varius est. Sed sodales dapibus nunc, sit amet facilisis nisl suscipit in. Nunc tincidunt sodales massa, ut semper nunc porta at. Nullam laoreet quis velit sed facilisis. Proin placerat pulvinar metus et feugiat. Morbi a convallis mauris. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec laoreet condimentum augue, sit amet aliquet sem sagittis vitae. Quisque et iaculis nibh.",
          image: Image.asset("assets/splash 3.png", width: 200,),
          decoration: pageDecoration,
          footer: Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 45),
            child: ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)
                => LoginScreen(), ));
              },
               child: Text(
                "Let's Shop",
                style: TextStyle(
                  fontSize: 18,
                ),
                ),
               style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(55),
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                )
               ),
               ),
          )
        ),
      ],
      showSkipButton: false,
      showDoneButton: false,
      showBackButton: true,
      back: Text("Back", style: TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.purple
      ),
      ),
      next: Text("Next", style: TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.purple
      ),
      ),
      onDone: (){},
      dotsDecorator: DotsDecorator(
        size: Size.square(10),
        activeSize: Size(20, 10),
        activeColor: Colors.purple,
        color: Colors.black26,
        spacing: EdgeInsets.symmetric(horizontal: 3),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        )
      ),
    );
  }
}