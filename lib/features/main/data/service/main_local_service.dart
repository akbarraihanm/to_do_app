import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/database/boxes/todo_box.dart';
import 'package:to_do_app/features/main/data/model/main_body.dart';

class MainLocalService {
  Future<Iterable<ToDoBox>> getList() async {
    return Get.find<Box<ToDoBox>>().values;
  }

  Future<int> create(ToDoBox body) async {
    return Get.find<Box<ToDoBox>>().add(body);
  }

  Future<int> update(MainBody body) async {
    final data = await getList();
    for (var e in data) {
      if (e.key == body.key) {
        e.status = body.status;
        try {
          e.save();
          return 1;
        } catch (ex) {
          return 0;
        }
      }
    }
    return 0;
  }

  Future delete(ToDoBox body) async {
    return Get.find<Box<ToDoBox>>().delete(body.key);
  }
}