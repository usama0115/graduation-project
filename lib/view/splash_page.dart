import 'dart:async';
import 'package:flutter/material.dart';
import 'package:grduation_proj/shared/enum.dart';
import 'package:grduation_proj/shared/cache_helper.dart';
import 'package:grduation_proj/view/OnboardingPage/onboarding_page.dart';
import 'package:grduation_proj/view/home_page/home_page.dart';
import 'package:grduation_proj/view/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 3),
        () => CacheHelper.getBool(key: SharedKey.isLoged)
            ? Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const MyHomePage()),
                (route) => false)
            : CacheHelper.getBool(key: SharedKey.OnboardingIsLast) ||
                    CacheHelper.getBool(key: SharedKey.isSigned)
                ? Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                    (route) => false)
                : Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => OnboardingPage()),
                    (route) => false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Text(
              //   'Welcome to Ecommerce',
              //   style: TextStyle(fontSize: 20),
              // )
              Image(image: AssetImage('assets/gif4.gif'))
            ],
          ),
        ),
      ),
    );
  }
}
