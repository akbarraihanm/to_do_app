import 'package:to_do_app/core/util/resource.dart';
import 'package:to_do_app/database/boxes/todo_box.dart';
import 'package:to_do_app/features/main/data/model/main_body.dart';
import 'package:to_do_app/features/main/domain/entity/todo_entity.dart';

abstract class MainLocalRepository {
  Future<Resource<Iterable<TodoEntity>>> getList();
  Future<Resource<int>> create(ToDoBox body);
  Future update(MainBody body);
  Future delete(ToDoBox body);
}