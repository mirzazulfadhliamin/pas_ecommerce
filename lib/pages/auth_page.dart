import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_login/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pas_ecommerce/homescreen.dart';
import 'package:pas_ecommerce/onboarding.dart';
import 'package:provider/provider.dart';
import 'package:pas_ecommerce/provider/auth.dart';
import '../utils/colors/colors.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
   static const nameRoute = '/loginscreen';
}

class _LoginScreenState extends State<LoginScreen> {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _authUserLogin(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) async {
      try {
        await Provider.of<Autth>(context, listen: false)
            .login(data.name, data.password);
      } catch (err) {
        print(err);
        return err.toString();
      }
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) async {
      try {
        await Provider.of<Autth>(context, listen: false)
            .signUp(data.name, data.password);
      } catch (err) {
        print(err);
        return err.toString();
      }
      return null;
    });
  }

  Future<String?> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      theme: LoginTheme(
        primaryColor: db7_dark_yellow,
        accentColor: db1_white,
      
        titleStyle: TextStyle(
          color: db1_white,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.plaster().fontFamily,
        ),
      ),
      title: 'KENZOL',
      // logo: AssetImage('assets/images/ecorp-lightblue.png'),
      onLogin: _authUserLogin,
      onSignup: _signupUser,

      onSubmitAnimationCompleted: () {
        Provider.of<Autth>(context, listen: false).tempData();
        
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
