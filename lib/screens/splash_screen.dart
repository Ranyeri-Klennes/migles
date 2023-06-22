import 'package:flutter/material.dart';
import 'package:migles/colors.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late bool _showSplash;

  @override
  void initState() {
    super.initState();
    _showSplash = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _showSplash = false;
      });
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const LoginScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin = const Offset(0, 1);
              var end = Offset.zero;
              var curve = Curves.ease;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColorsLightMode.colorBackgroundApp,
      body: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
            top: _showSplash ? MediaQuery.of(context).size.height / 2.3 : 155,
            duration: const Duration(seconds: 1),
            child: AnimatedContainer(
              height: _showSplash ? 100 : 100,
              width: _showSplash ? 1500 : 400,
              duration: const Duration(seconds: 0),
              child: Image.asset('assets/animations/migles_animation.gif'),
            ),
          ),
        ],
      ),
    );
  }
}
