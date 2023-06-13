import 'package:flutter/material.dart';
import 'package:migles/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Este widget é a raiz do seu aplicativo.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Migles',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(), 
    );
  }
}
