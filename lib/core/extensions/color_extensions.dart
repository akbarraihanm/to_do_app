import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/core/config/app_color.dart';
import 'package:to_do_app/database/const/todo_string.dart';

extension GetAppColor on BuildContext {
  AppColor get color => AppColor.color(
    this,
    Get.find<Box<bool>>().get(TodoConst.isDarkTheme) == true,
  );
}