import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/core/common/route.dart';
import 'package:to_do_app/core/extensions/color_extensions.dart';
import 'package:to_do_app/database/database.dart';
import 'package:to_do_app/di/di_object.dart';
import 'package:to_do_app/features/splash/splash_screen.dart';

void main() async {
  await Hive.initFlutter();
  await DbLocator.initPref();
  AppLocator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'To-do App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        brightness: context.color.brightness,
        fontFamily: 'PlusJakartaSans',
      ),
      routes: AppRoute.routeNames(context),
      home: const SplashScreen(),
    );
  }
}
