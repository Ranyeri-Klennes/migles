import 'package:flutter/material.dart';
import 'package:migles/colors.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(title: 'Migles'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColorsLightMode.bgApp,
      body: Center(
        child: Image.asset('assets/animations/migles_animation.gif'),
      ),
    );
  }
}

//  Melhorar o Splash :
// https://developer.android.com/develop/ui/views/launch/splash-screen