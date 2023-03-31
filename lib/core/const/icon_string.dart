import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/database/const/todo_string.dart';

class ImageString {
  static const _basePath = "assets/images";
  static const logo = "$_basePath/app_logo.png";
  static const logoDark = "$_basePath/app_logo_dark.png";

  static String getLogo() {
    if (Get.find<Box<bool>>().get(TodoConst.isDarkTheme) == true) return logoDark;
    return logo;
  }
}