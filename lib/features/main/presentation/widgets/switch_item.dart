import 'package:flutter/material.dart';
import 'package:to_do_app/core/config/app_color.dart';

class SwitchItem extends StatelessWidget {
  final bool isDark;
  final ValueChanged<bool> onTap;

  const SwitchItem({
    Key? key,
    required this.onTap,
    required this.isDark
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            if (isDark) {
              onTap.call(false);
            } else {
              onTap.call(true);
            }
          },
          child: Container(
            width: 52,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: isDark? PrimaryColor.light: GreyScaleColor.lightGrey,
              borderRadius: BorderRadius.circular(35),
              border: isDark? null:
              Border.all(color: GreyScaleColor.darkGrey, width: 2),
            ),
            child: Align(
              alignment: isDark? Alignment.topRight: Alignment.topLeft,
              child: CircleAvatar(
                radius: 14,
                backgroundColor: isDark? PrimaryColor.lemon: Colors.white,
                child: Icon(
                  Icons.dark_mode_outlined,
                  color: isDark? GreyScaleColor.black: GreyScaleColor.lightGrey,
                  size: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}