import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/core/const/icon_string.dart';
import 'package:to_do_app/core/extensions/color_extensions.dart';
import 'package:to_do_app/features/main/presentation/page/main_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/splash";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2250), () {
      Get.offAndToNamed(MainScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.splash,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Image.asset(
            ImageString.getLogo(),
            height: 55,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
