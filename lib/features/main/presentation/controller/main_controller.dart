import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/core/base/base_controller.dart';
import 'package:to_do_app/core/util/resource.dart';
import 'package:to_do_app/database/boxes/todo_box.dart';
import 'package:to_do_app/database/const/todo_string.dart';
import 'package:to_do_app/features/main/data/model/main_body.dart';
import 'package:to_do_app/features/main/domain/entity/todo_entity.dart';
import 'package:to_do_app/features/main/domain/use_case/main_use_case.dart';

class MainController extends BaseController<Iterable<TodoEntity>> {
  final MainUseCase useCase;

  MainController(this.useCase);

  final todoCtrl = TextEditingController();
  DateTime? dateTime;
  
  /// emit data & service handler
  var createResult = Resource<int>().obs;
  var list = <TodoEntity>[].obs;
  var isDarkMode = Get.find<Box<bool>>().get(TodoConst.isDarkTheme).obs;
  
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void changeTheme(bool value) {
    Get.find<Box<bool>>().put(TodoConst.isDarkTheme, value);
    isDarkMode(Get.find<Box<bool>>().get(TodoConst.isDarkTheme));
  }
  
  void getData() async {
    isLoading(true);
    result(await useCase.getList());
    if (result().data != null) {
      list(List.from(result().data ?? <TodoEntity>[]));
      list.sort((a, b) {
        final da = a.date ?? DateTime.now();
        final db = b.date ?? DateTime.now();
        if (da.isAfter(db)) {
          return 0;
        }
        return 1;
      });
    }
    isLoading(false);
  }

  void createData() async {
    final body = ToDoBox();
    body.date = dateTime ?? DateTime.now();
    body.todo = todoCtrl.text;
    createResult(await useCase.create(body));
    todoCtrl.clear();
    getData();
  }

  void validate() {
    if (todoCtrl.text.isNotEmpty) {
      isValid(true);
    } else {
      isValid(false);
    }
  }

  void updateData(int pos, int check) async {
    final data = list[pos];
    final body = MainBody(key: data.key);
    body.status = check;
    await useCase.update(body);
    getData();
  }
}