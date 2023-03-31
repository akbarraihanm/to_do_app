import 'package:flutter/material.dart';
import 'package:to_do_app/core/config/app_typography.dart';
import 'package:to_do_app/core/extensions/color_extensions.dart';
import 'package:to_do_app/core/widgets/app_text.dart';
import 'package:to_do_app/features/main/domain/entity/todo_entity.dart';
import 'package:to_do_app/features/main/presentation/widgets/check_item.dart';
import 'package:timeago/timeago.dart' as timeago;

class TodoItem extends StatelessWidget {
  final TodoEntity data;
  final ValueChanged<int> tapCheck;

  const TodoItem({
    Key? key,
    required this.data,
    required this.tapCheck
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.color.todoItem,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
        child: Row(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  data.status == 1?
                  CheckItem.checked(
                    onTap: (v) => tapCheck.call(v),
                  ): CheckItem.unchecked(
                    bg: context.color.todoItem,
                    outline: context.color.checkBoxOutline,
                    onTap: (v) => tapCheck.call(v),
                  ),
                  AppText(
                    title: data.todo,
                    textStyle: AppTypography.bodyMedium(
                      color: context.color.text,
                      decoration: data.status == 1? TextDecoration.lineThrough:
                          TextDecoration.none,
                    ),
                    margin: const EdgeInsets.only(left: 14),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: context.color.pageBg,
                borderRadius: BorderRadius.circular(50),
              ),
              child: AppText(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                title: timeago.format(
                  data.date ?? DateTime.now(),
                  locale: 'id_short',
                ),
                textStyle: AppTypography.bodySmall(color: context.color.timeTxt),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
