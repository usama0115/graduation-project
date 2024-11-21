import 'package:flutter/material.dart';
import 'package:grduation_proj/router/routes.dart';
import 'package:grduation_proj/view/OnboardingPage/onboarding_page.dart';
import 'package:grduation_proj/view/choose_image.dart';
import 'package:grduation_proj/view/home_page.dart';
import 'package:grduation_proj/view/login_page.dart';
import 'package:grduation_proj/view/signup_page.dart';
import 'package:grduation_proj/view/splash_page.dart';


Route? onGenerateRouter(RouteSettings settings) {
  switch (settings.name) {
    case AppRoute.splashScreen:
      return MaterialPageRoute(builder: (_) => const SplashPage());
    case AppRoute.onBoardingScreen:
      return MaterialPageRoute(builder: (_) => OnboardingPage());
    case AppRoute.loginScreen:
      return MaterialPageRoute(builder: (_) => const LoginScreen());
    case AppRoute.registerScreen:
      return MaterialPageRoute(builder: (_) => const RegisterScreen());
    case AppRoute.homeScreen:
      return MaterialPageRoute(builder: (_) => MyHomePage());
    case AppRoute.chooseImage:
      return MaterialPageRoute(builder: (_) => ChooseImage());
    default:
      return null;
  }

  // late Widget startScreen;
  //  Route? onGenerateRouter(RouteSettings settings){
  //    startScreen = const SplashScreen();
  //    switch(settings.name){
  //      case '/':
  //        return MaterialPageRoute(builder: (_)=> startScreen);
  //      case screens.homeScreen:
  //        return MaterialPageRoute(builder: (_)=> const HomeScreen());
  //      default:
  //        return null ;
  //    }
  //  }
}
