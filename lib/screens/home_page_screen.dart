import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  final String title;

  const HomePageScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.amber);
  }
}
