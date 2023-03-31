import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:to_do_app/core/config/app_color.dart';
import 'package:to_do_app/core/config/app_typography.dart';
import 'package:to_do_app/core/const/svg_string.dart';
import 'package:to_do_app/core/extensions/color_extensions.dart';
import 'package:to_do_app/core/util/stretch_overscroll.dart';
import 'package:to_do_app/core/widgets/app_bar.dart';
import 'package:to_do_app/core/widgets/app_text.dart';
import 'package:to_do_app/features/main/presentation/controller/main_controller.dart';
import 'package:to_do_app/features/main/presentation/page/create_todo_view.dart';
import 'package:to_do_app/features/main/presentation/widgets/todo_item.dart';

class MainScreen extends GetView<MainController> {
  static const routeName = "/main";

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewCtrl = controller;

    return Obx(() {
      return Scaffold(
        backgroundColor: context.color.pageBg,
        floatingActionButton: FloatingActionButton(
          backgroundColor: PrimaryColor.lemon,
          child: SvgPicture.asset(
            SvgString.icPlus,
            height: 24,
            width: 24,
          ),
          onPressed: () async {
            await _openCreate(context, viewCtrl);
            viewCtrl.getData();
          },
        ),
        body: Column(
          children: [
            CustomAppBar(
              title: "To-do List",
              titleColor: context.color.text,
              isDarkMode: viewCtrl.isDarkMode() == true,
              changeMode: (v) => viewCtrl.changeTheme(v),
            ),
            Expanded(
              child: viewCtrl.list.isNotEmpty? StretchOverScrollWidget(
                child: ListView.separated(
                  itemCount: viewCtrl.list.length,
                  padding: const EdgeInsets.all(16),
                  shrinkWrap: true,
                  separatorBuilder: (ctx, pos) => const SizedBox(height: 16),
                  itemBuilder: (ctx, pos) => TodoItem(
                    data: viewCtrl.list[pos],
                    tapCheck: (v) => viewCtrl.updateData(pos, v),
                  ),
                ),
              ): Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppText(
                    title: "Click “+” to add to-do list",
                    textStyle: AppTypography.bodyMedium(color: GreyScaleColor.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
  
  Future _openCreate(BuildContext context, MainController viewCtrl) async {
    return showDialog(
      context: context,
      builder: (_) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: CreateTodoView(controller: viewCtrl),
        ),
      ),
    );
  }
}

