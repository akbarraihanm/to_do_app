import 'package:flutter/material.dart';
import 'package:to_do_app/features/main/presentation/page/main_screen.dart';
import 'package:to_do_app/features/splash/splash_screen.dart';

class AppRoute {
  static Map<String, WidgetBuilder> routeNames(BuildContext context) {
    return {
      SplashScreen.routeName: (context) => const SplashScreen(),
      MainScreen.routeName: (context) => const MainScreen(),
    };
  }
}
