import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_app/core/extensions/color_extensions.dart';
import 'package:to_do_app/features/main/presentation/widgets/switch_item.dart';

import '../config/app_typography.dart';
import 'app_text.dart';


class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final Color? titleColor;
  final String? title;
  final bool isDarkMode;
  final ValueChanged<bool> changeMode;

  const CustomAppBar({
    super.key,
    this. titleColor,
    this. title,
    required this.changeMode,
    this.isDarkMode = false,
  });

  @override
  Size get preferredSize => const Size(24, 24);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AppText(
        title: title,
        textStyle: AppTypography.headLine(color: titleColor),
        overflow: TextOverflow.ellipsis,
      ),
      backgroundColor: context.color.appBar,
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: context.color.brightness,
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      automaticallyImplyLeading: true,
      actions: [
        SwitchItem(
          isDark: isDarkMode,
          onTap: (v) => changeMode.call(v),
        ),
      ],
    );
  }
}