import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/core/extensions/color_extensions.dart';

class AppLoading extends StatelessWidget {
  final EdgeInsets? margin;

  const AppLoading({Key? key, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: margin,
        child: SizedBox(
          height: 32,
          width: 32,
          child: Platform.isAndroid?
          CircularProgressIndicator(color: context.color.appBar):
          CupertinoActivityIndicator(radius: 16, color: context.color.appBar),
        ),
      ),
    );
  }
}
