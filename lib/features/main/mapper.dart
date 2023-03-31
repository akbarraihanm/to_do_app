import 'package:to_do_app/database/boxes/todo_box.dart';
import 'package:to_do_app/features/main/domain/entity/todo_entity.dart';

extension DataTodoToEntity on ToDoBox {
  TodoEntity toEntity() => TodoEntity(
    date: date,
    status: status,
    todo: todo,
    key: key,
  );
}