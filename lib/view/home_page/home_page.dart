import 'package:flutter/material.dart';
import 'package:grduation_proj/view/home_page/body.dart';
import 'package:grduation_proj/view/home_page/drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        drawer: const drawer(),
        body: const Body(),
      ),
    );
  }
}
