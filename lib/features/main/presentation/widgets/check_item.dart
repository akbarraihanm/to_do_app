import 'package:flutter/material.dart';
import 'package:to_do_app/core/config/app_color.dart';

class CheckItem extends StatelessWidget {
  final int _status;
  final Color outline;
  final Color bg;
  final ValueChanged<int> onTap;

  const CheckItem.unchecked({
    Key? key,
    required this.outline,
    required this.bg,
    required this.onTap
  }): _status = 1, super(key: key);
  const CheckItem.checked({
    Key? key,
    this.outline = Colors.white,
    this.bg = Colors.white,
    required this.onTap,
  }) : _status = 2, super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (_status) {
      case 1: {
        return InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () => onTap.call(1),
          child: CircleAvatar(
            radius: 10,
            backgroundColor: outline,
            child: CircleAvatar(
              radius: 8,
              backgroundColor: bg,
            ),
          ),
        );
      }
      case 2: {
        return InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () => onTap.call(2),
          child: const CircleAvatar(
            radius: 10,
            backgroundColor: PrimaryColor.lemon,
            child: Icon(
              Icons.check,
              size: 10,
              color: GreyScaleColor.black,
            ),
          ),
        );
      }
      default: {
        return const SizedBox();
      }
    }
  }
}
