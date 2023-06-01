import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:migles/colors.dart';

import '../components.dart';
import '../logo.dart';

class LoginScreen extends StatefulWidget {
  final String title;
  const LoginScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColorsLightMode.bgApp,
      body: Center(
        child: Column(
          children: const [
            MyLogo(),
            SizedBox(height: 25),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 50.0,
              ),
              child: NeumorphicTextField(),
            ),
            SizedBox(height: 25),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 50.0,
              ),
              child: NeumorphicTextField(),
            ),
          ],
        ),
      ),
    );
  }
}
