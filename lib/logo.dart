import 'package:flutter/material.dart';

class MyLogo extends StatelessWidget {
  const MyLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, top: 80),
      child: Image.asset(
        // 'assets/icons/Migles_transp.png',
        'assets/animations/migles_animation.gif',
        height: 250,
        width: 250,
      ),
    );
  }
}