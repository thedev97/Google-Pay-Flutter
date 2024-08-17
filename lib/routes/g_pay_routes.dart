import 'package:flutter/material.dart';
import 'package:g_pay/presentation/home_screen/home.dart';
import 'package:g_pay/presentation/main_screen.dart';
import 'package:g_pay/presentation/splash/splash.dart';

class GPayRoutes {
  static const String mainScreen = '/main';
  static const String homeScreen = '/home';
  static const String splashScreen = '/splash';
  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
    splashScreen: (context) => const SplashScreen(),
    mainScreen: (context) => const MainScreen(),
    homeScreen: (context) => const HomeScreen(),
    initialRoute: (context) => const SplashScreen(),
  };
}
