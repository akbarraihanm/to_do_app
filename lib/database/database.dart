import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/database/boxes/todo_box.dart';
import 'package:to_do_app/database/const/todo_string.dart';

class DbLocator {
  /// init pref box
  static Future initPref() async {
    Box<bool> box = await Hive.openBox(TodoConst.pref);
    Get.put<Box<bool>>(box);
  }

  static void init() {
    /// Register adapters
    Hive.registerAdapter(ToDoBoxAdapter());
  }

  static Future openBoxes() async {
    /// Todo Box
    Box<ToDoBox> box = await Hive.openBox(TodoConst.todos);
    Get.put<Box<ToDoBox>>(box);
  }
}