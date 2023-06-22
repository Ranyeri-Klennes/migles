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
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  void startSplashScreen() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _showSplash = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColorsLightMode.colorBackgroundApp,
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: AnimatedOpacity(
        opacity: _showSplash ? 0.0 : 1,
        duration: const Duration(seconds: 2),
        child: buildColumn(),
      ),
    );
  }

  Widget buildColumn() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const MyLogo(),
          const SizedBox(height: 10),
          buildEmailField(),
          buildPasswordField(),
          const SizedBox(height: 100),
          buildLoginButton(),
        ],
      ),
    );
  }

  Widget buildEmailField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
      child: TextFieldNeumorphic(
        hintText: 'e-mail',
        validator: (value) {
          RegExp regex = RegExp(
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
          if (!regex.hasMatch(value!)) {
            return 'E-mail Inválido!';
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
      child: TextFieldNeumorphic(
        obscureText: true,
        hintText: 'senha',
        validator: (value) {
          RegExp regex = RegExp(r'^[a-zA-Z0-9]+$');
          if (!regex.hasMatch(value!)) {
            return 'Senha Inválida (não coloque caracteres especiais)';
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget buildLoginButton() {
    return ButtonNeumorphic(
      text: 'Entrar',
      fontSize: 50,
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProfileScreen()),
          );
        }
      },
    );
  }
}
