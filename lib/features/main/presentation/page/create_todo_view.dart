import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/core/config/app_color.dart';
import 'package:to_do_app/core/config/app_typography.dart';
import 'package:to_do_app/core/const/tool_const.dart';
import 'package:to_do_app/core/extensions/color_extensions.dart';
import 'package:to_do_app/core/util/app_util.dart';
import 'package:to_do_app/core/util/stretch_overscroll.dart';
import 'package:to_do_app/core/widgets/app_button.dart';
import 'package:to_do_app/core/widgets/app_form_field.dart';
import 'package:to_do_app/core/widgets/app_text.dart';
import 'package:to_do_app/features/main/presentation/controller/main_controller.dart';

class CreateTodoView extends StatelessWidget {
  final MainController controller;

  const CreateTodoView({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ever(controller.createResult, (result) {
      if (result.message != null) {
        AppUtil.showError(context, message: result.message ?? "");
      } else if (result.data != null) {
        AppUtil.bindingInstance(() => Get.back());
      }
    });

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            height: Tools.mediaHeight(context)/2.5,
            decoration: BoxDecoration(
              color: context.color.dialog,
              borderRadius: BorderRadius.circular(12),
            ),
            child: StretchOverScrollWidget(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      title: "Task",
                      textStyle: AppTypography.bodyMedium(color: context.color.text),
                      margin: const EdgeInsets.only(bottom: 8),
                    ),
                    AppFormField(
                      hint: "Write your task",
                      radius: 50,
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      controller: controller.todoCtrl,
                      margin: const EdgeInsets.only(bottom: 16),
                      borderColor: Colors.transparent,
                      bgColor: context.color.field,
                      onChanged: (v) => controller.validate(),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: AppButton(
                            radius: 50,
                            margin: const EdgeInsets.only(right: 8),
                            title: "Cancel",
                            color: context.color.cancelBtn,
                            textStyle: AppTypography.action(
                              color: Colors.white,
                            ),
                            onPressed: () => Get.back(),
                          ),
                        ),
                        Expanded(
                          child: Obx(() {
                            return AppButton(
                              radius: 50,
                              isEnable: controller.isValid(),
                              margin: const EdgeInsets.only(left: 8),
                              title: "Add",
                              color: context.color.button,
                              textStyle: AppTypography.action(
                                color: GreyScaleColor.black,
                              ),
                              onPressed: () => controller.createData(),
                            );
                          }),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}
