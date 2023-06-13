import 'package:flutter/material.dart';
import 'package:migles/colors.dart';
import 'package:migles/components/button_neumorphic.dart';
import '../components/textField_neumorphic.dart';
import '../logo.dart';
import 'profile_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showSplash = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _showSplash = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColorsLightMode.colorBackgroundApp,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                const MyLogo(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 42),
                  child: TextFieldNeumorphic(
                    hintText: 'email',
                    validator: (value) {
                      RegExp regex = RegExp(
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                      if (!regex.hasMatch(value!)) {
                        return 'Enter Valid Email';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 27, horizontal: 42),
                  child: TextFieldNeumorphic(
                    obscureText: true,
                    hintText: 'senha',
                    validator: (value) {
                      RegExp regex = RegExp(r'^[a-zA-Z0-9]+$');
                      if (!regex.hasMatch(value!)) {
                        return 'Enter a valid password (No special characters)';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(height: 100),
                ButtonNeumorphic(
                  text: 'Entrar',
                  fontSize: 50,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileScreen()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
