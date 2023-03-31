import 'package:flutter/material.dart';

abstract class AppColor {
  Color get appBar;
  Color get button;
  Color get accent;
  Color get text;
  Color get txtDone;
  Color get todoItem;
  Color get checkBoxOutline;
  Color get timeBg;
  Color get timeTxt;
  Color get dialogTitle;
  Color get dialogDesc;
  Color get fieldTxt;
  Color get pageBg;
  Color get splash;
  Color get field;
  Color get cancelBtn;
  Color get dialog;
  Brightness get brightness;

  static AppColor color(BuildContext context, bool isDark) {
    return !isDark? LightModeColor(): DarkModeColor();
  }
}

class LightModeColor implements AppColor {
  @override
  Color get accent => AccentColor.red;

  @override
  Color get appBar => PrimaryColor.lemon;

  @override
  Color get button => PrimaryColor.lemon;

  @override
  Color get checkBoxOutline => GreyScaleColor.black;

  @override
  Color get dialogDesc => GreyScaleColor.darkGrey;

  @override
  Color get dialogTitle => GreyScaleColor.black;

  @override
  Color get fieldTxt => GreyScaleColor.black;

  @override
  Color get text => GreyScaleColor.black;

  @override
  Color get timeBg => Colors.white;

  @override
  Color get timeTxt => AccentColor.blue;

  @override
  Color get todoItem => GreyScaleColor.lightGrey;

  @override
  Color get txtDone => GreyScaleColor.darkGrey;

  @override
  Color get pageBg => Colors.white;

  @override
  Brightness get brightness => Brightness.light;

  @override
  Color get splash => PrimaryColor.lemon;

  @override
  Color get field => GreyScaleColor.lightGrey;

  @override
  Color get cancelBtn => GreyScaleColor.black;

  @override
  Color get dialog => Colors.white;

}

class DarkModeColor implements AppColor {
  @override
  Color get accent => AccentColor.red;

  @override
  Color get appBar => GreyScaleColor.black;

  @override
  Color get button => PrimaryColor.lemon;

  @override
  Color get checkBoxOutline => Colors.white;

  @override
  Color get dialogDesc => GreyScaleColor.black;

  @override
  Color get dialogTitle => Colors.white;

  @override
  Color get fieldTxt => Colors.white;

  @override
  Color get text => Colors.white;

  @override
  Color get timeBg => const Color(0xff1e1e1e);

  @override
  Color get timeTxt => PrimaryColor.lemon;

  @override
  Color get todoItem => GreyScaleColor.black;

  @override
  Color get txtDone => GreyScaleColor.grey;

  @override
  Color get pageBg => const Color(0xff1e1e1e);

  @override
  Brightness get brightness => Brightness.dark;

  @override
  Color get splash => const Color(0xff1e1e1e);

  @override
  Color get field => GreyScaleColor.darkGrey;

  @override
  Color get cancelBtn => GreyScaleColor.grey;

  @override
  Color get dialog => GreyScaleColor.black;

}

class PrimaryColor {
  static const Color lemon = Color(0xffF9E745);
  static const Color dark = Color(0xffC7A807);
  static const Color light = Color(0xffFFFACC);
}

class AccentColor {
  static const Color red = Color(0xffFA3333);
  static const Color blue = Color(0xff3365FA);
  static const Color green = Color(0xff56CE38);
  static const Color orange = Color(0xffFA9E33);
}

class GreyScaleColor {
  static const Color black = Color(0xff333333);
  static const Color darkGrey = Color(0xff6B6B6B);
  static const Color grey = Color(0xffADADAD);
  static const Color lightGrey = Color(0xfff5f5f5);
}